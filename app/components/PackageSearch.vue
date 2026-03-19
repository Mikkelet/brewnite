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
    <div class="filter-row">
      <label class="filter-check" :class="{ active: showFormulae }">
        <input type="checkbox" :checked="showFormulae" @change="$emit('update:showFormulae', !showFormulae)" />
        <span>Formulae</span>
      </label>
      <label class="filter-check" :class="{ active: showCasks }">
        <input type="checkbox" :checked="showCasks" @change="$emit('update:showCasks', !showCasks)" />
        <span>Casks</span>
      </label>
      <label class="filter-check" :class="{ active: showPresets }">
        <input type="checkbox" :checked="showPresets" @change="$emit('update:showPresets', !showPresets)" />
        <span>Presets</span>
      </label>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  search: string
  showFormulae: boolean
  showCasks: boolean
  showPresets: boolean
  totalPackages: number
  isSearching: boolean
}>()

defineEmits<{
  'update:search': [value: string]
  'update:showFormulae': [value: boolean]
  'update:showCasks': [value: boolean]
  'update:showPresets': [value: boolean]
}>()
</script>

<style scoped>
.controls {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  margin-bottom: 0.75rem;
  padding: 0.6rem 0.75rem;
  background: #1a1a1a;
  border-radius: 8px;
}

.search-wrapper {
  flex: 1;
  min-width: 0;
  position: relative;
}

.search {
  width: 100%;
  padding: 0.6rem 2rem 0.6rem 0.75rem;
  background: #0a0a0a;
  border: 1px solid #333;
  border-radius: 6px;
  color: #e0e0e0;
  font-size: 16px; /* prevents iOS zoom on focus */
  outline: none;
  -webkit-appearance: none;
}

.search:focus {
  border-color: #f5a623;
}

@media (min-width: 768px) {
  .controls {
    gap: 0.6rem;
    margin-bottom: 1rem;
    padding: 0.75rem 1rem;
  }

  .search {
    font-size: 0.9rem;
    padding: 0.5rem 2rem 0.5rem 0.75rem;
  }
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

.filter-row {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  flex-wrap: wrap;
}

.filter-check {
  display: flex;
  align-items: center;
  gap: 0.35rem;
  cursor: pointer;
  font-size: 0.85rem;
  color: #777;
  transition: color 0.15s;
  user-select: none;
}

.filter-check.active {
  color: #e0e0e0;
}

.filter-check input[type="checkbox"] {
  accent-color: #f5a623;
  width: 14px;
  height: 14px;
  cursor: pointer;
}

</style>
