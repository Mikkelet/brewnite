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
        :show-formulae="showFormulae"
        :show-casks="showCasks"
        :show-presets="showPresets"
        :total-packages="totalPackages"
        :is-searching="isSearching"
        @update:search="search = $event"
        @update:show-formulae="showFormulae = $event"
        @update:show-casks="showCasks = $event"
        @update:show-presets="showPresets = $event"
      />

      <PackageList
        :packages="showFormulae || showCasks ? packages : []"
        :selected-packages="selectedPackages"
        :pending="pending"
        :search="search"
        :current-page="currentPage"
        :total-pages="showFormulae || showCasks ? totalPages : 0"
        :total-packages="totalPackages"
        :presets="presets"
        :active-preset="activePreset"
        :show-presets="showPresets"
        @toggle="togglePackage"
        @prev-page="currentPage--"
        @next-page="currentPage++"
        @select-preset="applyPreset"
      />
    </div>

    <div class="script-column">
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
    <div class="script-mobile">
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
const { search, showFormulae, showCasks, showPresets, currentPage, isSearching, pending, packages, totalPackages, totalPages } = usePackages()
const { selectedPackages, selectedMeta, selectedPackagesList, activePreset, togglePackage, clearAll, applyPreset } = useSelection()
const { generatedScript, copied, linkCopied, oneLinerCopied, copyScript, copyLink, copyOneLiner } = useScript(selectedMeta)
const { presets } = usePresets()
</script>

<style scoped>
.page-layout {
  display: flex;
  flex-direction: column;
  gap: 1rem;
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
  .page-layout {
    flex-direction: row;
    gap: 2rem;
  }

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
