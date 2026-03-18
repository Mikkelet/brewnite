<template>
  <label class="package" :class="{ selected: isSelected }">
    <input
      type="checkbox"
      :checked="isSelected"
      @change="$emit('toggle')"
    />
    <div class="package-info">
      <span class="package-name">{{ pkg.name }}</span>
      <span v-if="pkg.cask" class="cask-badge">cask</span>
      <span v-if="pkg.version" class="package-version">{{ pkg.version }}</span>
      <span class="package-desc">{{ pkg.description }}</span>
    </div>
  </label>
</template>

<script setup lang="ts">
import type { BrewPackage } from '~/types'

defineProps<{
  pkg: BrewPackage
  isSelected: boolean
}>()

defineEmits<{
  toggle: []
}>()
</script>

<style scoped>
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

.package-version {
  font-size: 0.7rem;
  color: #555;
  font-family: 'SF Mono', 'Fira Code', monospace;
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
</style>
