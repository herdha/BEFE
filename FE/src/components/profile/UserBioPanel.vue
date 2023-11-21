<script setup>
import avatar1 from '@images/logo/logo.png'
import { useAuthStore } from '@store/useAuthStore'

// 👉 - Define Store
const dataStore = useAuthStore()

dataStore.currentUser()

const userData = computed(() => {
  return {
    name: dataStore.getActiveUser.name,
    role: dataStore.getActiveUser.role,
    status: 'Active',
    contact: '+6281234567890',
    language: 'English',
    country: 'Indonesia',
  }
})

const isUserInfoEditDialogVisible = ref(false)

const resolveUserStatusVariant = stat => {
  if (stat === 'Pending')
    return 'warning'
  if (stat === 'Active')
    return 'success'
  if (stat === 'Inactive')
    return 'secondary'
  
  return 'primary'
}

const resolveUserRoleVariant = role => {
  if (role === 'Super Admin')
    return {
      color: 'primary',
      icon: 'tabler-security',
    }
  if (role === 'Operator')
    return {
      color: 'secondary',
      icon: 'tabler-tools',
    }
  
  return {
    color: 'primary',
    icon: 'tabler-user',
  }
}
</script>

<template>
  <VRow>
    <!-- SECTION User Details -->
    <VCol cols="12">
      <VCard>
        <VCardText class="text-center pt-15">
          <!-- 👉 Avatar -->
          <VAvatar
            rounded
            :size="80"
          >
            <VImg :src="avatar1" />
          </VAvatar>

          <!-- 👉 User fullName -->
          <h6 class="text-h4 mt-4">
            {{ userData.name }}
          </h6>

          <!-- 👉 Role chip -->
          <VChip
            label
            :color="resolveUserRoleVariant(userData.role).color"
            size="small"
            class="text-capitalize mt-3"
          >
            {{ userData.role }}
          </VChip>
        </VCardText>

        <VDivider />

        <!-- 👉 Details -->
        <VCardText>
          <p class="text-sm text-uppercase text-disabled">
            Details
          </p>

          <!-- 👉 User Details list -->
          <VList class="card-list mt-2">
            <VListItem>
              <VListItemTitle>
                <h6 class="text-h6">
                  Name:
                  <span class="text-body-1">
                    {{ userData.name }}
                  </span>
                </h6>
              </VListItemTitle>
            </VListItem>

            <VListItem>
              <VListItemTitle>
                <h6 class="text-h6">
                  Status:

                  <VChip
                    label
                    size="small"
                    :color="resolveUserStatusVariant(userData.status)"
                    class="text-capitalize"
                  >
                    {{ userData.status }}
                  </VChip>
                </h6>
              </VListItemTitle>
            </VListItem>

            <VListItem>
              <VListItemTitle>
                <h6 class="text-h6">
                  Role:
                  <span class="text-capitalize text-body-1">{{ userData.role }}</span>
                </h6>
              </VListItemTitle>
            </VListItem>

            <VListItem>
              <VListItemTitle>
                <h6 class="text-h6">
                  Contact:
                  <span class="text-body-1">{{ userData.contact }}</span>
                </h6>
              </VListItemTitle>
            </VListItem>

            <VListItem>
              <VListItemTitle>
                <h6 class="text-h6">
                  Language:
                  <span class="text-body-1">{{ userData.language }}</span>
                </h6>
              </VListItemTitle>
            </VListItem>

            <VListItem>
              <VListItemTitle>
                <h6 class="text-h6">
                  Country:
                  <span class="text-body-1">{{ userData.country }}</span>
                </h6>
              </VListItemTitle>
            </VListItem>
          </VList>
        </VCardText>

        <!-- 👉 Edit button -->
        <VCardText class="d-flex justify-center">
          <VBtn
            variant="elevated"
            class="me-4"
            @click="isUserInfoEditDialogVisible = true"
          >
            Edit
          </VBtn>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>

  <!-- 👉 Edit user info dialog -->
  <UserInfoEditDialog
    v-model:isDialogVisible="isUserInfoEditDialogVisible"
    :user-data="userData"
  />
</template>

<style lang="scss" scoped>
.card-list {
  --v-card-list-gap: 0.7rem;
}

.text-capitalize {
  text-transform: capitalize !important;
}
</style>
