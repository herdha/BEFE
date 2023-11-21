<script setup>
import { getBarConfig } from '@core/libs/highchart/highchartConfig';
import { useTheme } from 'vuetify';
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

const vuetifyTheme = useTheme() 
const newDashStore = useNewDashStore()

newDashStore.fetchOrderHavetobeFulfilled()

const data = computed(()=>{ return newDashStore.getorderfulfilmentnotpicked.series })
const categories = computed(()=>{ return newDashStore.getorderfulfilmentnotpicked.categories })

const setOption = ()=>{
    const config = getBarConfig(vuetifyTheme.current.value)
    config.plotOptions.bar.dataLabels = {enabled: true}
    config.series = data
    config.xAxis.categories = categories
    return config
}
const option = ref(setOption())

</script>
<template>
    <highcharts :options="option"/>
</template>