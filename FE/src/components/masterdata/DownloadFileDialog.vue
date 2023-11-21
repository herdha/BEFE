<script setup>
const props = defineProps({
  isDialogOpen: {
    type: Boolean,
    required: true,
  },
  jsonData: {
    type: Array,
    required: true,
  },
  jsonField: {
    type: Object,
    required: true,
  },
  fileName: {
    type: String,
    required: true,
  },
})

const emit = defineEmits([
  'update:isDialogOpen',
])

const closeNavigationDialog = () => {
  emit('update:isDialogOpen', false)
}

const handleDialogModelValueUpdate = val => {
  emit('update:isDialogOpen', val)
}
</script>

<template>
  <!-- Dialog -->
  <VDialog
    temporary
    :model-value="props.isDialogOpen"
    class="v-dialog-sm"
    @update:model-value="handleDialogModelValueUpdate"
  >
    <!-- Close Button -->
    <VBtn
      icon
      class="v-dialog-close-btn"
      @click="closeNavigationDialog"
    >
      <VIcon icon="tabler-x" />
    </VBtn>

    <VCard title="Download">
      <VCardText>
        <div class="text-center">
          Select Type File You Want to Download
        </div>
        <div style="display: flex; justify-content: center;">
          <DownloadExcel
            :data="props.jsonData"
            :fields="props.jsonField"
            :worksheet="props.fileName"
            :name="props.fileName+'.xls'"
          >
            <VBtn
              color="black"
              class="download-btn"
            >
              <img
                src="@images/xls.png"
                height="100"
              >
            </VBtn>
          </DownloadExcel>
          <DownloadExcel
            :data="props.jsonData"
            :fields="props.jsonField"
            type="csv"
            :name="props.fileName+'.csv'"
          >
            <VBtn
              color="black"
              class="download-btn"
            >
              <img
                src="@images/csv.png"
                height="100"
              >
            </VBtn>
          </DownloadExcel>
        </div>
      </VCardText>
    </VCard>
  </VDialog>
</template>
