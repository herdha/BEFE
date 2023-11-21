<script setup>
import { pageTitle } from '@utils';

document.title = pageTitle('Profile')

const userTab = ref(null)

const tabs = [
  {
    icon: 'tabler-accessible',
    title: 'Permission',
  },
  {
    icon: 'tabler-lock',
    title: 'Security',
  },
]
</script>

<template>
  <VRow>
    <VCol
      cols="12"
      md="5"
      lg="4"
    >
      <UserBioPanel />
    </VCol>

    <VCol
      cols="12"
      md="7"
      lg="8"
    >
      <VTabs
        v-model="userTab"
        class="v-tabs-pill"
      >
        <VTab
          v-for="tab in tabs"
          :key="tab.icon"
        >
          <VIcon
            :size="18"
            :icon="tab.icon"
            class="me-1"
          />
          <span>{{ tab.title }}</span>
        </VTab>
      </VTabs>

      <VWindow
        v-model="userTab"
        class="mt-6 disable-tab-transition"
        :touch="false"
      >
        <VWindowItem>
          <UserPermissions />
        </VWindowItem>

        <VWindowItem>
          <UserSecurity />
        </VWindowItem>
      </VWindow>
    </VCol>
  </VRow>
</template>

<route lang="yaml">
meta:
  requiresAuth: true
</route>
