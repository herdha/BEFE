<script setup>
const userSetting = ref('Number of users is limited to 10')
</script>

<template>
  <VRow>
    <VCol cols="12">
      <VCard>
        <VCardText>
          <VForm @submit.prevent="() => {}">
            <VRow>
              <!-- 👉 User Setting -->
              <VCol
                cols="12"
                md="6"
              >
                <AppTextField
                  v-model="userSetting"
                  label="User Setting"
                />
              </VCol>

              <!-- 👉 Actions Button -->
              <VCol
                cols="12"
                class="d-flex gap-x-4"
              >
                <VBtn type="submit">
                  Save changes
                </VBtn>
                <VBtn
                  type="reset"
                  color="secondary"
                  variant="tonal"
                >
                  Reset
                </VBtn>
              </VCol>
            </VRow>
          </VForm>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>
</template>
