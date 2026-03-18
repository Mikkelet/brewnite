<template>
  <div class="app">
    <header>
      <h1>🍺 Brewnite</h1>
      <p class="subtitle">Select homebrew packages and generate an install script</p>
    </header>

    <main>
      <div class="controls">
        <div class="search-wrapper">
          <input
            v-model="search"
            type="text"
            class="search"
            :placeholder="`Search ${totalPackages.toLocaleString()} packages...`"
          />
          <span v-if="isSearching" class="search-spinner"></span>
        </div>
        <div class="control-buttons">
          <select v-model="typeFilter" class="type-select">
            <option value="all">All</option>
            <option value="formulae">Formulae</option>
            <option value="casks">Casks</option>
          </select>
          <span class="selected-count">{{ selectedPackages.size }} selected</span>
          <button class="btn btn-small" @click="clearAll" :disabled="selectedPackages.size === 0">
            Clear
          </button>
        </div>
      </div>

      <div v-if="pending" class="loading">Loading packages...</div>

      <div v-else class="package-list">
        <div class="packages">
          <label
            v-for="pkg in packages"
            :key="pkg.name"
            class="package"
            :class="{ selected: selectedPackages.has(pkg.name) }"
          >
            <input
              type="checkbox"
              :checked="selectedPackages.has(pkg.name)"
              @change="togglePackage(pkg)"
            />
            <div class="package-info">
              <span class="package-name">{{ pkg.name }}</span>
              <span v-if="pkg.cask" class="cask-badge">cask</span>
              <span v-if="pkg.version" class="package-version">{{ pkg.version }}</span>
              <span class="package-desc">{{ pkg.description }}</span>
            </div>
          </label>
        </div>

        <div v-if="packages.length === 0" class="no-results">
          No packages match "{{ search }}"
        </div>

        <div v-if="totalPages > 1" class="pagination">
          <button class="btn btn-small btn-ghost" @click="currentPage--" :disabled="currentPage <= 1">← Prev</button>
          <span class="page-info">Page {{ currentPage }} of {{ totalPages }} ({{ totalPackages.toLocaleString() }} results)</span>
          <button class="btn btn-small btn-ghost" @click="currentPage++" :disabled="currentPage >= totalPages">Next →</button>
        </div>
      </div>

      <div v-if="selectedPackages.size > 0" class="script-section">
        <div class="script-header">
          <h2>Install Script</h2>
          <div class="script-actions">
            <button class="btn btn-ghost btn-small" @click="copyLink">
              {{ linkCopied ? '✓ Link copied!' : 'Share link' }}
            </button>
            <button class="btn" @click="copyScript">
              {{ copied ? '✓ Copied!' : 'Copy script' }}
            </button>
          </div>
        </div>
        <pre class="script"><code>{{ generatedScript }}</code></pre>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
interface BrewPackage {
  name: string
  description: string
  cask: boolean
  homepage?: string | null
  version?: string | null
}

interface ApiResponse {
  packages: BrewPackage[]
  total: number
  page: number
  limit: number
  totalPages: number
}

const route = useRoute()
const router = useRouter()

const selectedPackages = ref(new Set<string>())
const selectedMeta = ref(new Map<string, BrewPackage>())
const copied = ref(false)
const linkCopied = ref(false)
const search = ref('')
const debouncedSearch = ref('')
const typeFilter = ref<'all' | 'formulae' | 'casks'>('all')
const currentPage = ref(1)
const pageSize = 50

let debounceTimer: ReturnType<typeof setTimeout> | null = null
watch(search, (val) => {
  if (debounceTimer) clearTimeout(debounceTimer)
  debounceTimer = setTimeout(() => {
    debouncedSearch.value = val
  }, 500)
})

const { data: apiData, pending } = await useFetch<ApiResponse>('/api/packages', {
  query: computed(() => ({
    search: debouncedSearch.value || undefined,
    type: typeFilter.value,
    page: currentPage.value,
    limit: pageSize,
  })),
  watch: [debouncedSearch, typeFilter, currentPage],
})

const isSearching = computed(() => search.value !== debouncedSearch.value || pending.value)
const packages = computed(() => apiData.value?.packages || [])
const totalPackages = computed(() => apiData.value?.total || 0)
const totalPages = computed(() => apiData.value?.totalPages || 1)

// Restore selections from URL query on load
onMounted(async () => {
  const pkgsParam = route.query.pkgs
  if (!pkgsParam) return
  const names = (typeof pkgsParam === 'string' ? pkgsParam : pkgsParam[0] || '').split(',').filter(Boolean)
  if (names.length === 0) return

  // Fetch all selected packages by name to get their metadata
  for (const name of names) {
    const res = await $fetch<ApiResponse>('/api/packages', { query: { search: name, limit: 100 } })
    const found = res.packages.find((p: BrewPackage) => p.name === name)
    if (found) {
      selectedPackages.value.add(name)
      selectedMeta.value.set(name, found)
    }
  }
  triggerRef(selectedPackages)
})

// Sync selections to URL
function updateUrl() {
  const names = [...selectedPackages.value].sort()
  const query = names.length > 0 ? { pkgs: names.join(',') } : {}
  router.replace({ query })
}

// Reset page when search or type changes
watch([debouncedSearch, typeFilter], () => {
  currentPage.value = 1
})

function togglePackage(pkg: BrewPackage) {
  if (selectedPackages.value.has(pkg.name)) {
    selectedPackages.value.delete(pkg.name)
    selectedMeta.value.delete(pkg.name)
  } else {
    selectedPackages.value.add(pkg.name)
    selectedMeta.value.set(pkg.name, pkg)
  }
  triggerRef(selectedPackages)
  updateUrl()
}

function clearAll() {
  selectedPackages.value.clear()
  selectedMeta.value.clear()
  triggerRef(selectedPackages)
  updateUrl()
}

const generatedScript = computed(() => {
  const formulae: string[] = []
  const casks: string[] = []

  for (const [name, pkg] of selectedMeta.value) {
    if (pkg.cask) {
      casks.push(name)
    } else {
      formulae.push(name)
    }
  }

  formulae.sort()
  casks.sort()

  let script = `#!/bin/bash

# Brewnite install script
# Generated on ${new Date().toLocaleDateString()}

set -e

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update
`

  if (formulae.length > 0) {
    script += `
# Install formulae
echo "Installing formulae..."
brew install \\
${formulae.map(f => `  ${f}`).join(' \\\n')}
`
  }

  if (casks.length > 0) {
    script += `
# Install casks
echo "Installing casks..."
brew install --cask \\
${casks.map(c => `  ${c}`).join(' \\\n')}
`
  }

  script += `
echo "Done! All packages installed."
`

  return script
})

async function copyScript() {
  await navigator.clipboard.writeText(generatedScript.value)
  copied.value = true
  setTimeout(() => { copied.value = false }, 2000)
}

async function copyLink() {
  const url = window.location.href
  await navigator.clipboard.writeText(url)
  linkCopied.value = true
  setTimeout(() => { linkCopied.value = false }, 2000)
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  background: #0a0a0a;
  color: #e0e0e0;
  min-height: 100vh;
}

.app {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 1rem;
}

header {
  text-align: center;
  margin-bottom: 2rem;
}

header h1 {
  font-size: 2.5rem;
  color: #f5a623;
  margin-bottom: 0.5rem;
}

.subtitle {
  color: #888;
  font-size: 1.1rem;
}

.controls {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  align-items: center;
  margin-bottom: 1rem;
  padding: 0.75rem 1rem;
  background: #1a1a1a;
  border-radius: 8px;
}

.search-wrapper {
  flex: 1;
  min-width: 200px;
  position: relative;
}

.search {
  width: 100%;
  padding: 0.5rem 2rem 0.5rem 0.75rem;
  background: #0a0a0a;
  border: 1px solid #333;
  border-radius: 6px;
  color: #e0e0e0;
  font-size: 0.9rem;
  outline: none;
}

.search:focus {
  border-color: #f5a623;
}

.search-spinner {
  position: absolute;
  right: 0.6rem;
  top: 50%;
  transform: translateY(-50%);
  width: 14px;
  height: 14px;
  border: 2px solid #333;
  border-top-color: #f5a623;
  border-radius: 50%;
  animation: spin 0.6s linear infinite;
}

@keyframes spin {
  to { transform: translateY(-50%) rotate(360deg); }
}

.control-buttons {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.selected-count {
  color: #f5a623;
  font-weight: 600;
  font-size: 0.85rem;
}

.loading {
  text-align: center;
  padding: 3rem;
  color: #888;
}

.no-results {
  text-align: center;
  padding: 3rem;
  color: #666;
}

.category {
  margin-bottom: 0.5rem;
  background: #141414;
  border-radius: 8px;
  border: 1px solid #222;
  overflow: hidden;
}

.category-header {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.75rem 1rem;
  cursor: pointer;
  user-select: none;
}

.category-header:hover {
  background: #1a1a1a;
}

.category-header h2 {
  font-size: 1rem;
  font-weight: 600;
  flex: 1;
}

.category-count {
  color: #666;
  font-size: 0.85rem;
}

.chevron {
  font-size: 0.7rem;
  color: #666;
  transition: transform 0.15s;
}

.chevron.open {
  transform: rotate(90deg);
}

.packages {
  padding: 0.25rem 0.5rem 0.5rem;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 0.25rem;
}

.package {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.5rem 0.75rem;
  border-radius: 6px;
  cursor: pointer;
  transition: background 0.1s;
}

.package:hover {
  background: #1e1e1e;
}

.package.selected {
  background: #1a1400;
  border: 1px solid #f5a62333;
}

.package input[type="checkbox"] {
  accent-color: #f5a623;
  width: 16px;
  height: 16px;
  flex-shrink: 0;
}

.package-info {
  display: flex;
  flex-wrap: wrap;
  align-items: baseline;
  gap: 0.35rem;
  min-width: 0;
}

.package-name {
  font-weight: 600;
  font-size: 0.9rem;
  color: #fff;
}

.package-desc {
  font-size: 0.8rem;
  color: #777;
}

.type-select {
  background: #0a0a0a;
  border: 1px solid #333;
  border-radius: 6px;
  color: #e0e0e0;
  padding: 0.35rem 0.5rem;
  font-size: 0.85rem;
  outline: none;
}

.type-select:focus {
  border-color: #f5a623;
}

.package-version {
  font-size: 0.7rem;
  color: #555;
  font-family: 'SF Mono', 'Fira Code', monospace;
}

.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
}

.page-info {
  color: #888;
  font-size: 0.85rem;
}

.package-list {
  background: #141414;
  border-radius: 8px;
  border: 1px solid #222;
  overflow: hidden;
}

.cask-badge {
  font-size: 0.65rem;
  background: #2a2000;
  color: #f5a623;
  padding: 0.1rem 0.4rem;
  border-radius: 4px;
  font-weight: 600;
  text-transform: uppercase;
}

.btn {
  background: #f5a623;
  color: #000;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 6px;
  font-weight: 600;
  cursor: pointer;
  font-size: 0.85rem;
}

.btn:hover {
  background: #e6951a;
}

.btn:disabled {
  opacity: 0.4;
  cursor: default;
}

.btn-small {
  padding: 0.35rem 0.75rem;
  font-size: 0.8rem;
}

.btn-ghost {
  background: transparent;
  color: #888;
  border: 1px solid #333;
}

.btn-ghost:hover {
  background: #222;
  color: #ccc;
}

.btn-tiny {
  padding: 0.2rem 0.5rem;
  font-size: 0.7rem;
  background: #333;
  color: #ccc;
}

.btn-tiny:hover {
  background: #444;
}

.script-section {
  margin-top: 2rem;
  background: #141414;
  border: 1px solid #222;
  border-radius: 8px;
  overflow: hidden;
}

.script-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem 1rem;
  border-bottom: 1px solid #222;
}

.script-header h2 {
  font-size: 1rem;
}

.script-actions {
  display: flex;
  gap: 0.5rem;
}

.script {
  padding: 1rem;
  overflow-x: auto;
  font-size: 0.85rem;
  line-height: 1.5;
}

.script code {
  color: #a8d8a8;
  font-family: 'SF Mono', 'Fira Code', 'Cascadia Code', monospace;
}
</style>
