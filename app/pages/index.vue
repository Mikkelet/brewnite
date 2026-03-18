<template>
  <div>
    <PackageSearch
      :search="search"
      :type-filter="typeFilter"
      :total-packages="totalPackages"
      :selected-count="selectedPackages.size"
      :is-searching="isSearching"
      @update:search="search = $event"
      @update:type-filter="typeFilter = $event"
      @clear="clearAll"
    />

    <PackageList
      :packages="packages"
      :selected-packages="selectedPackages"
      :pending="pending"
      :search="search"
      :current-page="currentPage"
      :total-pages="totalPages"
      :total-packages="totalPackages"
      @toggle="togglePackage"
      @prev-page="currentPage--"
      @next-page="currentPage++"
    />

    <ScriptPreview
      :show="selectedPackages.size > 0"
      :generated-script="generatedScript"
      :copied="copied"
      :link-copied="linkCopied"
      @copy-script="copyScript"
      @copy-link="copyLink"
    />
  </div>
</template>

<script setup lang="ts">
const { search, typeFilter, currentPage, isSearching, pending, packages, totalPackages, totalPages } = usePackages()
const { selectedPackages, selectedMeta, togglePackage, clearAll } = useSelection()
const { generatedScript, copied, linkCopied, copyScript, copyLink } = useScript(selectedMeta)
</script>
