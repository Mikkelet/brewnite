<template>
  <div class="app">
    <header>
      <h1>🍺 Brewnite</h1>
      <p class="subtitle">Select homebrew packages and generate an install script</p>
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
</style>
