<script setup>
import { getAreaChartSplineConfig } from '@core/libs/apex-chart/apexChartConfig';
import VueApexCharts from 'vue3-apexcharts';
import { useTheme } from 'vuetify';

const vuetifyTheme = useTheme()
// const chartConfig = computed(() => getAreaChartSplineConfig(vuetifyTheme.current.value))
const areaColors = {
    series3: '#E72121',
    series2: '#FF7070',
    series1: '#FFD6D6',
}
const config2 = {
    
}
const series = {
    series1: [{
        name: 'Visits',
        data: [
            100,
            120,
            90,
            170,
            130,
            160,
            140,
            240,
            220,
            180,
            270,
            280,
            375,
        ],
    }],
    series2: [
        {
            name: 'Visits',
            data: [
                100,
                120,
                90,
                170,
                130,
                160,
                140,
                240,
                220,
                180,
                270,
                280,
                375,
            ],
        },
        {
            name: 'Clicks',
            data: [
                60,
                80,
                70,
                110,
                80,
                100,
                90,
                180,
                160,
                140,
                200,
                220,
                275,
            ],
        },
        {
            name: 'Sales',
            data: [
                20,
                40,
                30,
                70,
                40,
                60,
                50,
                140,
                120,
                100,
                140,
                180,
                220,
            ],
        },
    ]
}
const configChrt = () => {
    return {
        config: {
            chart: {
                parentHeightOffset: 0,
                toolbar: { show: false },
            },
            tooltip: { shared: false },
            dataLabels: { enabled: false },
            stroke: {
                show: true,
                curve: 'smooth',
            },
            legend: {
                position: 'bottom',
                horizontalAlign: 'left',
                fontSize: '13px',
                labels: { colors: '#555' },
                markers: {
                    offsetY: 1,
                    offsetX: -3,
                },
                itemMargin: {
                    vertical: 3,
                    horizontal: 10,
                },
            },
            colors: [areaColors.series3, areaColors.series2, areaColors.series1],
            fill: {
                // opacity: 1,
                type: 'gradient',
                gradient:{
                    opacityFrom: 0.8,
                    opacityTo: 0.1
                }
            },
            grid: {
                show: true,
                borderColor: '#eee',
                xaxis: {
                    lines: { show: true },
                },
            },
            yaxis: {
                labels: {
                    style: { colors: '#bbb', fontSize: '0.8125rem' },
                },
            },
            xaxis: {
                axisBorder: { show: false },
                axisTicks: { color: '#eee' },
                crosshairs: {
                    stroke: { color: '#eee' },
                },
                labels: {
                    style: { colors: '#b5b5b5', fontSize: '0.8125rem' },
                },
                categories: [
                    '7/12',
                    '8/12',
                    '9/12',
                    '10/12',
                    '11/12',
                    '12/12',
                    '13/12',
                    '14/12',
                    '15/12',
                    '16/12',
                    '17/12',
                    '18/12',
                    '19/12',
                ],
            }
        }
    }
}

</script>
<template>
    <VRow>
        <VCol
            cols="12"
            md="6"
        >
            <VCard>
                <VCardItem>
                    <VCardTitle>Basic</VCardTitle>
                </VCardItem>
                <VCardText class="px-2">
                    <VueApexCharts
                        type="area"
                        height="200"
                        :options="configChrt().config"
                        :series="series.series1"
                    />
                </VCardText>
            </VCard>
        </VCol>
        <VCol
            cols="12"
            md="6"
        >
            <VCard>
                <VCardItem>
                    <VCardTitle>Basic</VCardTitle>
                </VCardItem>
                <VCardText>
                    <VueApexCharts
                        type="area"
                        height="200"
                        :options="configChrt().config"
                        :series="series.series2"
                    />
                </VCardText>
            </VCard>
        </VCol>
    </VRow>
</template>