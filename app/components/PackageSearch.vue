<template>
  <div class="controls">
    <div class="search-wrapper">
      <input
        :value="search"
        @input="$emit('update:search', ($event.target as HTMLInputElement).value)"
        type="text"
        class="search"
        :placeholder="`Search ${totalPackages.toLocaleString()} packages...`"
      />
      <span v-if="isSearching" class="search-spinner"></span>
    </div>
    <div class="control-buttons">
      <select
        :value="typeFilter"
        @change="$emit('update:typeFilter', ($event.target as HTMLSelectElement).value)"
        class="type-select"
      >
        <option value="all">All</option>
        <option value="formulae">Formulae</option>
        <option value="casks">Casks</option>
      </select>
      <span class="selected-count">{{ selectedCount }} selected</span>
      <button class="btn btn-small" @click="$emit('clear')" :disabled="selectedCount === 0">
        Clear
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  search: string
  typeFilter: string
  totalPackages: number
  selectedCount: number
  isSearching: boolean
}>()

defineEmits<{
  'update:search': [value: string]
  'update:typeFilter': [value: string]
  clear: []
}>()
</script>

<style scoped>
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
</style>
