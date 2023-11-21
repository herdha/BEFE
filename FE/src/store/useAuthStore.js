import axios from '@axios'
// import { resolve } from 'eslint-import-resolver-alias'
import { defineStore } from 'pinia'

export const useAuthStore = defineStore('AuthStore', {
  state: () => {
    return {
      token: '',
      activeUser: {},
    }
  },
  getters: {
    getToken() {
      return this.token
    },
    getActiveUser() {
      return this.activeUser
    },
  },
  actions: {
    login(payload) {
      return new Promise((resolve, reject) => {
        axios
          .post('/login', payload)
          .then(res => {
            const { token, roleRef } = res.data

            localStorage.setItem('permission', JSON.stringify(roleRef.permission))
            localStorage.setItem('accessToken', JSON.stringify(token))
            this.token = token
            window.location.reload()
            resolve()
          })
          .catch(err => reject(err))
      })
    },
    currentUser() {
      return new Promise((resolve, reject) => {
        const token = JSON.parse(localStorage.getItem('accessToken'))
        axios
          .get(`/currentActive/${token}`)
          .then(res => {
            this.activeUser = { ...res.data }
            resolve()
          })
          .catch(err => reject(err))
      })
    },
    logout(){
      return new Promise((resolve, reject) => {
        const token = JSON.parse(localStorage.getItem('accessToken'))
        console.log(token)
        axios.get(`/logout/${token}`)
        .then(()=>{
          resolve()
        })
        .catch(err => reject(err))
      })
    }
  },
})
