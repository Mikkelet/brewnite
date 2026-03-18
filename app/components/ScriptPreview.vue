<template>
  <div v-if="show" class="script-section">
    <div class="script-header">
      <h2>Install Script</h2>
      <div class="script-actions">
        <button class="btn btn-ghost btn-small" @click="copyLink">
          {{ linkCopied ? '✓ Link copied!' : 'Share link' }}
        </button>
        <button class="btn" @click="copyScript">
          {{ copied ? '✓ Copied!' : 'Copy script' }}
        </button>
      </div>
    </div>
    <pre class="script"><code>{{ generatedScript }}</code></pre>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  show: boolean
  generatedScript: string
  copied: boolean
  linkCopied: boolean
}>()

const emit = defineEmits<{
  copyScript: []
  copyLink: []
}>()

function copyScript() {
  emit('copyScript')
}

function copyLink() {
  emit('copyLink')
}
</script>

<style scoped>
.script-section {
  margin-top: 2rem;
  background: #141414;
  border: 1px solid #222;
  border-radius: 8px;
  overflow: hidden;
}

.script-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem 1rem;
  border-bottom: 1px solid #222;
}

.script-header h2 {
  font-size: 1rem;
}

.script-actions {
  display: flex;
  gap: 0.5rem;
}

.script {
  padding: 1rem;
  overflow-x: auto;
  font-size: 0.85rem;
  line-height: 1.5;
}

.script code {
  color: #a8d8a8;
  font-family: 'SF Mono', 'Fira Code', 'Cascadia Code', monospace;
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
