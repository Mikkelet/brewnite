import type { ApiResponse, PackageType } from '~/types'

export function usePackages() {
  const search = ref('')
  const debouncedSearch = ref('')
  const typeFilter = ref<PackageType>('all')
  const currentPage = ref(1)
  const pageSize = 50

  let debounceTimer: ReturnType<typeof setTimeout> | null = null
  watch(search, (val) => {
    if (debounceTimer) clearTimeout(debounceTimer)
    debounceTimer = setTimeout(() => {
      debouncedSearch.value = val
    }, 500)
  })

  const { data: apiData, pending } = useFetch<ApiResponse>('/api/packages', {
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

  // Reset page when search or type changes
  watch([debouncedSearch, typeFilter], () => {
    currentPage.value = 1
  })

  return {
    search,
    typeFilter,
    currentPage,
    isSearching,
    pending,
    packages,
    totalPackages,
    totalPages,
  }
}
