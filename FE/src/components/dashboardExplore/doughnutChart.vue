<script setup>
import { getDonutChartConfig } from '@core/libs/apex-chart/apexChartConfig';
import VueApexCharts from 'vue3-apexcharts';
import { useTheme } from 'vuetify';

const vuetifyTheme = useTheme()
const expenseRationChartConfig = computed(() => getDonutChartConfig(vuetifyTheme.current.value))

const series = [
    85,
    16,
    50,
    50,
]
</script>

<template>
    <VueApexCharts
        type="donut"
        height="330"
        :options="expenseRationChartConfig"
        :series="series"
    />
</template>