export interface BrewPackage {
  name: string
  description: string
  cask: boolean
  homepage?: string | null
  version?: string | null
}

export interface ApiResponse {
  packages: BrewPackage[]
  total: number
  page: number
  limit: number
  totalPages: number
}

export type PackageType = 'all' | 'formulae' | 'casks'
