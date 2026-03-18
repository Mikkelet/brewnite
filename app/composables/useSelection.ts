import type { ApiResponse, BrewPackage } from '~/types'

export function useSelection() {
  const route = useRoute()
  const router = useRouter()

  const selectedPackages = ref(new Set<string>())
  const selectedMeta = ref(new Map<string, BrewPackage>())

  // Restore selections from URL query on load
  onMounted(async () => {
    const pkgsParam = route.query.pkgs
    if (!pkgsParam) return
    const names = (typeof pkgsParam === 'string' ? pkgsParam : pkgsParam[0] || '').split(',').filter(Boolean)
    if (names.length === 0) return

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

  function syncUrl() {
    const names = [...selectedPackages.value].sort()
    const query = names.length > 0 ? { pkgs: names.join(',') } : {}
    router.replace({ query })
  }

  function togglePackage(pkg: BrewPackage) {
    if (selectedPackages.value.has(pkg.name)) {
      selectedPackages.value.delete(pkg.name)
      selectedMeta.value.delete(pkg.name)
    } else {
      selectedPackages.value.add(pkg.name)
      selectedMeta.value.set(pkg.name, pkg)
    }
    triggerRef(selectedPackages)
    syncUrl()
  }

  function clearAll() {
    selectedPackages.value.clear()
    selectedMeta.value.clear()
    triggerRef(selectedPackages)
    syncUrl()
  }

  return {
    selectedPackages,
    selectedMeta,
    togglePackage,
    clearAll,
  }
}
