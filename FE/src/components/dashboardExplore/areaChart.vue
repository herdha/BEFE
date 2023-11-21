<script setup>
import { getAreaChartSplineConfig } from '@core/libs/apex-chart/apexChartConfig';
import { toRaw } from 'vue';
import VueApexCharts from 'vue3-apexcharts';
import { useTheme } from 'vuetify';

const props = defineProps({
    dateOn: {
        type: String,
        required: false
    }
})

let dt = ref()
let mydata = []

const vuetifyTheme = useTheme()
const chartConfig = computed(() => getAreaChartSplineConfig(vuetifyTheme.current.value))

const dataChart = [
{
        date: '2023-10-05',
        seriesw: [
            {
                name: 'Visits',
                data: [
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                ],
            },
            {
                name: 'Clicks',
                data: [
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                ],
            },
            {
                name: 'Sales',
                data: [
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                ],
            },
        ]
    },
    {
        date: '2023-10-06',
        seriesw: [
            {
                name: 'Visits',
                data: [
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                ],
            },
            {
                name: 'Clicks',
                data: [
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                ],
            },
            {
                name: 'Sales',
                data: [
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                ],
            },
        ]
    },
    {
        date: '2023-10-07',
        seriesw: [
        {
                name: 'Visits',
                data: [
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                ],
            },
            {
                name: 'Clicks',
                data: [
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                ],
            },
            {
                name: 'Sales',
                data: [
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                ],
            },
        ]
    },
    {
        date: '2023-10-08',
        seriesw: [
        {
                name: 'Visits',
                data: [
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                    getRandomArbitrary(200, 300),
                ],
            },
            {
                name: 'Clicks',
                data: [
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                    getRandomArbitrary(100, 200),
                ],
            },
            {
                name: 'Sales',
                data: [
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                    getRandomArbitrary(10, 100),
                ],
            },
        ]
    }
]

watchEffect(() => {
    // console.log(props.dateOn)
    dt = ref(structuredClone(toRaw(props.dateOn)))
    let rt = props.dateOn
    console.log(rt)
    console.log(dataChart)

    let gh = dataChart.find((el)=>el.date === rt)
    console.log(gh ? gh.seriesw : {})
    mydata = gh ? gh.seriesw : []
});

function getRandomArbitrary(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
}

// const series = [
//     {
//         name: 'Visits',
//         data: [
//             100,
//             120,
//             90,
//             170,
//             130,
//             160,
//             140,
//             240,
//             220,
//             180,
//             270,
//             280,
//             375,
//         ],
//     },
//     {
//         name: 'Clicks',
//         data: [
//             60,
//             80,
//             70,
//             110,
//             80,
//             100,
//             90,
//             180,
//             160,
//             140,
//             200,
//             220,
//             275,
//         ],
//     },
//     {
//         name: 'Sales',
//         data: [
//             20,
//             40,
//             30,
//             70,
//             40,
//             60,
//             50,
//             140,
//             120,
//             100,
//             140,
//             180,
//             220,
//         ],
//     },
// ]
</script>

<template>
    <div>
        <VueApexCharts
            type="area"
            height="300"
            :options="chartConfig"
            :series="mydata"
        />
    </div>
</template>
