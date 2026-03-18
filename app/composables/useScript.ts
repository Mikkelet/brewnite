import type { BrewPackage } from '~/types'

export function useScript(selectedMeta: Ref<Map<string, BrewPackage>>) {
  const copied = ref(false)
  const linkCopied = ref(false)

  const generatedScript = computed(() => {
    const formulae: string[] = []
    const casks: string[] = []

    for (const [name, pkg] of selectedMeta.value) {
      if (pkg.cask) {
        casks.push(name)
      } else {
        formulae.push(name)
      }
    }

    formulae.sort()
    casks.sort()

    let script = `#!/bin/bash

# Brewnite install script
# Generated on ${new Date().toLocaleDateString()}

set -e

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update
`

    if (formulae.length > 0) {
      script += `
# Install formulae
echo "Installing formulae..."
brew install \\
${formulae.map(f => `  ${f}`).join(' \\\n')}
`
    }

    if (casks.length > 0) {
      script += `
# Install casks
echo "Installing casks..."
brew install --cask \\
${casks.map(c => `  ${c}`).join(' \\\n')}
`
    }

    script += `
echo "Done! All packages installed."
`

    return script
  })

  async function copyScript() {
    await navigator.clipboard.writeText(generatedScript.value)
    copied.value = true
    setTimeout(() => { copied.value = false }, 2000)
  }

  async function copyLink() {
    const url = window.location.href
    await navigator.clipboard.writeText(url)
    linkCopied.value = true
    setTimeout(() => { linkCopied.value = false }, 2000)
  }

  return {
    generatedScript,
    copied,
    linkCopied,
    copyScript,
    copyLink,
  }
}
