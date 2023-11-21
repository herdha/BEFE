<script setup>
import { integerValidator, requiredValidator } from '@validators'

// 👉 - Props
const props = defineProps({
  isAddEdit: {
    type: Boolean,
    required: true,
  },
  method: {
    type: String,
    required: true,
  },
  form: {
    type: Object,
    required: true,
  },
})

// 👉 - Emits
const emit = defineEmits([
  'update:isAddEdit',
  'add',
  'edit',
  'view',
])

// 👉 - Data
const module = ref('Item')
const method = ref(structuredClone(toRaw(props.method)))
const form = ref(structuredClone(toRaw(props.form)))
const refVForm = ref()

// 👉 - Method
/**
 * Back to table
 */
const back = () => {
  emit('update:isAddEdit', false)
}

/**
 * Submit form
 */
const onSubmit = () => {
  refVForm.value?.validate().then(({ valid: isValid }) => {
    if (isValid && method.value === 'Add') {
      back()
      emit('add', form._rawValue)
    }
    if (isValid && method.value === 'Edit') {
      back()
      emit('edit', form._rawValue)
    }
  })
}

/**
 * View item
 */
const view = () => {
  emit('view', form.value)
}
</script>

<template>
  <VCard :title="`${method} ${module}`">
    <VCardText class="d-flex flex-wrap gap-4">
      <div>
        <!-- 👉 Back to Item Button -->
        <VBtn
          class="me-2"
          prepend-icon="tabler-chevron-left"
          @click="back"
        >
          Back to {{ module }}
        </VBtn>

        <!-- 👉 View Item Button -->
        <VBtn
          v-if="method === 'Edit'"
          class="me-2"
          @click="view"
        >
          View {{ module }}
        </VBtn>
      </div>
    </VCardText>

    <VCardText>
      <VForm
        ref="refVForm"
        @submit.prevent="onSubmit"
      >
        <VRow>
          <!-- 👉 Name -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.name"
              label="Name"
              placeholder="Name"
              :required="true"
              :rules="[requiredValidator]"
            />
          </VCol>

          <!-- 👉 Code -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.code"
              label="Code"
              placeholder="Code (Unique)"
              :required="true"
              :rules="[requiredValidator]"
            />
          </VCol>

          <!-- 👉 Description -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.description"
              label="Description"
              placeholder="Description"
              :required="true"
              :rules="[requiredValidator]"
            />
          </VCol>

          <!-- 👉 Category -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.category"
              label="Category"
              placeholder="Category"
              :required="true"
              :rules="[requiredValidator]"
            />
          </VCol>

          <!-- 👉 Stock -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.stock"
              label="Stock"
              placeholder="Stock (Number)"
              :required="true"
              :rules="[requiredValidator, integerValidator]"
            />
          </VCol>

          <!-- 👉 Unit -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.unit"
              label="Unit"
              placeholder="Unit"
              :required="true"
              :rules="[requiredValidator]"
            />
          </VCol>

          <!-- 👉 Buy Price -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.buyPrice"
              label="Buy Price"
              placeholder="Buy Price (Number)"
              :required="true"
              :rules="[requiredValidator, integerValidator]"
            />
          </VCol>

          <!-- 👉 Sell Price -->
          <VCol
            cols="12"
            md="6"
          >
            <AppTextField
              v-model="form.sellPrice"
              label="Sell Price"
              placeholder="Sell Price (Number)"
              :required="true"
              :rules="[requiredValidator, integerValidator]"
            />
          </VCol>
          
          <!-- 👉 Submit and Reset Button -->
          <VCol
            cols="12"
            class="d-flex gap-4"
          >
            <VBtn type="submit">
              Submit
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
</template>
