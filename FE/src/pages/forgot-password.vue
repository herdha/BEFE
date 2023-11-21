<script setup>
import { useGenerateImageVariant } from '@core/composable/useGenerateImageVariant'
import authV2ForgotPasswordIllustrationDark from '@images/pages/auth-v2-forgot-password-illustration-dark.png'
import authV2ForgotPasswordIllustrationLight from '@images/pages/auth-v2-forgot-password-illustration-light.png'
import authV2MaskDark from '@images/pages/misc-mask-dark.png'
import authV2MaskLight from '@images/pages/misc-mask-light.png'
import { pageTitle } from '@utils'
import {
  emailValidator,
  requiredValidator,
} from '@validators'

// 👉 - Page Title
const page = 'Forgot Password'

document.title = pageTitle(page)

// 👉 - Theme
const authThemeImg = useGenerateImageVariant(authV2ForgotPasswordIllustrationLight, authV2ForgotPasswordIllustrationDark)
const authThemeMask = useGenerateImageVariant(authV2MaskLight, authV2MaskDark)

// 👉 - Data
const refVForm = ref()
const email = ref('')
const disableResetBtn = ref(false)
const remainingTime = ref(0)
const successMessage = ref(false)

// 👉 - Method
const sendResetLink = () => {
  // TODO: CODE FORGOT PASSOWORD FUNCTION HERE
  successMessage.value = true

  disableButton()
}

const disableButton = () => {
  // Disable button for a certain period
  disableResetBtn.value = true // Disable the button

  const duration = 30000 // Duration in milliseconds

  remainingTime.value = Math.ceil(duration / 1000) // Convert milliseconds to seconds

  const countdownInterval = setInterval(() => {
    remainingTime.value-- // Decrease remaining time by 1 second

    if (remainingTime.value <= 0) {
      clearInterval(countdownInterval) // Stop the countdown
      disableResetBtn.value = false // Enable the button
    }
  }, 1000) // Update remaining time every second
}

const onSubmit = () => {
  refVForm.value?.validate().then(({ valid: isValid }) => {
    if (isValid && remainingTime.value <= 0)
      sendResetLink()
  })
}
</script>

<template>
  <VSnackbar
    v-model="successMessage"
    variant="flat"
    color="success"
  >
    Reset link has been sent to <strong>{{ email }}</strong>
  </VSnackbar>

  <VRow
    class="auth-wrapper bg-surface"
    no-gutters
  >
    <VCol
      lg="8"
      class="d-none d-lg-flex"
    >
      <div class="position-relative bg-background rounded-lg w-100 ma-8 me-0">
        <div class="d-flex align-center justify-center w-100 h-100">
          <VImg
            max-width="368"
            :src="authThemeImg"
            class="auth-illustration mt-16 mb-2"
          />
        </div>

        <VImg
          class="auth-footer-mask"
          :src="authThemeMask"
        />
      </div>
    </VCol>

    <VCol
      cols="12"
      lg="4"
      class="d-flex align-center justify-center"
    >
      <VCard
        flat
        :max-width="500"
        class="mt-12 mt-sm-0 pa-4"
      >
        <VCardText>
          <div class="d-flex justify-center mb-6">
            <img
              src="@images/logo/logo-full-dark.png"
              class="mw-70"
            >
          </div>
          <h5 class="text-h5 font-weight-semibold mb-1">
            Forgot Password? 🔒
          </h5>
          <p class="mb-0">
            Enter your email and we'll send you instructions to reset your password
          </p>
        </VCardText>

        <VCardText>
          <VForm
            ref="refVForm"
            @submit.prevent="onSubmit"
          >
            <VRow>
              <!-- email -->
              <VCol cols="12">
                <AppTextField
                  v-model="email"
                  autofocus
                  label="Email"
                  type="email"
                  :rules="[requiredValidator, emailValidator]"
                />
              </VCol>

              <!-- Reset link -->
              <VCol
                v-if="!disableResetBtn"
                cols="12"
              >
                <VBtn
                  block
                  type="submit"
                  :disabled="disableResetBtn"
                >
                  Send Reset Link
                </VBtn>
              </VCol>

              <!-- resend reset link & back to login -->
              <VCol cols="12">
                <p
                  v-if="disableResetBtn"
                  class="d-flex align-center justify-center"
                >
                  Resend Reset Link in&nbsp;<strong>{{ remainingTime }}s</strong>
                </p>
                <RouterLink
                  class="d-flex align-center justify-center"
                  :to="{ name: 'login' }"
                >
                  <VIcon
                    icon="tabler-chevron-left"
                    class="flip-in-rtl"
                  />
                  <span>Back to login</span>
                </RouterLink>
              </VCol>
            </VRow>
          </VForm>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>
</template>

<style lang="scss">
@use "@core/scss/template/pages/page-auth.scss";
</style>

<route lang="yaml">
meta:
  layout: blank
  redirectIfLoggedIn: true
</route>
