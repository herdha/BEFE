import axios from '@axios'
import { defineStore } from 'pinia'

export const useItemStore = defineStore('ItemStore', {
  state: () => {
    return {
      items: [],
    }
  },
  getters: {
    getItems() {
      return this.items
    },
  },
  actions: {
    fetchItems() {
      return new Promise((resolve, reject) => {
        axios
          .get('/items')
          .then(res => {
            this.items = res.data
            resolve()
          })
          .catch(err => reject(err))
      })
    },
    addItem(payload) {
      return new Promise((resolve, reject) => {
        axios
          .post('/items', payload)
          .then(res => {
            let item = this.items.find(u => u.id === payload.id)
            if (item) {
              item = { ...res.data }
            } else {
              this.items.unshift(res.data)
            }
            resolve()
          })
          .catch(err => reject(err))
      })
    },
    updateItem(payload) {
      return new Promise((resolve, reject) => {
        axios
          .put('/items', payload)
          .then(res => {
            const index = this.items.findIndex(u => u.id === payload.id)

            this.items[index] = { ...res.data }
            resolve()
          })
          .catch(err => reject(err))
      })
    },
    deleteItem({ id }) {
      return new Promise((resolve, reject) => {
        axios
          .delete('/items')
          .then(() => {
            let i = this.items.findIndex(u => u.id === id)
            this.items.splice(i, 1)
            resolve()
          })
          .catch(err => reject(err))
      })
    },
  },
})
