import sql from '../utils/db'

export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  const pkgs = ((query.pkgs as string) || '').split(',').filter(Boolean)

  if (pkgs.length === 0) {
    setResponseHeader(event, 'content-type', 'text/plain')
    return '#!/bin/bash\n# No packages selected. Add ?pkgs=git,node,... to generate a script.\n'
  }

  // Look up which names are formulae and which are casks
  const formulaeRows = await sql`
    SELECT name FROM formulae WHERE name = ANY(${pkgs})
  `
  const casksRows = await sql`
    SELECT token AS name FROM casks WHERE token = ANY(${pkgs})
  `

  const formulaeSet = new Set(formulaeRows.map((r: any) => r.name))
  const casksSet = new Set(casksRows.map((r: any) => r.name))

  const formulae = pkgs.filter(p => formulaeSet.has(p)).sort()
  const casks = pkgs.filter(p => casksSet.has(p)).sort()

  const date = new Date().toLocaleDateString()

  let script = `#!/bin/bash

# Brewnite install script
# Generated on ${date}

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

  setResponseHeader(event, 'content-type', 'text/plain')
  return script
})
