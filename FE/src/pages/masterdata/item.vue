<script setup>
import { formatDate, thousandFormatter } from "@/@core/utils/formatters"
import { useItemStore } from '@store/useItemStore'
import { can, pageTitle } from '@utils'
import { VDataTable } from 'vuetify/labs/VDataTable'

// 👉 - Page Title
const module = 'Item'

document.title = pageTitle(module)

// 👉 - Define Store
const dataStore = useItemStore()

// 👉 - Mounted
// Fetch data
dataStore.fetchItems()

// 👉 - Computed
const getData = computed(() => {
  return dataStore.getItems
})

console.log(getData)

// 👉 - Data
// Variables for table purposes
const selectedRows = ref([])
const search = ref('')

const headers = [
  {
    title: 'NAME',
    key: 'name',
  },
  {
    title: 'CODE',
    key: 'code',
  },
  {
    title: 'CATEGORY',
    key: 'category',
  },
  {
    title: 'STOCK',
    key: 'stock',
  },
  {
    title: 'UNIT',
    key: 'unit',
  },
  {
    title: 'CREATED AT',
    key: 'createdAt',
  },
  {
    title: 'UPDATED AT',
    key: 'updatedAt',
  },
  {
    title: 'ACTIONS',
    key: 'actions',
    sortable: false,
  },
]

// Variable for card purposes
const isView = ref(false)
const isAddEdit = ref(false)
const method = ref('')

// Variable for data purposes
const form = ref({
  id: null,
  name: null,
  code: null,
  description: null,
  category: null,
  stock: null,
  unit: null,
  buyPrice: null,
  sellPrice: null,
  createdAt: null,
  updatedAt: null,
})

// Variable for snackbar purposes
const showSnackbar = ref(false)
const snackbarColor = ref('')
const snackbarMessage = ref('')

// Variable for dialog purposes
const isDelete = ref(false)
const isMultipleDelete = ref(false)
const isDownload = ref(false)
const isUpload = ref(false)
const isLoading = ref(false)
const loadingText = ref('')

// Variable for download purposes
const fileName = ref(`${module}-Masterdata`)

const field = ref({
  Name: 'name',
  Code: 'code',
  Description: 'description',
  Category: 'category',
  Stock: 'stock',
  Unit: 'unit',
  BuyPrice: 'buyPrice',
  SellPrice: 'sellPrice',
  Created: 'createdAt',
  Updated: 'updatedAt',
})

// Variable for upload purposes
const columnName = ref([
  "Name",
  "Code",
  "Description",
  "Category",
  "Stock",
  "Unit",
  "BuyPrice",
  "SellPrice",
])

const uploadCounter = ref(0)
const uploadLength = ref(0)
const uploadArray = ref([])
const overwrite = ref(false)

// 👉 - Method
// ===== TABLE FUNCTIONS =====
/**
 * Function to refetch / refresh data
 */
const refetchData = hideOverlay => {
  // Fetch data
  dataStore.fetchItems()

  // Timeout in milliseconds, the value should be adjusted to the time of fetch data
  setTimeout(hideOverlay, 1000)
}

/**
 * Category Variant
 */
const resolveCategoryVariant = category => {
  if (category === 'Raw Material')
    return 'primary'
  else if (category  === 'Finished Goods')
    return 'success'
  else
    return 'warning'
}

// ===== ADD FUNCTIONS =====
/**
 * Clear form
 */
const clearFields = () => {
  form.value = {
    id: null,
    name: null,
    code: null,
    description: null,
    category: null,
    stock: null,
    unit: null,
    buyPrice: null,
    sellPrice: null,
    createdAt: null,
    updatedAt: null,
  }
}

/**
 * Change card from table to empty form
 */
const addData = () => {
  isAddEdit.value = true
  method.value = 'Add'
  clearFields()
}

/**
 * Confirm to create new data
 */
const confirmAddData = data => {
  const payload = { ...data }

  dataStore.addItem(payload)
    .then(() => {
      showSnackbar.value = true
      snackbarColor.value = 'success'
      snackbarMessage.value = `New ${module} is successfully registered.`
    })
    .catch(error => {
      showSnackbar.value = true
      snackbarColor.value = 'error'
      snackbarMessage.value = error.response.data.errors[0].message
      console.error(error)
    })
}

// ===== EDIT FUNCTIONS =====
/**
 * Change card from table to form
 * Form automatically filled based on selected data
 */
const editData = data => {
  isAddEdit.value = true
  isView.value = false
  method.value = 'Edit'
  form.value = { ...data }
}

/**
 * Confirm to update existing data
 */
const confirmEditData = data => {
  const payload = { ...data }

  dataStore.updateItem(payload)
    .then(() => {
      isAddEdit.value = false
      showSnackbar.value = true
      snackbarColor.value = 'success'
      snackbarMessage.value = `${module} is successfully updated.`
    })
    .catch(error => {
      showSnackbar.value = true
      snackbarColor.value = 'error'
      snackbarMessage.value = error.response.data.errors[0].message
      console.error(error)
    })
}

// ===== VIEW FUNCTIONS =====
/**
 * Change card from table to details
 */
const viewData = data => {
  isView.value = true
  isAddEdit.value = false
  form.value = { ...data }
}

// ===== DELETE FUNCTIONS =====
/**
 * Delete data will trigger confirm dialog
 */
const deleteData = data => {
  isDelete.value = true
  form.value = { ...data }
}

/**
 * Confirm delete data
 */
const confirmDeleteData = value => {
  if (value) {
    dataStore.deleteItem({ id: form.value.id })
      .then(() => {
        showSnackbar.value = true
        snackbarColor.value = 'success'
        snackbarMessage.value = `${module} is successfully deleted.`
      })
      .catch(error => {
        showSnackbar.value = true
        snackbarColor.value = 'error'
        snackbarMessage.value = error.response.data.errors[0].message
        console.error(error)
      })
  }
}

/**
 * Multiple delete
 */
const multipleDelete = value =>{
  if (value) {
    for (const element of selectedRows.value) {
      form.value = getData.value.find(el => el.id === element)
      confirmDeleteData(true)
    }
  }
  selectedRows.value = []
}

// ===== UPLOAD FUNCTIONS =====
/**
 * Upload Handler
 */
const handleUploadData = data => {
  uploadCounter.value = data.uploadCounter
  uploadLength.value = data.uploadLength
  uploadArray.value = data.uploadArray
  overwrite.value = data.overwrite
  uploadData()
}

/**
 * Upload Data
 */
const uploadData = () => {
  if (uploadCounter.value === 0) {
    loadingText.value = "Uploading Process.."
    isLoading.value = true
  }

  // Upload Function
  if (uploadCounter.value < uploadLength.value) {
    setTimeout(() => {
      var data = uploadArray.value[uploadCounter.value]

      const trimmedData = Object.entries(data).reduce((acc, curr) => {
        let [key, value] = curr

        // Checking if the key is a string
        acc[typeof key === "string" ? key.trim() : key] = value

        return acc
      }, {})

      form.value = {
        name: trimmedData['Name'],
        code: trimmedData['Code'],
        description: trimmedData['Description'],
        category: trimmedData['Category'],
        stock: trimmedData['Stock'],
        unit: trimmedData['Unit'],
        buyPrice: trimmedData['BuyPrice'],
        sellPrice: trimmedData['SellPrice'],
        overwrite: overwrite.value,
      }

      uploadCounter.value++
      confirmAddData(form._rawValue)
      uploadData()
    }, 50)
  } else {
    // Loading Screen Off
    isLoading.value = false
  }
}
</script>

<template>
  <div>
    <VSnackbar
      v-model="showSnackbar"
      variant="flat"
      :color="snackbarColor"
    >
      {{ snackbarMessage }}
    </VSnackbar>

    <!-- 👉 Data -->
    <AppCardActions
      v-if="!isAddEdit && !isView"
      :title="module"
      action-refresh
      @refresh="refetchData"
    >
      <VCardText class="d-flex flex-wrap gap-4">
        <VRow>
          <VCol
            cols="12"
            md="8"
          >
            <!-- 👉 Add Button -->
            <VBtn
              v-if="can(module, 'add')"
              class="me-2 my-1"
              prepend-icon="tabler-plus"
              @click="addData"
            >
              Add {{ module }}
            </VBtn>

            <!-- 👉 Download Button -->
            <VBtn
              class="me-2 my-1"
              prepend-icon="tabler-download"
              @click="isDownload = true"
            >
              Download
            </VBtn>

            <!-- 👉 Upload Button -->
            <VBtn
              v-if="can(module, 'add')"
              class="me-2 my-1"
              prepend-icon="tabler-upload"
              @click="isUpload = true"
            >
              Upload
            </VBtn>

            <!-- 👉 Multiple Delete Button -->
            <VBtn
              v-if="selectedRows.length > 0 && can(module, 'delete')"
              class="me-2 my-1"
              color="error"
              @click="isMultipleDelete = true"
            >
              Multiple Delete
            </VBtn>
          </VCol>

          <VCol
            cols="12"
            md="4"
          >
            <!-- 👉 Search -->
            <AppTextField
              v-model="search"
              placeholder="Search"
              density="compact"
              class="my-1"
            />
          </VCol>
        </VRow>
      </VCardText>

      <!-- SECTION Data Table -->
      <VCardText class="d-flex flex-wrap gap-4">
        <VDataTable
          v-model="selectedRows"
          :headers="headers"
          :items="getData"
          :search="search"
          density="compact"
          :items-per-page="10"
          show-select
          item-value="id"
          :height="getData.length > 7 ? '45vh' : undefined"
          fixed-header
        >
          <template #item.category="{ item }">
            <VChip
              :color="resolveCategoryVariant(item.raw.category)"
              class="font-weight-medium"
              size="small"
            >
              {{ item.raw.category }}
            </VChip>
          </template>

          <template #item.stock="{ item }">
            {{ thousandFormatter(item.raw.stock) }}
          </template>

          <template #item.createdAt="{ item }">
            {{ formatDate(item.raw.createdAt) }}
          </template>

          <template #item.updatedAt="{ item }">
            {{ formatDate(item.raw.updatedAt) }}
          </template>

          <!-- Actions -->
          <template #item.actions="{ item }">
            <VBtn
              icon
              size="x-small"
              color="default"
              variant="text"
            >
              <VIcon
                size="22"
                icon="tabler-dots-vertical"
              />
              <VMenu activator="parent">
                <VList>
                  <!-- 👉 View Detail -->
                  <VListItem @click="viewData(item.raw)">
                    <template #prepend>
                      <VIcon
                        class="me-2"
                        icon="tabler-eye"
                        size="22"
                      />
                    </template>
                    <VListItemTitle>Details</VListItemTitle>
                  </VListItem>

                  <!-- 👉 Edit -->
                  <VListItem
                    v-if="can(module, 'edit')"
                    @click="editData(item.raw)"
                  >
                    <template #prepend>
                      <VIcon
                        class="me-2"
                        icon="tabler-edit"
                        size="22"
                      />
                    </template>
                    <VListItemTitle>Edit</VListItemTitle>
                  </VListItem>

                  <!-- 👉 Delete -->
                  <VListItem
                    v-if="can(module, 'delete')"
                    @click="deleteData(item.raw)"
                  >
                    <template #prepend>
                      <VIcon
                        class="me-2"
                        icon="tabler-trash"
                        size="22"
                      />
                    </template>
                    <VListItemTitle>Delete</VListItemTitle>
                  </VListItem>
                </VList>
              </VMenu>
            </VBtn>
          </template>
        </VDataTable>
      </VCardText>
    </AppCardActions>
    
    <AddEditItem
      v-if="isAddEdit"
      v-model:isAddEdit="isAddEdit"
      v-model:method="method"
      v-model:form="form"
      @add="confirmAddData"
      @edit="confirmEditData"
      @view="viewData"
    />

    <ViewItem
      v-if="isView"
      v-model:isView="isView"
      v-model:form="form"
      @edit="editData"
    />

    <ConfirmDialog
      v-model:isDialogVisible="isDelete"
      confirmation-question="Are you sure you want to delete selected item?"
      confirm-title="Deleted!"
      confirm-msg="The selected item has been deleted successfully."
      cancel-title="Cancelled"
      cancel-msg="Item Deletion Cancelled!"
      @confirm="confirmDeleteData"
    />

    <ConfirmDialog
      v-model:isDialogVisible="isMultipleDelete"
      confirmation-question="Are you sure you want to delete selected items?"
      confirm-title="Deleted!"
      confirm-msg="The selected items have been deleted successfully."
      cancel-title="Cancelled"
      cancel-msg="Items Deletion Cancelled!"
      @confirm="multipleDelete"
    />

    <DownloadFileDialog
      v-model:isDialogOpen="isDownload"
      v-model:jsonData="getData"
      v-model:jsonField="field"
      v-model:fileName="fileName"
    />

    <UploadFileDialog
      v-model:isDialogOpen="isUpload"
      v-model:columnName="columnName"
      @data-file="handleUploadData"
    />

    <LoadingScreenDialog
      v-model:isDialogOpen="isLoading"
      v-model:loadingText="loadingText"
    />
  </div>
</template>

<route lang="yaml">
meta:
  subject: Item
  requiresAuth: true
</route>
