<script setup>
import AppCardActions from '@/@core/components/cards/AppCardActions.vue';
import { useTaskStore } from '@store/useTaskStore'
import { useAuthStore } from '@store/useAuthStore'
import { can, pageTitle } from '@utils'
import { VDataTable } from 'vuetify/labs/VDataTable'
// import AddTask from '@components/task/task/AddTask.vue';

const page = 'Task'

document.title = pageTitle(page)

const dataStore = useTaskStore()
const authStore = useAuthStore()

dataStore.fetchTasks()
authStore.currentUser()

const getData = computed(() => {
  return dataStore.getDataTask
})

const headers = [
    {
        title: 'Title',
        key: 'title',
    },
    {
        title: 'Description',
        key: 'description',
    },
    {
        title: 'Start Location',
        key: 'areaStart.areaName',
    },
    {
        title: 'End Location',
        key: 'areaEnd.areaName',
    },
    {
        title: authStore.getActiveUser.role === 'User Biasa' ? 'From' : 'To',
        key: authStore.getActiveUser.role === 'User Biasa' ? 'assignBy.username' : 'assignTo.username',
    },
    {
        title: 'Status',
        key: 'statusTask',
        sortable: false,
        align: 'center'
    },
    {
        title: 'Start',
        key: 'timeStart',
    },
    {
        title: 'End',
        key: 'timeEnd',
    },
    {
        title: 'Duration',
        key: 'timeTotal',
    },
    {
        title: 'ACTIONS',
        key: 'actions',
        sortable: false,
        align: 'center'
    }
]

const statusTask = status => {
    if (status === 'On')
        return 'primary'
    else if (status  === 'Running')
        return 'warning'
    else
        return 'danger'
}

const showSnackbar = ref(false)
const snackbarColor = ref('')
const snackbarMessage = ref('')

const search = ref('')

const isAddEdit = ref(false)
const isDelete = ref(false)
const method = ref('')

const dataAreaStart = {location: null, long: null, lat: null}
const dataAreaEnd = {location: null, long: null, lat: null}

const form = ref({
  title: null,
  description: null,
  areaStart: dataAreaStart,
  areaEnd: dataAreaEnd,
  assignTo: null,
})

const clearFields = () => {
    form.value = {
        title: null,
        description: null,
        areaStart: {location: null, long: null, lat: null},
        areaEnd: {location: null, long: null, lat: null},
        assignTo: null,
    }
}

const newTask = ()=>{
    isAddEdit.value = true
    method.value = 'Add'
    clearFields()
    // console.log(dataStore.getDataTask)
}

const newDataTask = (data) => {
    // console.log(`data task ${JSON.stringify(data)}`)
    dataStore.postTask(data)
    .then(()=>{
        showSnackbar.value = true
        snackbarColor.value = 'success'
        snackbarMessage.value = `New ${page} is successfully registered.`
    })
    .catch(error => {
        showSnackbar.value = true
        snackbarColor.value = 'error'
        snackbarMessage.value = error.response.data.message
        console.error(error)
    })
}

const deleteData = data => {
    isDelete.value = true
    form.value = { ...data }
}

const confirmDeleteData = value => {
    console.log(form.value._id)
    if (value) {
        dataStore.delTask({id: form.value._id})
        .then(() => {
            showSnackbar.value = true
            snackbarColor.value = 'success'
            snackbarMessage.value = `${page} is successfully deleted.`
        })
        .catch(error => {
            showSnackbar.value = true
            snackbarColor.value = 'error'
            snackbarMessage.value = error
            console.error(error)
        })
    }
}

const startTask = (value) => {
    navigator.geolocation.getCurrentPosition(
        (point)=>{
            dataStore.getOneTask({id: value._id})
            .then((d)=>{
                const calcDistance = distance(d.areaStart.lat, point.coords.latitude, d.areaStart.long, point.coords.longitude)
                console.log('lat api '+d.areaStart.lat)
                console.log('lat user '+point.coords.latitude)
                console.log('long api '+d.areaStart.long)
                console.log('long user '+point.coords.longitude)
                console.log('jarak '+calcDistance)

                if(calcDistance<=30000000){
                    console.log('kurang dari 3jt m')
                    dataStore.startTask({id: value._id})
                    .then(()=>{
                        showSnackbar.value = true
                        snackbarColor.value = 'success'
                        snackbarMessage.value = `${page} is running.`
                    })
                    .catch((e)=>{
                        showSnackbar.value = true
                        snackbarColor.value = 'error'
                        snackbarMessage.value = e.response.data
                        console.log(e)
                    })
                } else {
                    console.log('lebih dari 3jt m')
                    showSnackbar.value = true
                    snackbarColor.value = 'warning'
                    snackbarMessage.value = `Come a lil bit closer to execute this task`
                }
            })
            .catch((e)=>{
                showSnackbar.value = true
                snackbarColor.value = 'error'
                snackbarMessage.value = e.response.data
                console.log(e)
            })
        }, 
        (err)=>{
            console.log(err)
        }
    );
}

const endTask = (value) => {
    console.log('task has done, thanks')
    navigator.geolocation.getCurrentPosition(
        (point)=>{
            dataStore.getOneTask({id: value._id})
            .then((d)=>{
                const calcDistance = distance(d.areaEnd.lat, point.coords.latitude, d.areaEnd.long, point.coords.longitude)
                console.log('lat api '+d.areaEnd.lat)
                console.log('lat user '+point.coords.latitude)
                console.log('long api '+d.areaEnd.long)
                console.log('long user '+point.coords.longitude)
                console.log('jarak '+calcDistance)

                if(calcDistance<=3000000){
                    dataStore.endTask({id: value._id})
                    .then((d)=>{
                        showSnackbar.value = true
                        snackbarColor.value = 'success'
                        snackbarMessage.value = d.data.message
                    })
                    .catch((e)=>{
                        showSnackbar.value = true
                        snackbarColor.value = 'error'
                        snackbarMessage.value = e.response.data
                        console.log(e)
                    })
                } else {
                    console.log('salah')
                    showSnackbar.value = true
                    snackbarColor.value = 'warning'
                    snackbarMessage.value = `Come a lil bit closer to execute this task`
                }

            })
            .catch((e)=>{
                showSnackbar.value = true
                snackbarColor.value = 'error'
                snackbarMessage.value = e.response.data
                console.log(e)
            })
        },
        (err)=>{
            console.log(err)
        }
    )
}

function distance(lat1, lat2, lon1, lon2){
    lon1 =  lon1 * Math.PI / 180;
    lon2 = lon2 * Math.PI / 180;
    lat1 = lat1 * Math.PI / 180;
    lat2 = lat2 * Math.PI / 180;

    let dlon = lon2 - lon1;
    let dlat = lat2 - lat1;
    let a = Math.pow(Math.sin(dlat / 2), 2)
    + Math.cos(lat1) * Math.cos(lat2)
    * Math.pow(Math.sin(dlon / 2),2);

    let c = 2 * Math.asin(Math.sqrt(a));
    
    let r = 6371;
    let meter = (c * r) * 1000
    
    return(meter);
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

        <AppCardActions
            v-if="!isAddEdit"
            :noActions="true"
            :title="page"
            action-refresh
        >
            <VCardText>
                <VRow>
                    <VCol
                        cols="12"
                        md="8"
                    >
                        <VBtn                        
                            class="me-2 my-1"
                            prepend-icon="tabler-plus"
                            v-if="can(page, 'add')"
                            @click="newTask"
                        >
                            Add {{ page }}
                        </VBtn>
                    </VCol>
                    <VCol
                        cols="12"
                        md="4"
                    >
                        <AppTextField
                            v-model="search"
                            placeholder="Search"
                            density="compact"
                            class="my-1"
                        />
                    </VCol>
                </VRow>
                
            </VCardText>
            <VCardText>
                <VDataTable
                    :headers="headers"
                    :search="search"
                    :items="getData"
                >
                    <template #item.statusTask="{ item }">
                        <VChip
                            :color="statusTask(item.raw.statusTask)"
                            class="font-weight-medium"
                            size="small"
                        >
                            {{ item.raw.statusTask }}
                        </VChip>
                    </template>

                    <template #item.actions="{ item }">
                        <VBtn
                            icon
                            size="x-small"
                            color="default"
                            variant="text"
                        >
                            <VIcon
                                size="22"
                                icon="tabler-dots"
                            />
                            <VMenu activator="parent">
                                <VList>
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
                                    <VListItem 
                                        v-if="can(page, 'edit')"
                                        @click="editData(item.raw)">
                                        <template #prepend>
                                            <VIcon
                                                class="me-2"
                                                icon="tabler-edit"
                                                size="22"
                                            />
                                        </template>
                                        <VListItemTitle>Edit</VListItemTitle>
                                    </VListItem>
                                    <VListItem
                                        v-if="can(page, 'delete')"
                                        @click="deleteData(item.raw)">
                                        <template #prepend>
                                            <VIcon
                                                class="me-2"
                                                icon="tabler-trash"
                                                size="22"
                                            />
                                        </template>
                                        <VListItemTitle>Delete</VListItemTitle>
                                    </VListItem>
                                    <VListItem
                                        v-if="can(page, 'start')" 
                                        @click="startTask(item.raw)">
                                        <template #prepend>
                                            <VIcon
                                                class="me-2"
                                                icon="tabler-eye"
                                                size="22"
                                            />
                                        </template>
                                        <VListItemTitle>Start Task</VListItemTitle>
                                    </VListItem>
                                    <VListItem
                                        v-if="can(page, 'end')"
                                        @click="endTask(item.raw)">
                                        <template #prepend>
                                            <VIcon
                                                class="me-2"
                                                icon="tabler-eye"
                                                size="22"
                                            />
                                        </template>
                                        <VListItemTitle>End Task</VListItemTitle>
                                    </VListItem>
                                </VList>
                            </VMenu>
                        </VBtn>
                    </template>
                </VDataTable>
            </VCardText>
        </AppCardActions>

        
        <AddTask
            v-if="isAddEdit"
            v-model:isAddEdit="isAddEdit"
            v-model:method="method"
            v-model:form="form"
            @add="newDataTask"
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
    </div>
</template>