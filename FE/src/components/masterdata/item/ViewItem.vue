<script setup>
import { formatDate, thousandFormatter } from "@/@core/utils/formatters"
import { can } from '@utils'

// 👉 - Props
const props = defineProps({
  isView: {
    type: Boolean,
    required: true,
  },
  form: {
    type: Object,
    required: true,
  },
})

// 👉 - Emits
const emit = defineEmits([
  'update:isView',
  'edit',
])

// 👉 - Data
const module = ref('Item')
const form = ref(structuredClone(toRaw(props.form)))

// 👉 - Method
/**
 * Back to table
 */
const back = () => {
  emit('update:isView', false)
}

/**
 * Edit item
 */
const edit = () => {
  emit('edit', form.value)
}
</script>

<template>
  <VCard :title="`${module} Details`">
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

        <!-- 👉 Edit Item Button -->
        <VBtn
          v-if="can('Item', 'edit')"
          class="me-2"
          @click="edit"
        >
          Edit {{ module }}
        </VBtn>
      </div>
    </VCardText>

    <VCardText>
      <VRow>
        <VCol
          cols="12"
          md="6"
        >
          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Name
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ form.name }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Code
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ form.code }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Description
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ form.description }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Category
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ form.category }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Stock
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ thousandFormatter(form.stock) }}
            </VCol>
          </VRow>
        </VCol>

        <VCol
          cols="12"
          md="6"
        >
          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Unit
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ form.unit }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Buy Price
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ thousandFormatter(form.buyPrice) }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Sell Price
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ thousandFormatter(form.sellPrice) }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Created At
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ formatDate(form.createdAt) }}
            </VCol>
          </VRow>

          <VRow>
            <VCol
              cols="12"
              md="3"
              class="font-weight-medium"
            >
              Updated At
            </VCol>

            <VCol
              cols="12"
              md="9"
            >
              : {{ formatDate(form.updatedAt) }}
            </VCol>
          </VRow>
        </VCol>
      </VRow>
    </VCardText>
  </VCard>
</template>
