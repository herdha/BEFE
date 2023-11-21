<script setup>
import { pageTitle } from "@utils"

const page = 'Dashboard Explore'
document.title = pageTitle(page)
let date = new Date()

let dateProps = ref(date.toLocaleDateString())
let isArea = ref(false)
let isLine = ref(false)
let isBar = ref(false)
let isPie = ref(false)
let isDash = ref(false)

const showArea = () => {
    isArea.value ? isArea.value = false : isArea.value = true
}
</script>

<template>
    <div>
        <div class="d-flex">
            <VBtn
                class="mb-3 mr-3"
                variant="flat"
                @click="showArea()"
            >
                Chart Area
            </VBtn>
            <VBtn
                class="mb-3 mr-3"
                variant="flat"
            >
                Chart Pie
            </VBtn>
            <VBtn
                class="mb-3 mr-3"
                variant="flat"
            >
                Chart line
            </VBtn>
            <VBtn
                class="mb-3 mr-3"
                variant="flat"
            >
                Chart Bar
            </VBtn>
        </div>

        <VRow id="apex-chart-wrapper" v-if="!isArea">
        <!-- 👉  Area chart -->
            <VCol
                cols="12"
                md="6"
            >
                <VCard elevation="0">
                    <VCardItem>
                        <VCardTitle>Area Chart</VCardTitle>
                        <VCardSubtitle>Commercial networks</VCardSubtitle>
                        <template #append>
                            <div class="date-picker-wrapper">
                            <AppDateTimePicker
                                v-model="dateProps"
                                :model-value="date"
                                prepend-inner-icon="tabler-calendar"
                                :config="{ position: 'auto right' }"
                            />
                            </div>
                        </template>
                    </VCardItem>
                    <VCardText>
                        <areaChart :dateOn="dateProps"/>
                    </VCardText>
                </VCard>
            </VCol>
    
            <VCol
                cols="12"
                md="6"
            >
                <VCard elevation="0">
                    <VCardItem>
                        <VCardTitle>Expense Ratio</VCardTitle>
                        <VCardSubtitle>Spending on various categories</VCardSubtitle>
                        
                        <template #append>
                            <div class="date-picker-wrapper">
                            <AppDateTimePicker
                                :model-value="date"
                                prepend-inner-icon="tabler-calendar"
                                :config="{ position: 'auto right' }"
                            />
                            </div>
                        </template>
                    </VCardItem>
                    <VCardText>
                        <doughnutChart/>
                    </VCardText>
                </VCard>
            </VCol>
        </VRow>
        
        <areaChartVariant
            v-if="isArea"
        />
        
    </div>
</template>

<style lang="scss">
@use "@core/scss/template/libs/apex-chart.scss";

.date-picker-wrapper {
  inline-size: 10.5rem;
}

#apex-chart-wrapper {
  .v-card-item__append {
    padding-inline-start: 0;
  }
}
</style>
<route lang="yaml">
meta:
  subject: Dashboard Explore
  requiresAuth: true
</route>
