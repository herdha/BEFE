<script setup>
import { useNewDashStore } from '@store/useNewDashStore'
import { ref } from 'vue';

const newDashStore = useNewDashStore()

newDashStore.fetchOrderHavetobeFulfilled()
const data = computed(()=>{ return newDashStore.getDataNotPicked })

newDashStore.fetchRatePicked()
const dataRatePick = computed(()=>{ return newDashStore.getDataRatePicked})

newDashStore.fetchNotGood()
const dataNotGood = computed(()=>{ return newDashStore.getDataNotGood})

</script>

<template>
    <VRow>
        <VCol
            cols="12"
            md="3">
            <VCard elevation="0">
                <VCardText class="pa-3 pb-0" style="background-color: #fa4b42;"></VCardText>
                <VCardItem>
                    <VCardTitle>Partially Picked</VCardTitle>
                </VCardItem>
                <VCardText class="d-flex align-center">
                    <h1>{{ data[1] }}</h1>
                    <v-avatar class="ms-auto" color="#fa4b42" size="x-large">
                        <v-icon icon="fluent:box-20-filled" color="#fff" size="x-large"></v-icon>
                    </v-avatar>
                </VCardText>
            </VCard>
        </VCol>
        <VCol
            cols="12"
            md="3">
            <VCard elevation="0">
                <VCardText class="pa-3 pb-0" style="background-color: #2caffe;"></VCardText>
                <VCardItem>
                    <VCardTitle>Pending</VCardTitle>
                </VCardItem>
                <VCardText class="d-flex align-center">
                    <h1>{{ data[0] }}</h1>
                    <v-avatar class="ms-auto" color="#2caffe" size="x-large">
                        <v-icon icon="clarity:clock-solid" color="#fff" size="x-large"></v-icon>
                    </v-avatar>
                </VCardText>
            </VCard>
        </VCol>
        <VCol
            cols="12"
            md="3"> 
            <VCard elevation="0">
                <VCardText class="pa-3 pb-0" style="background-color: #00e272;"></VCardText>
                <VCardItem>
                    <VCardTitle>Picked Rate</VCardTitle>
                </VCardItem>
                <VCardText class="d-flex align-center">
                    <h1>{{ `${dataRatePick}%` }}</h1>
                    <v-avatar class="ms-auto" color="#00e272" size="x-large">
                        <v-icon icon="ri:truck-fill" color="#fff" size="x-large"></v-icon>
                    </v-avatar>
                </VCardText>
            </VCard>
        </VCol>
        <VCol
            cols="12"
            md="3">
            <VCard elevation="0">
                <VCardText class="pa-3 pb-0" style="background-color: #544fc5;"></VCardText>
                <VCardItem>
                    <VCardTitle>Not Good Material Rate</VCardTitle>
                </VCardItem>
                <VCardText class="d-flex align-center">
                    <h1>{{ `${dataNotGood}%` }}</h1>
                    <v-avatar class="ms-auto" color="#544fc5" size="x-large">
                        <v-icon icon="game-icons:swap-bag" color="#fff" size="x-large"></v-icon>
                    </v-avatar>
                </VCardText>
            </VCard>
        </VCol>
    </VRow>
</template>