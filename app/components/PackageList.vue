<template>

  <div class="package-list">
    <div class="packages">
      <PackageCard
        v-for="pkg in packages"
        :key="pkg.name"
        :pkg="pkg"
        :is-selected="selectedPackages.has(pkg.name)"
        @toggle="$emit('toggle', pkg)"
      />
    </div>

    <div v-if="packages.length === 0" class="no-results">
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

defineProps<{
  packages: BrewPackage[]
  selectedPackages: Set<string>
  pending: boolean
  search: string
  currentPage: number
  totalPages: number
  totalPackages: number
}>()

defineEmits<{
  toggle: [pkg: BrewPackage]
  prevPage: []
  nextPage: []
}>()
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
