<script setup>
import { pageTitle } from '@utils'
import {
  requiredValidator,
} from '@validators'

// 👉 - Page Title
const page = 'Scan Barcode'

document.title = pageTitle(page)

// 👉 - Data
const refVForm = ref()
const barcode = ref('')
const storeBarcode = ref('')
const showAlert = ref(false)

// 👉 - Method
const scanBarcode = () => {
  showAlert.value = true
  storeBarcode.value = barcode.value
  barcode.value = ''
}

const onSubmit = () => {
  refVForm.value?.validate().then(({ valid: isValid }) => {
    if (isValid)
      scanBarcode()
  })
}
</script>

<template>
  <div>
    <VCard :title="page">
      <VCardText>
        <VForm
          ref="refVForm"
          @submit.prevent="onSubmit"
        >
          <AppTextField
            v-model="barcode"
            label="Barcode"
            autofocus
            :rules="[requiredValidator]"
          >
            <template #append>
              <VBtn
                size="large"
                class="mt-n3"
                type="submit"
              >
                Scan
              </VBtn>
            </template>
          </AppTextField>
        </VForm>
      </VCardText>

      <VCardText v-if="showAlert && !barcode">
        <VAlert
          color="success"
          variant="tonal"
        >
          <VAlertTitle class="mb-1">
            {{ storeBarcode }}
          </VAlertTitle>
          Barcode successfully scanned! Thank you for using our system.
        </VAlert>
      </VCardText>
    </VCard>
  </div>
</template>

<route lang="yaml">
meta:
  subject: Scan Barcode
  requiresAuth: true
</route>
