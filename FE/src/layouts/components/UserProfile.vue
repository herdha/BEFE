<script setup>
import router from '@/router'
import avatar1 from '@images/logo/logo.png'
import { useAuthStore } from '@store/useAuthStore'

// 👉 - Define Store
const dataStore = useAuthStore()

dataStore.currentUser()

// 👉 - Method
const logout = () => {
  // localStorage.removeItem('permission')
  // localStorage.removeItem('accessToken')
  // router.push('/login')
  
  dataStore.logout().then(()=>{
    localStorage.removeItem('permission')
    localStorage.removeItem('accessToken')
    router.push('/login')    
  })
  .catch((err)=>{
    console.log(err)
  })
}

// const t = () => {
//   dataStore.logout().then(()=>{
//     localStorage.removeItem('permission')
//     localStorage.removeItem('accessToken')
//     router.push('/login')    
//   })
//   .catch((err)=>{
//     console.log(err)
//   })
// }
</script>

<template>
  <VAvatar class="cursor-pointer">
    <VImg :src="avatar1" />

    <!-- SECTION Menu -->
    <VMenu
      activator="parent"
      width="230"
      location="bottom end"
      offset="14px"
    >
      <VList>
        <!-- 👉 User Avatar & Name -->
        <VListItem>
          <template #prepend>
            <VListItemAction start>
              <VAvatar>
                <VImg :src="avatar1" />
              </VAvatar>
            </VListItemAction>
          </template>

          <VListItemTitle class="font-weight-semibold">
            {{ dataStore.getActiveUser.name }}
          </VListItemTitle>
          <VListItemSubtitle>{{ dataStore.getActiveUser.role }}</VListItemSubtitle>
        </VListItem>

        <VDivider class="my-2" />

        <!-- 👉 Profile -->
        <VListItem :to="{ name: 'profile' }">
          <template #prepend>
            <VIcon
              class="me-2"
              icon="tabler-user"
              size="22"
            />
          </template>

          <VListItemTitle>Profile</VListItemTitle>
        </VListItem>

        <!-- 👉 Settings -->
        <VListItem :to="{ name: 'settings-tab', params: { tab: 'apex-chart' } }">
          <template #prepend>
            <VIcon
              class="me-2"
              icon="tabler-settings"
              size="22"
            />
          </template>

          <VListItemTitle>Settings</VListItemTitle>
        </VListItem>

        <!-- Divider -->
        <VDivider class="my-2" />

        <!-- 👉 Logout -->
        <VListItem @click="logout">
          <template #prepend>
            <VIcon
              class="me-2"
              icon="tabler-logout"
              size="22"
            />
          </template>

          <VListItemTitle>Logout</VListItemTitle>
        </VListItem>
      </VList>
    </VMenu>
    <!-- !SECTION -->
  </VAvatar>
</template>
