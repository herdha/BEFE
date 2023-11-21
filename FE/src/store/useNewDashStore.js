import axios from "@axios";
import { defineStore } from "pinia";

export const useNewDashStore = defineStore('NewDashStore', {
    state: ()=> {
        return {
            dataDriver: [],
            dataVehicle: [],
            dataInOutBound: [],
            
            dataInboundMonth: {},
            dataOutboundMonth: {},

            dataInboundWeekReceive: {},
            dataInboundWeekUnpacking: {},
            dataInboundWeekPutaway: {},

            dataOutboundWeekPicking: {},
            dataOutboundWeekPacking: {},
            dataOutboundWeekDelivery: {},

            orderfulfilmentnotpicked: {},
            dataNotPicked: [],
            ratePicked: null,
            dataNotGoodRate: null,

            // apex
            dataDriverApex: {},
            dataVehicleApex: {},
            dataInOutBoundApex: {}
        }
    },
    getters: {
        getDataDriver(){
            return this.dataDriver
        },
        getDataVehicle(){
            return this.dataVehicle
        },
        getDataInOutBound(){
            return this.dataInOutBound
        },

        // data in and out bound by month
        getDataInboundMonth(){
            return this.dataInboundMonth
        },
        getDataOutboundMonth(){
            return this.dataOutboundMonth
        },
        
        // data inbound by week
        getDataInboundWeekReceive(){
            return this.dataInboundWeekReceive
        },
        getDataInboundWeekUnpacking(){
            return this.dataInboundWeekUnpacking
        },
        getDataInboundWeekPutaway(){
            return this.dataInboundWeekPutaway
        },
        
        // data outbound by week
        getDataOutboundWeekPicking(){
            return this.dataOutboundWeekPicking
        },
        getDataOutboundWeekPacking(){
            return this.dataOutboundWeekPacking
        },
        getDataOutboundWeekDelivery(){
            return this.dataOutboundWeekDelivery
        },

        getorderfulfilmentnotpicked(){
            return this.orderfulfilmentnotpicked
        },
        getDataRatePicked(){
            return this.ratePicked
        },
        getDataNotPicked(){
            return this.dataNotPicked
        },
        getDataNotGood(){
            return this.dataNotGoodRate
        },

        // apex
        getDataDriverApex(){
            return this.dataDriverApex
        },
        getDataVehicleApex(){
            return this.dataVehicleApex
        },
        getDataInOutBoundApex(){
            return this.dataInOutBoundApex
        }
    },
    actions: {
        fetchDataDriver(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/driver')
                    .then((d)=>{
                        // highchart
                        const data = d.data.map((el)=>{
                            return {
                                name: el.title,
                                y: el.total
                            }
                        })
                        this.dataDriver = data

                        // apex
                        const total = d.data.map((el)=>{
                            return el.total
                        })
                        const title = d.data.map((el)=>{
                            return el.title
                        })
                        this.dataDriverApex = {total,title}
                        resolve()
                    })
                    .catch((e)=>{reject(e)})
            })
        },
        fetchDataVehicle(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/vehicle')
                    .then((d)=>{
                        // highchart
                        const data = d.data.map((el)=>{
                            return {
                                name: el.title,
                                y: el.total
                            }
                        })
                        this.dataVehicle = data
                        
                        // apex
                        const total = d.data.map((el)=>{
                            return el.total
                        })
                        const title = d.data.map((el)=>{
                            return el.title
                        })
                        this.dataVehicleApex = {total,title}
                        // console.log('vehicle store',this.dataVehicle)
                        resolve()
                    })
                    .catch((e)=>{reject(e)})

            })
        },
        fetchInOutBound(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/inoutbound')
                    .then((d)=>{
                        // highchart
                        const data = d.data.map((el)=>{
                            return {
                                name: el.title,
                                y: el.total
                            }
                        })
                        this.dataInOutBound = data

                        // apex
                        const total = d.data.map((el)=>{
                            return el.total
                        })
                        const title = d.data.map((el)=>{
                            return el.title
                        })
                        this.dataInOutBoundApex = {total,title}
                        // console.log('inoutbound store',this.dataInOutBoundApex)
                        resolve()
                    })
                    .catch((e)=>{reject(e)})

            })
        },
        fetchInboundMonth(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/inboundMonth')
                    .then((d)=>{
                        const receiveTotal = d.data.receive.map((el)=>{
                            return el.total
                        })
                        const unpackingTotal = d.data.unpacking.map((el)=>{
                            return el.total
                        })
                        const putawayTotal = d.data.putaway.map((el)=>{
                            return el.total
                        })
                        const categories = d.data.receive.map((el)=>{
                            // const month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Des"]
                            return el.month
                        })

                        const series = [
                            {
                                name: 'Receive',
                                data: receiveTotal
                            }, 
                            {
                                name: 'Unpacking',
                                data: unpackingTotal
                            },
                            {
                                name: 'Put Away',
                                data: putawayTotal
                            }
                        ]

                        this.dataInboundMonth = {categories, series}
                        // console.log('data ind month', this.dataInboundMonth)
                        // this.dataChart.inboundMonth = {receiveTotal, unpackingTotal, putawayTotal}
                        resolve()
                    })
                    .catch((e)=>{reject(e)})

            })
        },
        fetchOutboundMonth(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/outboundMonth')
                    .then((d)=>{
                        const pickingTotal = d.data.picking.map((el)=>{
                            return el.total
                        })
                        const packingTotal = d.data.packing.map((el)=>{
                            return el.total
                        })
                        const deliveryTotal = d.data.delivery.map((el)=>{
                            return el.total
                        })
                        
                        const categories = d.data.picking.map((el)=>{
                            // const month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Des"]
                            return el.month
                        })
                        const series = [
                            {
                                name: 'Picking',
                                data: pickingTotal
                            }, 
                            {
                                name: 'Packing',
                                data: packingTotal
                            },
                            {
                                name: 'Delivery',
                                data: deliveryTotal
                            }
                        ]
                        this.dataOutboundMonth = {categories, series}
                        // console.log('data out month', this.dataOutboundMonth)
                        // this.dataChart.outboundMonth = {pickingTotal, packingTotal, deliveryTotal}
                        resolve()
                    })
                    .catch((e)=>{reject(e)})

            })
        },
        fetchInboundWeek(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/inboundWeek')
                    .then((d)=>{
                        const totalReceive = d.data.receive.map((el)=>{
                            return el.total
                        })
                        const categoryReceive = d.data.receive.map((el)=>{
                            return el.weekOfmonth
                        })

                        const totalUnpacking = d.data.unpacking.map((el)=>{
                            return el.total
                        })
                        const categoryUnpacking = d.data.unpacking.map((el)=>{
                            return el.weekOfmonth
                        })

                        const totalPutaway = d.data.putaway.map((el)=>{
                            return el.total
                        })
                        const categoryPutaway = d.data.putaway.map((el)=>{
                            return el.weekOfmonth
                        })

                        const series = [
                            {
                                name: 'Total',
                                data: totalReceive
                            }
                        ]

                        const seriesUnpacking = [
                            {
                                name: 'Total',
                                data: totalUnpacking
                            }
                        ]

                        const seriesPutaway = [
                            {
                                name: 'Total',
                                data: totalPutaway
                            }
                        ]                        
                        this.dataInboundWeekReceive = {series, categoryReceive}
                        this.dataInboundWeekUnpacking = {seriesUnpacking, categoryUnpacking}
                        this.dataInboundWeekPutaway = {seriesPutaway, categoryPutaway}
                        resolve()
                    })
                    .catch((e)=>{reject(e)})
            })
        },
        fetchOutboundWeek(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/outboundWeek')
                    .then((d)=>{
                        const totalPicking = d.data.picking.map((el)=>{
                            return el.total
                        })
                        const categoryPicking = d.data.picking.map((el)=>{
                            return el.weekOfmonth
                        })

                        const totalPacking = d.data.packing.map((el)=>{
                            return el.total
                        })
                        const categoryPacking = d.data.packing.map((el)=>{
                            return el.weekOfmonth
                        })

                        const totalDelivery = d.data.delivery.map((el)=>{
                            return el.total
                        })
                        const categoryDelivery = d.data.delivery.map((el)=>{
                            return el.weekOfmonth
                        })                        

                        const seriesPicking = [
                            {
                                name: 'Total',
                                data: totalPicking
                            }
                        ]

                        const seriesPacking = [
                            {
                                name: 'Total',
                                data: totalPacking
                            }
                        ]

                        const seriesDelivery = [
                            {
                                name: 'Total',
                                data: totalDelivery
                            }
                        ]                        
                        this.dataOutboundWeekPicking = {seriesPicking, categoryPicking}
                        this.dataOutboundWeekPacking = {seriesPacking, categoryPacking}
                        this.dataOutboundWeekDelivery = {seriesDelivery, categoryDelivery}

                        resolve()
                    })
            })
        },
        fetchOrderHavetobeFulfilled(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/orderfulfilment')
                    .then((d)=>{                        
                        const total = d.data.map((el)=>{
                            return el.total
                        })

                        this.dataNotPicked = total
                        // this.dataChart.orderFulfilment = {total, label}
                        // console.log('res store',total)
                        resolve()
                    })
                    .catch((e)=>{reject(e)})
            })
        },
        fetchRatePicked(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/orderfillrate')
                    .then((d)=>{
                        // const data = [{
                        //     name: 'Total',
                        //     data: [d.data.ratePicked]
                        // }]
                        this.ratePicked = d.data.ratePicked
                        // console.log('ratep',this.ratePicked)
                        resolve()
                    })
                    .catch((e)=>{reject(e)})
            })
        },
        fetchNotGood(){
            return new Promise((resolve, reject)=>{
                axios
                    .get('/notgoodrate')
                    .then((d)=>{
                        // const total = d.data.reduce((acc, el)=>{
                        //     return acc + el.total
                        // },0)
                        // const rate = Math.floor((d.data[0].total / total) * 100)
                        // this.dataNotGoodRate = rate
                        
                        // apex
                        this.dataNotGoodRate = d.data.rateNG
                        // console.log('rateng',d)
                        resolve()
                    })
                    .catch((e)=>{reject(e)})
            })
        }
    }
})