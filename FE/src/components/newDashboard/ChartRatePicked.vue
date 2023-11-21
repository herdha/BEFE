<script setup>
import { getDonutConfig } from '@core/libs/highchart/highchartConfig';
import { useTheme } from 'vuetify';
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

// let rateData = []


// const newDashStore = useNewDashStore()
// newDashStore.fetchRatePicked()

// const data = computed(()=>{
//     return newDashStore.getDataRatePicked
// })
// const series = computed(()=>{
//     return [data.value.total]
// })

// const vuetifyTheme = useTheme()
// const statisticsChartConfig = computed(() => getRadialBarChartConfig(vuetifyTheme.current.value, 'Rate'))

const newDashStore = useNewDashStore()
const vuetifyTheme = useTheme()

newDashStore.fetchRatePicked()
const data = computed(()=>{ return newDashStore.getDataRatePicked})
    
const option = ()=>{
    const config = getDonutConfig(vuetifyTheme.current.value)
    config.plotOptions.pie.startAngle = 0
    config.plotOptions.pie.endAngle = data
    config.legend = false
    config.series = [{
            name: 'Total',
            data: [data]
        }]
    return config
}
const confOption = ref(option())

</script>
<template>
    <highcharts :options="confOption"/>
    <!-- <VueApexCharts
        type="radialBar"
        height="300"
        :options="statisticsChartConfig"
        :series="series"
    /> -->
</template>