<script setup>
import { pageTitle } from '@utils'
import { useRoute } from 'vue-router'

// 👉 - Page Title
const page = 'Settings'

document.title = pageTitle(page)

const route = useRoute()
const activeTab = ref(route.params.tab)

// tabs
const tabs = [
  {
    title: 'Apex Chart',
    icon: 'tabler-graph',
    tab: 'apex-chart',
  },
  {
    title: 'User',
    icon: 'tabler-user',
    tab: 'user',
  },
  {
    title: 'Scan Barcode',
    icon: 'tabler-scan',
    tab: 'scan-barcode',
  },
]
</script>

<template>
  <div>
    <VTabs
      v-model="activeTab"
      class="v-tabs-pill"
    >
      <VTab
        v-for="item in tabs"
        :key="item.icon"
        :value="item.tab"
        :to="{ name: 'settings-tab', params: { tab: item.tab } }"
      >
        <VIcon
          size="20"
          start
          :icon="item.icon"
        />
        {{ item.title }}
      </VTab>
    </VTabs>

    <VWindow
      v-model="activeTab"
      class="mt-6 disable-tab-transition"
      :touch="false"
    >
      <!-- Apex Chart -->
      <VWindowItem value="apex-chart">
        <SettingsApexChart />
      </VWindowItem>

      <!-- User -->
      <VWindowItem value="user">
        <SettingsUser />
      </VWindowItem>

      <!-- Scan Barcode -->
      <VWindowItem value="scan-barcode">
        <SettingsScanBarcode />
      </VWindowItem>
    </VWindow>
  </div>
</template>

<route lang="yaml">
meta:
  navActiveLink: settings-tab
  requiresAuth: true
</route>
