<script setup>
import AppSelect from '@/@core/components/app-form-elements/AppSelect.vue'
import { requiredValidator } from '@/@core/utils/validators'
import mapboxgl from 'mapbox-gl';
import { onMounted } from 'vue';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/lib/mapbox-gl-geocoder.css';
import { useUserStore } from '@store/useUserStore';

const dataUserStore = useUserStore()

dataUserStore.fetchUsers()

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

const emit = defineEmits([
    'update:isAddEdit',
    'add',
    'edit',
    'view',
])

const back = () => {
  emit('update:isAddEdit', false)
}
    
const module = ref('Task')
const method = ref(structuredClone(toRaw(props.method)))
const form = ref(structuredClone(toRaw(props.form)))
const refVForm = ref()

const onSubmit = () => {
    if(method.value === 'Add'){
        // console.log(form._rawValue)
        back()
        emit('add', form._rawValue)
    } 
    if(method.value === 'Edit') {
        // console.log('haloo ini edit')
        back()
    }
}

// mapboxgl.accessToken = 'pk.eyJ1IjoiaGVyZGhhIiwiYSI6ImNrN2JkcnVxdTEzcGgzbG51Z2IycHgwcHIifQ.mm9XLuAVnZc4lzAUwtJY1A';

// const map = new mapboxgl.Map({
//     container: 'map', // Container ID
//     style: 'mapbox://styles/mapbox/streets-v12',
//     center: [-74.5, 40],
//     zoom: 14,
//     dragPan: false
// });
const mapToken = 'pk.eyJ1IjoiaGVyZGhhIiwiYSI6ImNrN2JkcnVxdTEzcGgzbG51Z2IycHgwcHIifQ.mm9XLuAVnZc4lzAUwtJY1A';
const mapstart = (token) => {
    mapboxgl.accessToken = token;
    const map = new mapboxgl.Map({
        container: 'mapStart', // Container ID
        style: 'mapbox://styles/mapbox/streets-v12',
        center: [-74.5, 40],
        zoom: 10,
        dragPan: false
    });
    const geocoder = new MapboxGeocoder({
        // Initialize the geocoder
        accessToken: mapboxgl.accessToken, // Set the access token
        mapboxgl: mapboxgl, // Set the mapbox-gl instance
        marker: false, // Do not use the default marker style
        placeholder: 'Search', // Placeholder text for the search bar
        // bbox: [94.9111171, -11.1045868, 141.029649, 6.1748218], // Boundary for Berkeley
        // proximity: {
        //   longitude: a,
        //   latitude: b
        // } // Coordinates of UC Berkeley
    });
    map.addControl(geocoder);
    map.scrollZoom.disable();
    map.on('load', () => {
        map.addSource('single-point', {
            'type': 'geojson',
            'data': {
                'type': 'FeatureCollection',
                'features': []
            }
        });
    
        map.addLayer({
            'id': 'point',
            'source': 'single-point',
            'type': 'circle',
            'paint': {
                'circle-radius': 10,
                'circle-color': '#448ee4'
            }
        });
    
        geocoder.on('result', (event) => {
            map.getSource('single-point').setData(event.result.geometry);
            form._value.areaStart.location = event.result.place_name
            form._value.areaStart.long = event.result.center[0]
            form._value.areaStart.lat = event.result.center[1]
            // console.log(event.result)
        });
    });
}

const mapEnd = (token) => {
    mapboxgl.accessToken = token;
    const map = new mapboxgl.Map({
        container: 'mapEnd', // Container ID
        style: 'mapbox://styles/mapbox/streets-v12',
        center: [-74.5, 40],
        zoom: 10,
        dragPan: false
    });
    const geocoder = new MapboxGeocoder({
        // Initialize the geocoder
        accessToken: mapboxgl.accessToken, // Set the access token
        mapboxgl: mapboxgl, // Set the mapbox-gl instance
        marker: false, // Do not use the default marker style
        placeholder: 'Search', // Placeholder text for the search bar
        // bbox: [94.9111171, -11.1045868, 141.029649, 6.1748218], // Boundary for Berkeley
        // proximity: {
        //   longitude: a,
        //   latitude: b
        // } // Coordinates of UC Berkeley
    });
    map.addControl(geocoder);
    map.scrollZoom.disable();
    map.on('load', () => {
        map.addSource('single-point', {
            'type': 'geojson',
            'data': {
                'type': 'FeatureCollection',
                'features': []
            }
        });

        map.addLayer({
            'id': 'point',
            'source': 'single-point',
            'type': 'circle',
            'paint': {
                'circle-radius': 10,
                'circle-color': '#448ee4'
            }
        });

        geocoder.on('result', (event) => {
            map.getSource('single-point').setData(event.result.geometry);
            form._value.areaEnd.location = event.result.place_name
            form._value.areaEnd.long = event.result.center[0]
            form._value.areaEnd.lat = event.result.center[1]
        });
    });
}

onMounted(()=>{
    mapstart(mapToken)
    mapEnd(mapToken)
})

</script>
<template>
    <VCard :title="`${method} ${module}`">
        <VCardText class="d-flex flex-wrap gap-4">
            <div>
                <VBtn
                    class="me-2"
                    prepend-icon="tabler-chevron-left"
                    @click="back"
                >
                    Back to {{ module }}
                </VBtn>
            </div>
        </VCardText>
        
        <VCardText>
            <VForm
                ref="refVForm"
                @submit.prevent="onSubmit"
            >
                <VCol
                    cols="12"
                    md="12"
                >
                    <AppTextField
                        v-model="form.title"
                        label="Task Name"
                        placeholder="Name"
                    />
                </VCol>
                <VCol
                    cols="12"
                    md="12"
                >
                    <AppTextField
                        v-model="form.description"
                        label="Descriptiton"
                        placeholder="Name"
                    />
                </VCol>
                <VCol
                    cols="12"
                    md="12"
                >
                    <AppSelect
                        v-model="form.assignTo"
                        label="AssignTo"
                        placeholder="Assign To"
                        :items="dataUserStore.getUsers"
                        item-title="username"
                        item-value="_id"
                    />
                </VCol>
                <VCol>
                    <VRow>
                        <VCol
                            cols="12"
                            md="6"
                        >                            
                            <div class="text-body-2">From</div>
                            <div id="mapStart" style="height: 400px;"></div>
                            <!-- <MapboxMap
                                style="height: 400px"
                                ref="mapboxMap"
                                map-style="mapbox://styles/mapbox/streets-v11"
                                access-token="pk.eyJ1IjoiaGVyZGhhIiwiYSI6ImNsbXB1cXM0ZzFub2MycnRjb280YzAzdmgifQ.XRPB_SOt1WwmFZ29sPZeVw" /> -->
                            <VCol class="px-0">
                                <AppTextField
                                    v-model="form.areaStart.location"
                                    label="Location"
                                    placeholder="Location"
                                    readonly
                                />
                            </VCol>
                            <div class="d-flex align-center">
                                <VCol class="ps-0">
                                    <AppTextField
                                        v-model="form.areaStart.long"
                                        label="Longitude"
                                        placeholder="Longitude"
                                        readonly
                                    />
                                </VCol>
                                <VCol class="pe-0">
                                    <AppTextField
                                        v-model="form.areaStart.lat"
                                        label="Latitude"
                                        placeholder="Latitude"
                                        readonly
                                    />
                                </VCol>
                            </div>                                
                        </VCol>
                        <VCol
                            cols="12"
                            md="6"
                        >                            
                            <div class="text-body-2">To</div>
                            <div id="mapEnd" style="height: 400px;"></div>
                            <VCol class="px-0">
                                <AppTextField
                                    v-model="form.areaEnd.location"
                                    label="Location"
                                    placeholder="Location"
                                    readonly
                                />
                            </VCol>
                            <div class="d-flex align-center">
                                <VCol class="ps-0">
                                    <AppTextField
                                        v-model="form.areaEnd.long"
                                        label="Longitude"
                                        placeholder="Longitude"
                                        readonly
                                    />
                                </VCol>
                                <VCol class="pe-0">
                                    <AppTextField
                                        v-model="form.areaEnd.lat"
                                        label="Latitude"
                                        placeholder="Latitude"
                                        readonly
                                    />
                                </VCol>
                            </div>                                
                        </VCol>
                    </VRow>
                </VCol>
                <VCol
                    cols="12"
                    class="d-flex gap-4"
                >
                    <VBtn
                        type="reset"
                        color="secondary"
                        variant="text"
                        class="ms-auto"
                    >
                        Cancel
                    </VBtn>
                    <VBtn
                        type="reset"
                        color="red"
                        variant="outlined"
                    >
                        Reset
                    </VBtn>
                    <VBtn type="submit" variant="flat">
                        Submit
                    </VBtn>
                </VCol>
            </VForm>
        </VCardText>
    </VCard>
</template>