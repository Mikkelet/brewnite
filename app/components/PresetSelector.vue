<template>
  <div class="presets">
    <h2 class="presets-title">Quick Start</h2>
    <p class="presets-subtitle">Pick a preset to get started, then customize</p>
    <div class="preset-grid">
      <button
        v-for="preset in presets"
        :key="preset.id"
        class="preset-card"
        :class="{ active: activePreset === preset.id }"
        @click="$emit('select', preset)"
      >
        <span class="preset-icon">{{ preset.icon }}</span>
        <span class="preset-name">{{ preset.name }}</span>
        <span class="preset-desc">{{ preset.description }}</span>
        <span class="preset-count">{{ preset.packages.length }} packages</span>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Preset } from '~/composables/usePresets'

defineProps<{
  presets: Preset[]
  activePreset: string | null
}>()

defineEmits<{
  select: [preset: Preset]
}>()
</script>

<style scoped>
.presets {
  margin-bottom: 1.5rem;
}

.presets-title {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 0.25rem;
}

.presets-subtitle {
  font-size: 0.85rem;
  color: #666;
  margin-bottom: 0.75rem;
}

.preset-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(170px, 1fr));
  gap: 0.5rem;
}

.preset-card {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 0.2rem;
  padding: 0.75rem;
  background: #141414;
  border: 1px solid #222;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.15s;
  text-align: left;
  color: #e0e0e0;
  font-family: inherit;
}

.preset-card:hover {
  border-color: #444;
  background: #1a1a1a;
}

.preset-card.active {
  border-color: #f5a623;
  background: #1a1400;
}

.preset-icon {
  font-size: 1.5rem;
  margin-bottom: 0.15rem;
}

.preset-name {
  font-weight: 600;
  font-size: 0.85rem;
  color: #fff;
}

.preset-desc {
  font-size: 0.75rem;
  color: #777;
  line-height: 1.3;
}

.preset-count {
  font-size: 0.7rem;
  color: #f5a623;
  margin-top: 0.15rem;
}
</style>
