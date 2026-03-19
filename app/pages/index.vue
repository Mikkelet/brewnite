<template>
  <div class="page-layout">
    <div class="main-column">
      <PresetSelector
        :presets="presets"
        :active-preset="activePreset"
        @select="applyPreset"
      />

      <SelectedPackages
        :packages="selectedPackagesList"
        @remove="togglePackage"
        @clear-all="clearAll"
      />

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
    </div>

    <div v-if="selectedPackages.size > 0" class="script-column">
      <div class="script-sticky">
        <ScriptPreview
          :show="true"
          :generated-script="generatedScript"
          :copied="copied"
          :link-copied="linkCopied"
          :one-liner-copied="oneLinerCopied"
          @copy-script="copyScript"
          @copy-link="copyLink"
          @copy-one-liner="copyOneLiner"
        />
      </div>
    </div>

    <!-- Mobile: show script below everything -->
    <div v-if="selectedPackages.size > 0" class="script-mobile">
      <ScriptPreview
        :show="true"
        :generated-script="generatedScript"
        :copied="copied"
        :link-copied="linkCopied"
        :one-liner-copied="oneLinerCopied"
        @copy-script="copyScript"
        @copy-link="copyLink"
        @copy-one-liner="copyOneLiner"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
const { search, typeFilter, currentPage, isSearching, pending, packages, totalPackages, totalPages } = usePackages()
const { selectedPackages, selectedMeta, selectedPackagesList, activePreset, togglePackage, clearAll, applyPreset } = useSelection()
const { generatedScript, copied, linkCopied, oneLinerCopied, copyScript, copyLink, copyOneLiner } = useScript(selectedMeta)
const { presets } = usePresets()
</script>

<style scoped>
.page-layout {
  display: flex;
  gap: 2rem;
  align-items: flex-start;
}

.main-column {
  flex: 1;
  min-width: 0;
}

.script-column {
  display: none;
}

.script-mobile {
  display: block;
  width: 100%;
}

/* Desktop: side-by-side layout */
@media (min-width: 1024px) {
  .script-column {
    display: block;
    width: 380px;
    flex-shrink: 0;
  }

  .script-sticky {
    position: sticky;
    top: 1rem;
  }

  .script-mobile {
    display: none;
  }
}
</style>
