<script setup>
import { getAreaChartSplineConfig } from '@core/libs/apex-chart/apexChartConfig';
import VueApexCharts from 'vue3-apexcharts';
import { getAreaSplineConfig } from '@core/libs/highchart/highchartConfig';
import { useTheme } from 'vuetify';
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

// access store
const newDashStore = useNewDashStore()
// access vuetify
const vuetifyTheme = useTheme()

// fetch data
newDashStore.fetchInboundWeek()

// highchart
const seriesReceive = computed(()=>{ return newDashStore.getDataInboundWeekReceive.series})
const categoryReceive = computed(()=>{ return newDashStore.getDataInboundWeekReceive.categoryReceive})

const seriesUnpacking = computed(()=>{ return newDashStore.getDataInboundWeekUnpacking.seriesUnpacking})
const categoryUnpacking = computed(()=>{ return newDashStore.getDataInboundWeekUnpacking.categoryUnpacking})

const seriesPutaway = computed(()=>{ return newDashStore.getDataInboundWeekPutaway.seriesPutaway})
const categoryPutaway = computed(()=>{ return newDashStore.getDataInboundWeekPutaway.categoryPutaway})

const setOption = (series, category)=>{
    const config = getAreaSplineConfig(vuetifyTheme.current.value)
    config.series = series
    config.xAxis.categories = category
    return config
}
const optionReceive = ref(setOption(seriesReceive, categoryReceive))
const optionUnpacking = ref(setOption(seriesUnpacking, categoryUnpacking))
const optionPutaway = ref(setOption(seriesPutaway, categoryPutaway))

// apex
// const receive = computed(()=>{ return newDashStore.getDataInboundWeekReceive.series})
// const receiveOpt = computed(() => {
//     const config = getAreaChartSplineConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataInboundWeekReceive.categoryReceive
//     config.colors = ['#2caffe']
//     config.stroke.show = true
//     config.markers = { size: 5, hover: {size: 7} }
//     config.stroke.curve = 'smooth'
//     config.grid.xaxis = {lines:{show: false}}
//     return config
// })

// const unpacking = computed(()=>{ return newDashStore.getDataInboundWeekUnpacking.seriesUnpacking})
// const unpackingOpt = computed(() => {
//     const config = getAreaChartSplineConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataInboundWeekUnpacking.categoryUnpacking
//     config.colors = ['#2caffe']
//     config.stroke.show = true
//     config.stroke.curve = 'smooth'
//     config.grid.xaxis = {lines:{show: false}}
//     config.markers = { size: 5, hover: {size: 7} }
//     return config
// })

// const putaway = computed(()=>{ return newDashStore.getDataInboundWeekPutaway.seriesPutaway})
// const putawayOpt = computed(() => {
//     const config = getAreaChartSplineConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataInboundWeekPutaway.categoryPutaway
//     config.stroke.show = true
//     config.colors = ['#2caffe']
//     config.stroke.curve = 'smooth'
//     config.grid.xaxis = {lines:{show: false}}
//     config.markers = { size: 5, hover: {size: 7} }
//     return config
// })

// define variable
let receiveUpdate = ref()
let unpackingUpdate = ref()
let putawayUpdate = ref()
let receive = ref([])
let receiveOpt = ref(getAreaChartSplineConfig(vuetifyTheme.current.value))
let unpacking = ref([])
let unpackingOpt = ref(getAreaChartSplineConfig(vuetifyTheme.current.value))
let putaway = ref([])
let putawayOpt = ref(getAreaChartSplineConfig(vuetifyTheme.current.value))

receiveOpt.value.chart.zoom = {enabled: false}
receiveOpt.value.chart.width = '100%'

unpackingOpt.value.chart.zoom = {enabled: false}
unpackingOpt.value.chart.width = '100%'

putawayOpt.value.chart.zoom = {enabled: false}
putawayOpt.value.chart.width = '100%'
// function to update chart receive
const updateChartReceive = async()=>{
    // get series to update
    receive.value = await newDashStore.getDataInboundWeekReceive.series

    // set new series
    const newSeries = [
        {name: receive.value[0].name, data: receive.value[0].data}
    ]

    // styling xaxis
    const xaxis = { ...receiveOpt.value.xaxis }
    xaxis.categories = await newDashStore.getDataInboundWeekReceive.categoryReceive

    // styling stroke
    const stroke = { ...receiveOpt.value.stroke }
    stroke.show = true
    stroke.curve = 'smooth'

    // styling grid
    const grid = { ...receiveOpt.value.grid }
    grid.xaxis.lines.show = false

    // styling marker point line
    receiveOpt.value.markers = { size: 4, hover: {size: 6}, strokeWidth: 3, colors: ['#fff'], strokeColors: ['#2caffe'] }
    
    // style fill gradient
    receiveOpt.value.fill = {
                                type: 'gradient',
                                gradient:{
                                    opacityFrom: 0.8,
                                    opacityTo: 0.1
                                }
                            }

    // config update
    const config = {
        series: newSeries,
        colors: ['#2caffe'],
        xaxis: xaxis,
        stroke: stroke,
        grid: grid,
        markers: receiveOpt.value.markers,
        fill: receiveOpt.value.fill
    }

    // update data
    receiveUpdate.value.updateOptions(config)
}

// function to update chart unpacking
const updateChartUnpacking = async()=>{
    // get series to update
    unpacking.value = await newDashStore.getDataInboundWeekUnpacking.seriesUnpacking

    // set new series
    const newSeries = [
        {name: unpacking.value[0].name, data: unpacking.value[0].data}
    ]

    // styling xaxis
    const xaxis = { ...unpackingOpt.value.xaxis }
    xaxis.categories = await newDashStore.getDataInboundWeekUnpacking.categoryUnpacking

    // styling stroke
    const stroke = { ...unpackingOpt.value.stroke }
    stroke.show = true
    stroke.curve = 'smooth'

    // styling grid
    const grid = { ...unpackingOpt.value.grid }
    grid.xaxis.lines.show = false

    // styling marker point line
    unpackingOpt.value.markers = { size: 4, hover: {size: 6}, strokeWidth: 3, colors: ['#fff'], strokeColors: ['#2caffe'] }

    // style fill gradient
    unpackingOpt.value.fill = {
                                type: 'gradient',
                                gradient:{
                                    opacityFrom: 0.8,
                                    opacityTo: 0.1
                                }
                            }

    // config update
    const config = {
        series: newSeries,
        colors: ['#2caffe'],
        xaxis: xaxis,
        stroke: stroke,
        grid: grid,
        markers: unpackingOpt.value.markers,
        fill: unpackingOpt.value.fill
    }

    // update data
    unpackingUpdate.value.updateOptions(config)
}

// function to update chart unpacking
const updateChartPutaway = async()=>{
    // get series to update
    putaway.value = await newDashStore.getDataInboundWeekPutaway.seriesPutaway

    // set new series
    const newSeries = [
        {name: putaway.value[0].name, data: putaway.value[0].data}
    ]

    // styling xaxis
    const xaxis = { ...putawayOpt.value.xaxis }
    xaxis.categories = await newDashStore.getDataInboundWeekPutaway.categoryPutaway

    // styling stroke
    const stroke = { ...putawayOpt.value.stroke }
    stroke.show = true
    stroke.curve = 'smooth'

    // styling grid
    const grid = { ...putawayOpt.value.grid }
    grid.xaxis.lines.show = false

    // styling marker point line
    putawayOpt.value.markers = { size: 4, hover: {size: 6}, strokeWidth: 3, colors: ['#fff'], strokeColors: ['#2caffe'] }

    // style fill gradient
    putawayOpt.value.fill = {
                                type: 'gradient',
                                gradient:{
                                    opacityFrom: 0.8,
                                    opacityTo: 0.1
                                }
                            }

    // config update
    const config = {
        series: newSeries,
        colors: ['#2caffe'],
        xaxis: xaxis,
        stroke: stroke,
        grid: grid,
        markers: putawayOpt.value.markers,
        fill: putawayOpt.value.fill
    }

    // update data
    putawayUpdate.value.updateOptions(config)
}
const toggle = ref(0)
let isReceive = ref(true)
let isUnpacking = ref(false)
let isPutaway = ref(false)
</script>

<template>
    
    <VCardItem>
        <VCardTitle>Inbound By Week</VCardTitle>
        <template #append>
            <div class="d-flex align-center">
                <v-btn-toggle
                    v-model="toggle"
                    divided
                    mandatory
                    variant="outlined"
                >
                    <VBtn @click="isUnpacking = false, isPutaway = false, isReceive = true">Receive</VBtn>
                    <VBtn @click="isUnpacking = true, isPutaway = false, isReceive = false">Unpacking</VBtn>
                    <VBtn @click="isUnpacking = false, isPutaway = true, isReceive = false">Put Away</VBtn>
                </v-btn-toggle>
            </div>
        </template>
    </VCardItem>
    <VCardText>
        <VRow>
            <VCol v-if="isReceive">
                <!-- <VCardSubtitle class="px-0">Receive</VCardSubtitle> -->
                <VCardText class="pa-0">
                    <!-- <highcharts :options="optionReceive"/> -->
                    <VueApexCharts
                        ref="receiveUpdate"
                        type="area"
                        height="300"
                        :options="receiveOpt"
                        :series="receive"
                        :state="updateChartReceive()"
                    />
                </VCardText>
            </VCol>
            <VCol v-if="isUnpacking">
                <!-- <VCardSubtitle class="px-0">Unpacking</VCardSubtitle> -->
                <VCardText class="pa-0">
                    <!-- <highcharts :options="optionUnpacking"/> -->
                    <VueApexCharts
                        ref="unpackingUpdate"
                        type="area"
                        height="300"
                        :options="unpackingOpt"
                        :series="unpacking"
                        :state="updateChartUnpacking()"
                    />
                </VCardText>
            </VCol>
            <VCol v-if="isPutaway">
                <!-- <VCardSubtitle class="px-0">Put Away</VCardSubtitle> -->
                <VCardText class="pa-0">
                    <!-- <highcharts :options="optionPutaway"/> -->
                    <VueApexCharts
                        ref="putawayUpdate"
                        type="area"
                        height="300"
                        :options="putawayOpt"
                        :series="putaway"
                        :state="updateChartPutaway()"
                    />
                </VCardText>
            </VCol>
        </VRow>
    </VCardText>
</template>

<style lang="scss">
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
</style>