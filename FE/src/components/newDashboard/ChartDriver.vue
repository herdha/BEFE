<script setup>
import { getDonutChartConfig } from '@core/libs/apex-chart/apexChartConfig';
import VueApexCharts from 'vue3-apexcharts';
import { getDonutConfig } from '@core/libs/highchart/highchartConfig';
import { useTheme } from 'vuetify';
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

// access store
const newDashStore = useNewDashStore()
// access vuetify
const vuetifyTheme = useTheme()

// fetch data
newDashStore.fetchDataDriver()

// highchart
const data = computed(()=>{ return newDashStore.getDataDriver})
const option = ()=>{
    const config = getDonutConfig(vuetifyTheme.current.value)
    config.series[0].data = data
    return config
}
const confOption = ref(option())

// apex
// const series = computed(()=>{ return newDashStore.getDataDriverApex.total}) /** access getter data series */
// const setConf = computed(() => {
//     const config = getDonutChartConfig(vuetifyTheme.current.value)
//     config.labels = newDashStore.getDataDriverApex.title /** access getter data label */
//     config.colors = ['#544fc5','#2caffe']
//     delete config.plotOptions.pie.donut.labels.total.label
//     delete config.plotOptions.pie.donut.labels.total.formatter
//     return config
// })

// define variable
let dataUpdate = ref()
let series = ref([])
let optionConfig = ref(getDonutChartConfig(vuetifyTheme.current.value))

// function to update chart
const updateChart = async()=>{
    // get data to update
    series.value = await newDashStore.getDataDriverApex.total
    optionConfig.value.labels = await newDashStore.getDataDriverApex.title
    
    // styling plotoption
    const plotOptions = { ...optionConfig.value.plotOptions }
    plotOptions.pie.donut.labels.total.label = 'Total'
    plotOptions.pie.donut.labels.total.formatter = ()=>{ return series.value.reduce((acc,el)=>{return acc+el},0)}

    // config update
    const config = {
        series: series.value,
        labels: optionConfig.value.labels,
        colors: ['#544fc5', '#2caffe'],
        plotOptions: plotOptions
    }

    // update data
    dataUpdate.value.updateOptions(config)
}


</script>

<template>
    <!-- <highcharts :options="confOption"/> -->
    <VueApexCharts
        ref="dataUpdate"
        type="donut"
        height="410"
        :options="optionConfig"
        :series="series"
        :state="updateChart()"
    />
</template>