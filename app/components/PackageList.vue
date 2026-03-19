<template>

  <div class="package-list">
    <!-- Matching presets shown when searching -->
    <div v-if="showPresets && search && matchingPresets.length > 0" class="preset-results">
      <h3 class="preset-results-title">Presets</h3>
      <div class="preset-results-grid">
        <button
          v-for="preset in matchingPresets"
          :key="preset.id"
          class="preset-result"
          :class="{ active: activePreset === preset.id }"
          @click="$emit('selectPreset', preset)"
        >
          <span class="preset-result-icon">{{ preset.icon }}</span>
          <div class="preset-result-info">
            <span class="preset-result-name">{{ preset.name }}</span>
            <span class="preset-result-desc">{{ preset.description }}</span>
            <span class="preset-result-count">{{ preset.packages.length }} packages</span>
          </div>
        </button>
      </div>
    </div>

    <div v-if="showPresets && search && matchingPresets.length > 0 && packages.length > 0" class="section-divider">
      <h3 class="section-title">Packages</h3>
    </div>

    <div class="packages">
      <PackageCard
        v-for="pkg in packages"
        :key="pkg.name"
        :pkg="pkg"
        :is-selected="selectedPackages.has(pkg.name)"
        @toggle="$emit('toggle', pkg)"
      />
    </div>

    <div v-if="packages.length === 0 && (!search || matchingPresets.length === 0)" class="no-results">
      No packages match "{{ search }}"
    </div>

    <div v-if="totalPages > 1" class="pagination">
      <button class="btn btn-small btn-ghost" @click="$emit('prevPage')" :disabled="currentPage <= 1">
        ← Prev
      </button>
      <span class="page-info">
        Page {{ currentPage }} of {{ totalPages }} ({{ totalPackages.toLocaleString() }} results)
      </span>
      <button class="btn btn-small btn-ghost" @click="$emit('nextPage')" :disabled="currentPage >= totalPages">
        Next →
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { BrewPackage } from '~/types'
import type { Preset } from '~/composables/usePresets'

const props = defineProps<{
  packages: BrewPackage[]
  selectedPackages: Set<string>
  pending: boolean
  search: string
  currentPage: number
  totalPages: number
  totalPackages: number
  presets: Preset[]
  activePreset: string | null
  showPresets: boolean
}>()

defineEmits<{
  toggle: [pkg: BrewPackage]
  prevPage: []
  nextPage: []
  selectPreset: [preset: Preset]
}>()

const matchingPresets = computed(() => {
  const q = props.search.toLowerCase().trim()
  if (!q) return []
  return props.presets.filter(p =>
    p.name.toLowerCase().includes(q) ||
    p.description.toLowerCase().includes(q) ||
    p.packages.some(pkg => pkg.name.toLowerCase().includes(q))
  )
})
</script>

<style scoped>
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

.package-list {
  background: #141414;
  border-radius: 8px;
  border: 1px solid #222;
  overflow: hidden;
}

.packages {
  padding: 0.25rem 0.5rem 0.5rem;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 0.25rem;
}

/* Preset search results */
.preset-results {
  padding: 0.75rem 0.75rem 0.5rem;
}

.preset-results-title {
  font-size: 0.75rem;
  font-weight: 600;
  color: #666;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: 0.5rem;
}

.preset-results-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 0.5rem;
}

.preset-result {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.6rem 0.75rem;
  background: #1a1400;
  border: 1px solid #332800;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.15s;
  text-align: left;
  color: #e0e0e0;
  font-family: inherit;
}

.preset-result:hover {
  border-color: #f5a623;
  background: #221a00;
}

.preset-result.active {
  border-color: #f5a623;
  background: #2a1f00;
}

.preset-result-icon {
  font-size: 1.5rem;
  flex-shrink: 0;
}

.preset-result-info {
  display: flex;
  flex-direction: column;
  gap: 0.1rem;
  min-width: 0;
}

.preset-result-name {
  font-weight: 600;
  font-size: 0.85rem;
  color: #fff;
}

.preset-result-desc {
  font-size: 0.75rem;
  color: #999;
}

.preset-result-count {
  font-size: 0.7rem;
  color: #f5a623;
}

/* Section divider */
.section-divider {
  padding: 0.5rem 0.75rem 0;
}

.section-title {
  font-size: 0.75rem;
  font-weight: 600;
  color: #666;
  text-transform: uppercase;
  letter-spacing: 0.05em;
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

.btn {
  background: #f5a623;
  color: #000;
  border: none;
  padding: 0.35rem 0.75rem;
  border-radius: 6px;
  font-weight: 600;
  cursor: pointer;
  font-size: 0.8rem;
}

.btn:hover {
  background: #e6951a;
}

.btn:disabled {
  opacity: 0.4;
  cursor: default;
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
</style>
