import axios from "@axios";
import { defineStore } from "pinia";

export const useTaskStore = defineStore('TaskStore', {
    state: ()=>{
        return {
            tasks: [],
        }
    },
    getters:{
        getDataTask() {
            return this.tasks
        },
    },
    actions:{
        fetchTasks() {
            return new Promise((resolve, reject) => {
                axios
                    .get('/allTask')
                    .then(res => {
                        this.tasks = res.data
                        resolve()
                    })
                    .catch(err => reject(err))
            })
        },
        
        postTask(payload){
            // console.log(payload)
            // console.log(`data task store ${JSON.stringify(payload)}`)
            return new Promise((resolve, reject) => {
                axios
                    .post('/addTask', payload)
                    .then((d)=>{
                        this.tasks.push(d.data)
                        // console.log(d.data)
                        resolve()
                    })
                    .catch((e)=>{
                        reject(e)
                    })
            })
        },

        editTask(data){
            return new Promise((resolve, reject)=>{
                axios
                .put(`/editTask/${data}`)
                .then((d)=>{
                    console.log(d)
                })
                .catch((err)=>{reject(err)})
            })
        },

        delTask(id){
            console.log(`id store ${JSON.stringify(id.id)}`)
            return new Promise((resolve, reject) => {
                axios
                    .delete(`/delTask/${id.id}`)
                    .then((d)=> {
                        // this.tasks = d.data
                        // console.log(d.data)
                        let i = this.tasks.findIndex(u => u._id === id.id)
                        this.tasks.splice(i, 1)
                        resolve()
                    })
                    .catch((err)=>{
                        console.log(err)
                        reject(err)
                    })
            })
        },

        getOneTask({id}){
            return new Promise((resolve, reject)=>{
                axios
                    .get(`/getOneTask/${id}`)
                    .then((d)=>{
                        // console.log('d')
                        // d.data.areaStart
                        // console.log(d.data.areaStart)
                        resolve(d.data)
                    })
                    .catch((e)=>{
                        reject(e)
                    })
            })
        },
        
        startTask({id}){
            return new Promise((resolve, reject)=>{
                axios
                    .put(`/startTask/${id}`)
                    .then((d)=>{
                        // console.log(d.data)
                        let i = this.tasks.findIndex(u => u._id === id)
                        this.tasks[i] = d.data
                        setTimeout(()=>{
                            window.location.reload()
                        }, 3000)
                        resolve()
                    })
                    .catch((e)=>{
                        reject(e)
                    })
            })
        }, 

        endTask({id}){
            return new Promise((resolve, reject)=>{
                axios
                    .put(`/endTask/${id}`)
                    .then((d)=>{
                        let i = this.tasks.findIndex(u => u._id === id)
                        this.tasks[i] = d.data.data
                        setTimeout(()=>{
                            window.location.reload()
                        }, 3000)
                        resolve(d)
                    })
                    .catch((e)=>{
                        reject(e)
                    })
            })
        }
    }
})