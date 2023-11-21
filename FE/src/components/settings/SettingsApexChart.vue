<script setup>
const apexChartSetting = ref('Area Chart only')
</script>

<template>
  <VRow>
    <VCol cols="12">
      <VCard>
        <VCardText>
          <VForm @submit.prevent="() => {}">
            <VRow>
              <!-- 👉 Apex Chart Setting -->
              <VCol
                cols="12"
                md="6"
              >
                <AppTextField
                  v-model="apexChartSetting"
                  label="Apex Chart Setting"
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
