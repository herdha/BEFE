import axios from '@axios';
import { defineStore } from 'pinia';

export const useUserStore = defineStore('UserStore', {
    state: ()=>{
        return {
            users: []
        }
    },
    getters: {
        getUsers(){
            return this.users
        }
    },
    actions: {
        fetchUsers() {
            return new Promise((resolve, reject) => {
              axios
                .get('/getUser')
                .then(res => {
                    const obj = res.data.filter((el) => { return el.role == "User Biasa"})
                    this.users = obj
                    // obj.forEach(el => {
                    //     if(el.role=="User Biasa"){
                    //         this.users.push({uid: el._id, name: el.username})
                    //     }
                    // });                        
                    resolve()
                })
                .catch(err => reject(err))
            })
        }
    }
})