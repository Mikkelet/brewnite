import type { ApiResponse, BrewPackage } from '~/types'
import type { Preset } from '~/composables/usePresets'

// Module-level shared state
const selectedNames = ref<string[]>([])
const metaMap = ref<Record<string, BrewPackage>>({})
const activePreset = ref<string | null>(null)

export function useSelection() {
  const route = useRoute()
  const router = useRouter()

  const selectedPackages = computed(() => new Set(selectedNames.value))

  const selectedMeta = computed(() => {
    const map = new Map<string, BrewPackage>()
    for (const name of selectedNames.value) {
      if (metaMap.value[name]) {
        map.set(name, metaMap.value[name])
      }
    }
    return map
  })

  const selectedPackagesList = computed(() =>
    selectedNames.value
      .map(name => metaMap.value[name])
      .filter(Boolean)
      .sort((a, b) => a.name.localeCompare(b.name))
  )

  // Restore selections from URL query on load
  onMounted(async () => {
    const pkgsParam = route.query.pkgs
    if (!pkgsParam) return
    const names = (typeof pkgsParam === 'string' ? pkgsParam : pkgsParam[0] || '').split(',').filter(Boolean)
    if (names.length === 0) return

    const newNames: string[] = []
    const newMeta: Record<string, BrewPackage> = {}
    for (const name of names) {
      const res = await $fetch<ApiResponse>('/api/packages', { query: { search: name, limit: 100 } })
      const found = res.packages.find((p: BrewPackage) => p.name === name)
      if (found) {
        newNames.push(name)
        newMeta[name] = found
      }
    }
    selectedNames.value = newNames
    metaMap.value = newMeta
  })

  function syncUrl() {
    const names = [...selectedNames.value].sort()
    const query = names.length > 0 ? { pkgs: names.join(',') } : {}
    router.replace({ query })
  }

  function togglePackage(pkg: BrewPackage) {
    const idx = selectedNames.value.indexOf(pkg.name)
    if (idx >= 0) {
      selectedNames.value = selectedNames.value.filter(n => n !== pkg.name)
      const { [pkg.name]: _, ...rest } = metaMap.value
      metaMap.value = rest
    } else {
      selectedNames.value = [...selectedNames.value, pkg.name]
      metaMap.value = { ...metaMap.value, [pkg.name]: pkg }
    }
    activePreset.value = null
    syncUrl()
  }

  function clearAll() {
    selectedNames.value = []
    metaMap.value = {}
    activePreset.value = null
    syncUrl()
  }

  function applyPreset(preset: Preset) {
    if (activePreset.value === preset.id) {
      clearAll()
      return
    }

    activePreset.value = preset.id
    const newNames: string[] = []
    const newMeta: Record<string, BrewPackage> = {}
    for (const pkg of preset.packages) {
      newNames.push(pkg.name)
      newMeta[pkg.name] = {
        name: pkg.name,
        description: '',
        cask: pkg.cask,
      }
    }
    selectedNames.value = newNames
    metaMap.value = newMeta
    syncUrl()
  }

  return {
    selectedPackages,
    selectedMeta,
    selectedPackagesList,
    activePreset,
    togglePackage,
    clearAll,
    applyPreset,
  }
}
