<script setup>
import { getColumnChartConfig } from '@core/libs/apex-chart/apexChartConfig';
import VueApexCharts from 'vue3-apexcharts';
import { getColumnConfig } from '@core/libs/highchart/highchartConfig';
import { useTheme } from 'vuetify';
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

// access store
const newDashStore = useNewDashStore()
// access vuetify
const vuetifyTheme = useTheme()

// fetch data
newDashStore.fetchOutboundMonth()

// highchart
const dataSeries = computed(()=>{ return newDashStore.getDataOutboundMonth.series})
const dataCategories = computed(()=>{ return newDashStore.getDataOutboundMonth.categories})
const setOption = ()=>{
    const config = getColumnConfig(vuetifyTheme.current.value)
    config.xAxis.categories = dataCategories
    config.series = dataSeries
    return config
}
const option = ref(setOption())

// apex
// const series = computed(()=>{ return newDashStore.getDataOutboundMonth.series})
// const chartConfig = computed(() => {
//     const config = getColumnChartConfig(vuetifyTheme.current.value)
//     config.xaxis.categories = newDashStore.getDataOutboundMonth.categories
//     config.xaxis.crosshairs = {show: false}
//     config.colors = ['#544fc5','#2caffe','#00e272']
//     config.chart.stacked = false
//     config.plotOptions.bar.columnWidth = '35%'
//     config.stroke.width = 5
//     config.grid.xaxis.lines.show = false
//     delete config.plotOptions.bar.colors
//     return config
// })

// define variable
let dataUpdate = ref()
let series = ref([])
let optionConfig = ref(getColumnChartConfig(vuetifyTheme.current.value))

// function to update chart
const updateChart = async()=>{
    // get series to update
    series.value = await newDashStore.getDataOutboundMonth.series
    // set new series
    const newSeries = [
        {name: series.value[0].name, data: series.value[0].data},
        {name: series.value[1].name, data: series.value[1].data},
        {name: series.value[2].name, data: series.value[2].data}
    ]
    
    // styling xaxis
    const xaxis = { ...optionConfig.value.xaxis }
    xaxis.categories = await newDashStore.getDataOutboundMonth.categories
    xaxis.crosshairs.show = false

    // styling stacked
    const stacked = { ...optionConfig.value.chart }
    stacked.stacked = false

    // styling plotoption
    const plotoption = { ...optionConfig.value.plotOptions}
    plotoption.bar.columnWidth = '35%'
    plotoption.bar.colors.backgroundBarColors = ['transparent','transparent','transparent','transparent']

    // styling stroke
    const stroke = { ...optionConfig.value.stroke }
    stroke.width = 5
    
    // styling grid
    const grid = { ...optionConfig.value.grid }
    grid.xaxis.lines.show = false

    // config update
    const config = {
        chart: stacked,
        colors: ['#544fc5','#2caffe','#00e272'],
        series: newSeries,
        xaxis: xaxis,
        plotOptions: plotoption,
        stroke: stroke,
        grid: grid
    }
    
    // update data
    dataUpdate.value.updateOptions(config)
}
</script>

<template>
    <!-- <highcharts :options="option"/> -->
    <VueApexCharts
        ref="dataUpdate"
        type="bar"
        height="400"
        :options="optionConfig"
        :series="series"
        :state="updateChart()"
    />
</template>
