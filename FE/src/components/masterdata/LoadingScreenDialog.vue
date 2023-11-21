<script setup>
const props = defineProps({
  isDialogOpen: {
    type: Boolean,
    required: true,
  },
  loadingText: {
    type: String,
    default: "Loading...",
  },
})
</script>

<template>
  <!-- Dialog -->
  <VDialog
    temporary
    :model-value="props.isDialogOpen"
    width="300"
  >
    <VCard
      style="background-color: #212121; color: white;"
      width="300"
    >
      <VCardText class="pt-3">
        {{ loadingText }}
        <VProgressLinear
          indeterminate
          class="mb-0"
        />
      </VCardText>
    </VCard>
  </VDialog>
</template>

<!-- <template> -->
<!--  <div v-if="isLoading" class="loading-screen"> -->
<!--    <div class="loading-icon"></div> -->
<!--    <div class="loading-text">{{ loadingText }}</div> -->
<!--  </div> -->
<!-- </template> -->

<!-- <script> -->
<!-- export default { -->
<!--  props: { -->
<!--    isLoading: { -->
<!--      type: Boolean, -->
<!--      required: true -->
<!--    }, -->
<!--    loadingText: { -->
<!--      type: String, -->
<!--      default: "Loading..." -->
<!--    } -->
<!--  } -->
<!-- }; -->
<!-- </script> -->

<!-- <style> -->
<!-- .loading-screen { -->
<!--  position: fixed; -->
<!--  z-index: 9999; -->
<!--  top: 0; -->
<!--  left: 0; -->
<!--  height: 100vh; -->
<!--  width: 100vw; -->
<!--  background-color: rgba(255, 255, 255, 0.7); -->
<!--  display: flex; -->
<!--  justify-content: center; -->
<!--  align-items: center; -->
<!-- } -->

<!-- .loading-icon { -->
<!--  border: 5px solid #f3f3f3; -->
<!--  border-top: 5px solid #3498db; -->
<!--  border-radius: 50%; -->
<!--  width: 50px; -->
<!--  height: 50px; -->
<!--  animation: spin 1s linear infinite; -->
<!-- } -->

<!-- .loading-text { -->
<!--  margin-top: 20px; -->
<!--  font-size: 24px; -->
<!--  font-weight: bold; -->
<!--  color: #333; -->
<!--  text-align: center; -->
<!-- } -->

<!-- @keyframes spin { -->
<!--  0% { -->
<!--    transform: rotate(0deg); -->
<!--  } -->
<!--  100% { -->
<!--    transform: rotate(360deg); -->
<!--  } -->
<!-- } -->
<!-- </style> -->
