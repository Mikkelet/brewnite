export default defineNuxtConfig({
  compatibilityDate: '2025-01-01',
  devtools: { enabled: true },
  app: {
    head: {
      title: 'Brewnite - Homebrew Script Generator',
      meta: [
        { name: 'description', content: 'Select homebrew packages and generate an install script' }
      ]
    }
  }
})
