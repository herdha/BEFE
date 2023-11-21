<script setup>
import { pageTitle } from '@utils'

const page = 'New Dashboard'

document.title = pageTitle(page)
</script>

<template>
    <div>
        <CardDashboard></CardDashboard>
        <!-- <VRow>
            <VCol
                cols="12"
                md="3">
                <VCard elevation="0">
                    <VCardText class="pa-3 pb-0" style="background-color: #fa4b42;"></VCardText>
                    <VCardItem>
                        <VCardTitle>Partially Picked</VCardTitle>
                    </VCardItem>
                    <VCardText class="d-flex align-center">
                        <h1>1002</h1>
                        <v-avatar class="ms-auto" color="#fa4b42" size="x-large">
                            <v-icon icon="mdi-account-circle" color="#fff" size="x-large"></v-icon>
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
                        <h1>1002</h1>
                        <v-avatar class="ms-auto" color="#2caffe" size="x-large">
                            <v-icon icon="mdi-account-circle" color="#fff" size="x-large"></v-icon>
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
                        <h1>35%</h1>
                        <v-avatar class="ms-auto" color="#00e272" size="x-large">
                            <v-icon icon="mdi-account-circle" color="#fff" size="x-large"></v-icon>
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
                        <h1>10%</h1>
                        <v-avatar class="ms-auto" color="#544fc5" size="x-large">
                            <v-icon icon="mdi-account-circle" color="#fff" size="x-large"></v-icon>
                        </v-avatar>
                    </VCardText>
                </VCard>
            </VCol>
        </VRow> -->
        <!-- <VRow>
            <VCol
                cols="12"
                md="9">
                <VCard elevation="0">
                    <VCardItem>
                        <VCardTitle>Order Fulfilment</VCardTitle>
                    </VCardItem>
                    <VCardText>
                        <VRow>
                            <VCol cols="12" md="8">
                                <VCardSubtitle class="px-0">Have to be fulfilled</VCardSubtitle>
                                <VCardText class="pa-0">
                                    <ChartHaveTobeFulfilled/>
                                </VCardText>
                            </VCol>
                            <VCol cols="12" md="4">
                                <VCardSubtitle class="px-0">Rate Picked</VCardSubtitle>
                                <VCardText>
                                    <ChartRatePicked/>
                                </VCardText>
                            </VCol>
                        </VRow>
                    </VCardText>
                </VCard>
            </VCol>
            <VCol
                cols="12"
                md="3">
                <VCard elevation="0">
                    <VCardItem>
                        <VCardTitle>Not Good Material</VCardTitle>
                        <VCardSubtitle>Not Good rate</VCardSubtitle>
                    </VCardItem>
                    <VCardText>
                        asd
                    </VCardText>
                </VCard>
            </VCol>
        </VRow> -->
        <VRow>
            <VCol>
                <VCard elevation="0">
                    <VCardItem class="pb-4">
                        <VCardTitle>Driver</VCardTitle>
                        <!-- <VCardSubtitle>Available vs Not Available</VCardSubtitle> -->
                    </VCardItem>
                    <VCardText>
                        <ChartDriver/>
                    </VCardText>
                </VCard>
            </VCol>
            <VCol>
                <VCard elevation="0">
                    <VCardItem class="pb-4">
                        <VCardTitle>Vehicle</VCardTitle>
                        <!-- <VCardSubtitle>Available vs Not Available</VCardSubtitle> -->
                    </VCardItem>
                    <VCardText>
                        <ChartVehicle/>
                    </VCardText>
                </VCard>
            </VCol>
            <VCol>
                <VCard elevation="0">
                    <VCardItem class="pb-4">
                        <VCardTitle>Bound</VCardTitle>
                        <!-- <VCardSubtitle>Inbound vs Outbound</VCardSubtitle> -->
                    </VCardItem>
                    <VCardText>
                        <ChartInOutBound/>
                    </VCardText>
                </VCard>
            </VCol>
        </VRow>
        <VRow>
            <VCol>
                <VCard elevation="0">
                    <VCardItem class="pb-4">
                        <VCardTitle>Inbound</VCardTitle>
                        <!-- <VCardSubtitle>Receive vs Unpacking vs Putaway by Month</VCardSubtitle> -->
                    </VCardItem>
                    <VCardText>
                        <ChartInboundMonth />
                    </VCardText>
                </VCard>
            </VCol>
            <VCol>
                <VCard elevation="0">
                    <VCardItem class="pb-4">
                        <VCardTitle>Outbound</VCardTitle>
                        <!-- <VCardSubtitle>Picking vs Packing vs Delivery by Month</VCardSubtitle> -->
                    </VCardItem>
                    <VCardText>
                        <ChartOutboundMonth/>
                    </VCardText>
                </VCard>
            </VCol>
        </VRow>
        <VRow>
            <VCol>
                <VCard elevation="0">
                    <ChartInboundWeek/>
                </VCard>
            </VCol>
        </VRow>
        <VRow>
            <VCol>
                <VCard elevation="0">
                    <ChartOutboundWeek/>
                </VCard>
            </VCol>
        </VRow>
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
      subject: New Dashboard
      requiresAuth: true
</route>