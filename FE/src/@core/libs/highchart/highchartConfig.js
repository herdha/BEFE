import { hexToRgb } from '@layouts/utils'

const colorVariables = (themeColors) => {
    const textPrimary = `rgba(${hexToRgb(themeColors.colors['on-surface'])},${themeColors.variables['high-emphasis-opacity']})`
    const textSecondary = `rgba(${hexToRgb(themeColors.colors['on-surface'])},${themeColors.variables['medium-emphasis-opacity']})`
    const textDisabled = `rgba(${hexToRgb(themeColors.colors['on-surface'])},${themeColors.variables['disabled-opacity']})`
    const borderColor = `rgba(${hexToRgb(String(themeColors.variables['border-color']))},${themeColors.variables['border-opacity']})`
    
    return { textPrimary, textSecondary, textDisabled, borderColor }
}

export const getDonutConfig = (themeColors) => {
    const colors = {

    }

    const { textPrimary, textSecondary, textDisabled, borderColor } = colorVariables(themeColors)

    return {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null, 
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: ''
        },
        plotOptions: {
            series:{
                type: 'pie',
                size: '100%',
                innerSize: '60%',
            },
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: [{
                    enabled: false,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                },
                {
                    enabled: true,
                    distance: -30,
                    format: '{point.percentage:.1f}%',
                    style: {
                        fontSize: '.75rem',
                        textOutline: 'none',
                        color: '#fff'
                    }
                }],
                showInLegend: true,
                colors: ['#544fc5', '#2caffe']
            }
        },
        series: [{
            name: 'Total',
            colorByPoint: true,
            // data: [
            //     {
            //         name: 'apple',
            //         y: 10
            //     },
            //     {
            //         name: 'grape',
            //         y: 20
            //     }
            // ]
        }],
        credits: {
            enabled: false
        },
    }
}

export const getColumnConfig = (themeColors) => {
    const colors = {

    }

    const { textPrimary, textSecondary, textDisabled, borderColor } = colorVariables(themeColors)
    return {
        chart: {
            type: 'column'
        },
        title: {
            text: '',
        },
        legend: false,
        xAxis: {
            categories: ['USA', 'China', 'Brazil', 'EU', 'India', 'Russia'],
            crosshair: false,
        },
        yAxis: {
            title: false
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [
            {
                name: 'Corn',
                data: [406292, 260000, 107000, 68300, 27500, 14500]
            },
            {
                name: 'Wheat',
                data: [51086, 136000, 5500, 141000, 107180, 77000]
            }
        ],
        credits: {
            enabled: false
        },
    }
}

export const getBarConfig = (themeColors) => {
    const colors = {

    }

    const { textPrimary, textSecondary, textDisabled, borderColor } = colorVariables(themeColors)
    return {
        chart: {
            type: 'bar'
        },
        title: {
            text: '',
        },
        xAxis: {
            categories: ['Africa', 'America'],
            title: {
                text: null
            },
            gridLineWidth: 0,
            lineWidth: 0
        },
        yAxis: {
            min: 0,
            title: false,
            labels: {
                overflow: 'justify'
            },
            gridLineWidth: 1
        },
        plotOptions: {
            bar: {
                borderRadius: '10%',
                groupPadding: 0,
                pointPadding: 0
            },
            series: {
                pointWidth: 20,
                groupPadding: 0,
                pointPadding: 0
            },
        },
        legend: true,
        credits: {
            enabled: false
        },
        series: [
            {
                name: 'Total',
                data: [631, 727]
            }
        ]
    }
}

export const getAreaSplineConfig = (themeColors)=>{
    const colors = {

    }

    const { textPrimary, textSecondary, textDisabled, borderColor } = colorVariables(themeColors)

    return {
        chart: {
            type: 'areaspline'
        },
        title: false,
        yAxis: {
            title: false
        },
        xAxis: {
            categories: ['a','b','c','d','e','f','g','h']
        },
        legend: false,
        plotOptions: {
            areaspline: {
                threshold: null,
                marker: {
                    lineWidth: 1,
                    lineColor: null,
                    fillColor: 'white'
                }
            }
        },
        series: [{
            name: 'USA',
            data: [2, 9, 13, 50, 170, 299, 438, 841]
        }, {
            name: 'USSR/Russia',
            data: [1, 5, 25, 50, 120, 150, 200, 426]
        }],
        credits: {
            enabled: false
        },
    }
}

export const getSplineConfig = (themeColors)=>{
    const colors = {

    }

    const { textPrimary, textSecondary, textDisabled, borderColor } = colorVariables(themeColors)
    
    return {
        chart: {
            type: 'spline'
        },
        title: false,
        yAxis: {
            title: false
        },
        xAxis: {
            categories: ['a','b','c','d','e','f','g','h']
        },
        legend: false,
        plotOptions: {
            spline: {
                threshold: null,
                marker: {
                    lineWidth: 1,
                    lineColor: null,
                    fillColor: 'white'
                }
            }
        },
        series: [{
            name: 'USA',
            data: [2, 9, 13, 50, 170, 299, 438, 841]
        }, {
            name: 'USSR/Russia',
            data: [1, 5, 25, 50, 120, 150, 200, 426]
        }],
        credits: {
            enabled: false
        },
    }
}