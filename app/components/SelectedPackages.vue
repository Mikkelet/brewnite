<template>
  <div v-if="packages.length > 0" class="selected-section">
    <div class="selected-header">
      <h2>{{ packages.length }} selected</h2>
      <button class="btn btn-small btn-ghost" @click="$emit('clearAll')">Clear all</button>
    </div>
    <div class="selected-chips">
      <button
        v-for="pkg in packages"
        :key="pkg.name"
        class="chip"
        @click="$emit('remove', pkg)"
      >
        <span v-if="pkg.cask" class="chip-cask">cask</span>
        <span class="chip-name">{{ pkg.name }}</span>
        <span class="chip-x">&times;</span>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { BrewPackage } from '~/types'

defineProps<{
  packages: BrewPackage[]
}>()

defineEmits<{
  remove: [pkg: BrewPackage]
  clearAll: []
}>()
</script>

<style scoped>
.selected-section {
  margin-bottom: 1rem;
  padding: 0.75rem 1rem;
  background: #141414;
  border: 1px solid #222;
  border-radius: 8px;
}

.selected-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.5rem;
}

.selected-header h2 {
  font-size: 0.9rem;
  font-weight: 600;
  color: #f5a623;
}

.selected-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 0.35rem;
}

.chip {
  display: inline-flex;
  align-items: center;
  gap: 0.3rem;
  padding: 0.25rem 0.5rem;
  background: #1a1400;
  border: 1px solid #f5a62333;
  border-radius: 5px;
  color: #e0e0e0;
  font-size: 0.8rem;
  cursor: pointer;
  font-family: inherit;
  transition: all 0.1s;
}

.chip:hover {
  background: #2a1a00;
  border-color: #f5a62366;
}

.chip-cask {
  font-size: 0.6rem;
  background: #2a2000;
  color: #f5a623;
  padding: 0.05rem 0.3rem;
  border-radius: 3px;
  font-weight: 600;
  text-transform: uppercase;
}

.chip-name {
  font-weight: 500;
}

.chip-x {
  color: #666;
  font-size: 1rem;
  line-height: 1;
  margin-left: 0.1rem;
}

.chip:hover .chip-x {
  color: #e55;
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
