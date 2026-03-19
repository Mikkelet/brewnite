<template>
  <div class="app">
    <header>
      <h1>🍺 Brewnite</h1>
      <p class="subtitle">Select homebrew packages and generate an install script</p>
      <a
        href="https://buymeacoffee.com/mikkelthygesen"
        target="_blank"
        rel="noopener noreferrer"
        class="bmc-button"
      >
        ☕ Buy me a coffee
      </a>
    </header>

    <main>
      <slot />
    </main>
  </div>
</template>

<style scoped>
.app {
  max-width: 1400px;
  margin: 0 auto;
  padding: 2rem 1rem;
}

header {
  text-align: center;
  margin-bottom: 2rem;
}

header h1 {
  font-size: 2.5rem;
  color: #f5a623;
  margin-bottom: 0.5rem;
}

.subtitle {
  color: #888;
  font-size: 1.1rem;
}

.bmc-button {
  display: inline-block;
  margin-top: 0.75rem;
  padding: 0.5rem 1rem;
  background: #ffdd00;
  color: #000;
  font-weight: 600;
  font-size: 0.9rem;
  border-radius: 8px;
  text-decoration: none;
  transition: background 0.2s ease;
}

.bmc-button:hover {
  background: #e5c700;
}
</style>
