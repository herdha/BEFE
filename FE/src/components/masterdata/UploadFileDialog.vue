<script setup>
import * as XLSX from "xlsx"

const props = defineProps({
  isDialogOpen: {
    type: Boolean,
    required: true,
  },
  columnName: {
    type: Array,
    required: true,
  },
})

const emit = defineEmits([
  'update:isDialogOpen',
  'dataFile',
])

let uploadCounter = ref(0)
let uploadLength = ref(0)
let uploadArray = ref([])
let errorMessage = ref('')
let file = ref()
let overwrite = ref(false)
const isDialogVisible = ref(false)


const handleClearFile = () => {
  if (file.value.length === 0) {
    errorMessage.value = ''
  }
}

const handleSendData = async () => {
  const datas = {
    uploadCounter: uploadCounter.value,
    uploadLength: uploadLength.value,
    uploadArray: uploadArray.value,
    file: file.value,
    overwrite: overwrite.value
  }

  emit('update:isDialogOpen', false)
  emit('dataFile', datas)

  // Wait for the emit to finish before updating the variables
  await nextTick()

  uploadLength.value = 0
  uploadCounter.value = 0
  uploadArray.value = []
  file = ref()
}

const previewFile = e => {
  errorMessage.value = ''
  let files = e.target.files, f = files[0]
  const reader = new FileReader()

  reader.onload = function (e) {
    const data = new Uint8Array(e.target.result)
    const workbook = XLSX.read(data, { type: 'array' })
    const sheetName = workbook.SheetNames[0]
    const worksheet = workbook.Sheets[sheetName]
    const XL_row_object = XLSX.utils.sheet_to_json(worksheet, { raw: false, defval: '' })

    const acceptedColumnName = props.columnName
    const columnName = Object.keys(XL_row_object[0])
    for (let i = 0; i < acceptedColumnName.length; i++) {
      if (columnName[i] !== acceptedColumnName[i]) {
        errorMessage.value = 'Invalid column name'
      }
    }
    uploadCounter.value = 0
    uploadLength.value = XL_row_object.length
    uploadArray.value = XL_row_object
  }
  reader.readAsArrayBuffer(f)
}

const closeNavigationDialog = () => {
  emit('update:isDialogOpen', false)
}

const handleDialogModelValueUpdate = val => {
  emit('update:isDialogOpen', val)
}

watch(file, () => {
  handleClearFile()
})
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

    <!-- Input File Form -->
    <VCard title="Upload">
      <VCardText>
        <div
          class="text-center"
          style="margin-bottom: 15px;"
        >
          Select File You Want to Upload
        </div>
        <VFileInput
          v-model="file"
          label="File"
          accept=".xls , .xlsx , .csv"
          @change="previewFile"
        />
        <VCheckbox
          style="margin-left: 40px"
          v-model="overwrite"
          label="Overwrite"
        />
        <strong
          v-if="errorMessage.value != ''"
          style=" margin-left: 40px;color: red;"
        >{{ errorMessage }}</strong>

      </VCardText>
      <VCardText class="d-flex justify-end flex-wrap gap-3">
        <VBtn
          variant="tonal"
          color="secondary"
          @click="closeNavigationDialog"
        >
          Close
        </VBtn>
        <VBtn
          :disabled="file == undefined || file.length == 0 || errorMessage !== ''"
          @click="handleSendData"
        >
          Upload
        </VBtn>
      </VCardText>
      <VDialog
        v-model="isDialogVisible"
        width="300"
      >
        <VCard
          color="primary"
          width="300"
        >
          <VCardText class="pt-3">
            Please stand by
            <VProgressLinear
              indeterminate
              color="white"
              class="mb-0"
            />
          </VCardText>
        </VCard>
      </VDialog>
    </VCard>
  </VDialog>
</template>
