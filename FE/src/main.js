/* eslint-disable import/order */
import '@/@fake-db/db'
import '@/@iconify/icons-bundle'
import App from '@/App.vue'
import layoutsPlugin from '@/plugins/layouts'
import vuetify from '@/plugins/vuetify'
import { loadFonts } from '@/plugins/webfontloader'
import router from '@/router'
import '@core/scss/template/index.scss'
import '@styles/styles.scss'
import { createPinia } from 'pinia'
import { createApp } from 'vue'
import JsonExcel from "vue-json-excel3"
import 'mapbox-gl/dist/mapbox-gl.css'
// import HighChartsVue from 'highcharts-vue'

loadFonts()

// Create vue app
const app = createApp(App)

// Global variable
const title = 'Phibase'

// Provide the global variable
app.provide('title', title)

// Use plugins
app.use(vuetify)
app.use(createPinia())
app.use(router)
app.use(layoutsPlugin)
// app.use(HighChartsVue)

app.component("DownloadExcel", JsonExcel)

// Mount vue app
app.mount('#app')
