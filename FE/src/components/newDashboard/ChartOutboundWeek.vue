<script setup>
import { getLineChartSimpleConfig } from '@core/libs/apex-chart/apexChartConfig';
import VueApexCharts from 'vue3-apexcharts';
import { getSplineConfig } from '@core/libs/highchart/highchartConfig';
import { useTheme } from 'vuetify';
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

// access store
const newDashStore = useNewDashStore()
// access vuetify
const vuetifyTheme = useTheme()

// fetch data
newDashStore.fetchOutboundWeek()

// highchart
const seriesPicking = computed(()=>{ return newDashStore.getDataOutboundWeekPicking.seriesPicking})
const categoryPicking = computed(()=>{ return newDashStore.getDataOutboundWeekPicking.categoryPicking})

const seriesPacking = computed(()=>{ return newDashStore.getDataOutboundWeekPacking.seriesPacking})
const categoryPacking = computed(()=>{ return newDashStore.getDataOutboundWeekPacking.categoryPacking})

const seriesDelivery = computed(()=>{ return newDashStore.getDataOutboundWeekDelivery.seriesDelivery})
const categoryDelivery = computed(()=>{ return newDashStore.getDataOutboundWeekDelivery.categoryDelivery})

const setOption = (series, category)=>{
    const config = getSplineConfig(vuetifyTheme.current.value)
    config.series = series
    config.xAxis.categories = category
    return config
}

const optionPicking = ref(setOption(seriesPicking, categoryPicking))
const optionPacking = ref(setOption(seriesPacking, categoryPacking))
const optionDelivery = ref(setOption(seriesDelivery, categoryDelivery))

// apex
let pickingUpdate = ref()
let picking = ref([])
let pickingOpt = ref(getLineChartSimpleConfig(vuetifyTheme.current.value))
delete pickingOpt.value.tooltip

let packingUpdate = ref()
let packing = ref([])
let packingOpt = ref(getLineChartSimpleConfig(vuetifyTheme.current.value))
delete packingOpt.value.tooltip

let deliveryUpdate = ref()
let delivery = ref([])
let deliveryOpt = ref(getLineChartSimpleConfig(vuetifyTheme.current.value))
delete deliveryOpt.value.tooltip

// function to update chart picking
const updateChartPicking = async()=>{
    // get series to update
    picking.value = await newDashStore.getDataOutboundWeekPicking.seriesPicking

    // set new series
    const newSeries = [
        {name: picking.value[0].name, data: picking.value[0].data}
    ]

    // styling xaxis
    const xaxis = { ...pickingOpt.value.xaxis }
    xaxis.categories = await newDashStore.getDataOutboundWeekPicking.categoryPicking

    // styling stroke
    const stroke = { ...pickingOpt.value.stroke }
    stroke.show = true
    stroke.curve = 'smooth'

    // styling grid
    const grid = { ...pickingOpt.value.grid }
    grid.xaxis.lines.show = false

    // styling marker point line
    pickingOpt.value.markers = { size: 4, hover: {size: 6}, strokeWidth: 3, colors: ['#fff'], strokeColors: ['#544fc5'] }

    // config update
    const config = {
        series: newSeries,
        colors: ['#544fc5'],
        xaxis: xaxis,
        stroke: stroke,
        grid: grid,
        markers: pickingOpt.value.markers
    }

    // update data
    pickingUpdate.value.updateOptions(config)
}

// function to update chart packing
const updateChartPacking = async()=>{
    // get series to update
    packing.value = await newDashStore.getDataOutboundWeekPacking.seriesPacking

    // set new series
    const newSeries = [
        {name: packing.value[0].name, data: packing.value[0].data}
    ]

    // styling xaxis
    const xaxis = { ...packingOpt.value.xaxis }
    xaxis.categories = await newDashStore.getDataOutboundWeekPacking.categoryPacking

    // styling stroke
    const stroke = { ...packingOpt.value.stroke }
    stroke.show = true
    stroke.curve = 'smooth'

    // styling grid
    const grid = { ...packingOpt.value.grid }
    grid.xaxis.lines.show = false

    // styling marker point line
    packingOpt.value.markers = { size: 4, hover: {size: 6}, strokeWidth: 3, colors: ['#fff'], strokeColors: ['#544fc5'] }

    // config update
    const config = {
        series: newSeries,
        colors: ['#544fc5'],
        xaxis: xaxis,
        stroke: stroke,
        grid: grid,
        markers: packingOpt.value.markers
    }

    // update data
    packingUpdate.value.updateOptions(config)
}

const updateChartDelivery = async()=>{
    // get series to update
    delivery.value = await newDashStore.getDataOutboundWeekDelivery.seriesDelivery

    // set new series
    const newSeries = [
        {name: delivery.value[0].name, data: delivery.value[0].data}
    ]

    // styling xaxis
    const xaxis = { ...deliveryOpt.value.xaxis }
    xaxis.categories = await newDashStore.getDataOutboundWeekDelivery.categoryDelivery

    // styling stroke
    const stroke = { ...deliveryOpt.value.stroke }
    stroke.show = true
    stroke.curve = 'smooth'

    // styling grid
    const grid = { ...deliveryOpt.value.grid }
    grid.xaxis.lines.show = false

    // styling marker point line
    deliveryOpt.value.markers = { size: 4, hover: {size: 6}, strokeWidth: 3, colors: ['#fff'], strokeColors: ['#544fc5'] }

    // config update
    const config = {
        series: newSeries,
        colors: ['#544fc5'],
        xaxis: xaxis,
        stroke: stroke,
        grid: grid,
        markers: deliveryOpt.value.markers
    }

    // update data
    deliveryUpdate.value.updateOptions(config)
}


// const picking = computed(()=>{ return newDashStore.getDataOutboundWeekPicking.seriesPicking})
// const pickingOpt = computed(() => {
//     const config = getLineChartSimpleConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataOutboundWeekPicking.categoryPicking
//     config.grid.xaxis.lines.show = false
//     config.colors = ['#544fc5']
//     config.stroke.curve = 'smooth'
//     config.markers = { size: 5, hover: {size: 7} }
//     return config
// })

// const packing = computed(()=>{ return newDashStore.getDataOutboundWeekPacking.seriesPacking})
// const packingOpt = computed(() => {
//     const config = getLineChartSimpleConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataOutboundWeekPacking.categoryPacking
//     config.grid.xaxis.lines.show = false
//     config.colors = ['#544fc5']
//     config.stroke.curve = 'smooth'
//     config.markers = { size: 5, hover: {size: 7} }
//     return config
// })

// const delivery = computed(()=>{ return newDashStore.getDataOutboundWeekDelivery.seriesDelivery})
// const deliveryOpt = computed(() => {
//     const config = getLineChartSimpleConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataOutboundWeekDelivery.categoryDelivery
//     config.grid.xaxis.lines.show = false
//     config.colors = ['#544fc5']
//     config.stroke.curve = 'smooth'
//     config.markers = { size: 5, hover: {size: 7} }
//     return config
// })

const toggle = ref(0)
let isPicking = ref(true)
let isPacking = ref(false)
let isDelivery = ref(false)
</script>

<template>
    <VCardItem>
        <VCardTitle>Outbound By Week</VCardTitle>
        <template #append>
            <div class="d-flex align-center">
                <v-btn-toggle
                    v-model="toggle"
                    divided
                    mandatory
                    variant="outlined"
                >
                    <VBtn @click="isPicking = true, isPacking = false, isDelivery = false">Picking</VBtn>
                    <VBtn @click="isPicking = false, isPacking = true, isDelivery = false">Packing</VBtn>
                    <VBtn @click="isPicking = false, isPacking = false, isDelivery = true">Delivery</VBtn>
                </v-btn-toggle>
            </div>
        </template>
    </VCardItem>
    <VCardText>
        <VRow>
            <VCol v-if="isPicking">
                <!-- <VCardSubtitle class="px-0">Picking</VCardSubtitle> -->
                <VCardText class="pa-0">
                    <!-- <highcharts :options="optionPicking"/> -->
                    <VueApexCharts
                        ref="pickingUpdate"
                        type="line"
                        height="300"
                        :options="pickingOpt"
                        :series="picking"
                        :state="updateChartPicking()"
                    />
                </VCardText>
            </VCol>
            <VCol v-if="isPacking">
                <!-- <VCardSubtitle class="px-0">Packing</VCardSubtitle> -->
                <VCardText class="pa-0">
                    <!-- <highcharts :options="optionPacking"/> -->
                    <VueApexCharts
                        ref="packingUpdate"
                        type="line"
                        height="300"
                        :options="packingOpt"
                        :series="packing"
                        :state="updateChartPacking()"
                    />
                </VCardText>
            </VCol>
            <VCol v-if="isDelivery">
                <!-- <VCardSubtitle class="px-0">Delivery</VCardSubtitle> -->
                <VCardText class="pa-0">
                    <!-- <highcharts :options="optionDelivery"/> -->
                    <VueApexCharts
                        ref="deliveryUpdate"
                        type="line"
                        height="300"
                        :options="deliveryOpt"
                        :series="delivery"
                        :state="updateChartDelivery()"
                    />
                </VCardText>
            </VCol>
        </VRow>
    </VCardText>
</template>

<!-- <style lang="scss">
.v-btn-group{
    padding: 4px;
    border: 1px solid #e5e5e5;
    border-radius: 50px;

    .v-btn{
        border-radius: 50px;
        border: 0;
        border-inline-end-style: none !important;
        font-size: .75rem;
    }
    .v-btn.v-btn--active{
        color: white;
        background: #2b6a98;
    }
}
.v-btn-group--density-default.v-btn-group{
    height: 40px;
}
</style> -->
