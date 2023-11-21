<script setup>
import { useGenerateImageVariant } from '@core/composable/useGenerateImageVariant'
import authV2LoginIllustrationBorderedDark from '@images/pages/auth-v2-login-illustration-bordered-dark.png'
import authV2LoginIllustrationBorderedLight from '@images/pages/auth-v2-login-illustration-bordered-light.png'
import authV2LoginIllustrationDark from '@images/pages/auth-v2-login-illustration-dark.png'
import authV2LoginIllustrationLight from '@images/pages/auth-v2-login-illustration-light.png'
import authV2MaskDark from '@images/pages/misc-mask-dark.png'
import authV2MaskLight from '@images/pages/misc-mask-light.png'
import { useAuthStore } from '@store/useAuthStore'
import { themeConfig } from '@themeConfig'
import { pageTitle } from '@utils'
import {
  emailValidator,
  requiredValidator,
} from '@validators'
import { VForm } from 'vuetify/components/VForm'

// 👉 - Page Title
const page = 'Login'

document.title = pageTitle(page)

// 👉 - Define Store
const dataStore = useAuthStore()

// 👉 - Theme
const authThemeImg = useGenerateImageVariant(authV2LoginIllustrationLight, authV2LoginIllustrationDark, authV2LoginIllustrationBorderedLight, authV2LoginIllustrationBorderedDark, true)
const authThemeMask = useGenerateImageVariant(authV2MaskLight, authV2MaskDark)

// 👉 - Data
const refVForm = ref()
const email = ref('superadmin@gmail.com')
const password = ref('Admin123!')
const isPasswordVisible = ref(false)
const failedMessage = ref(false)
const errorMessage = ref('')

// 👉 - Method
const login = () => {
  const payload = {
    email: email.value,
    password: password.value,
  }

  dataStore.login(payload)
    .catch(error => {
      failedMessage.value = true

      // errorMessage.value = error.response.data.errors[0].message

      errorMessage.value = error.response.data.message
      
      console.error(error)
    })
}

const onSubmit = () => {
  refVForm.value?.validate().then(({ valid: isValid }) => {
    if (isValid)
      login()
  })
}
</script>

<template>
  <div>
    <VSnackbar
      v-model="failedMessage"
      variant="flat"
      color="error"
    >
      {{ errorMessage }}
    </VSnackbar>

    <VRow
      no-gutters
      class="auth-wrapper bg-surface"
    >
      <!-- 👉 Image Section -->
      <VCol
        lg="8"
        class="d-none d-lg-flex"
      >
        <div class="position-relative bg-background rounded-lg w-100 ma-8 me-0">
          <div class="d-flex align-center justify-center w-100 h-100">
            <VImg
              max-width="505"
              :src="authThemeImg"
              class="auth-illustration mt-16 mb-2"
            />
          </div>

          <VImg
            :src="authThemeMask"
            class="auth-footer-mask"
          />
        </div>
      </VCol>

      <!-- 👉 Login Section -->
      <VCol
        cols="12"
        lg="4"
        class="auth-card-v2 d-flex align-center justify-center"
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

            <h5 class="text-h5 mb-1">
              Welcome to <span class="text-capitalize"> {{ themeConfig.app.title }} </span>! 👋🏻
            </h5>

            <p class="mb-0">
              Please sign-in to your account and start the adventure
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
                    label="Email"
                    type="email"
                    autofocus
                    :rules="[requiredValidator, emailValidator]"
                  />
                </VCol>

                <!-- password -->
                <VCol cols="12">
                  <AppTextField
                    v-model="password"
                    label="Password"
                    :rules="[requiredValidator]"
                    :type="isPasswordVisible ? 'text' : 'password'"
                    :append-inner-icon="isPasswordVisible ? 'tabler-eye-off' : 'tabler-eye'"
                    @click:append-inner="isPasswordVisible = !isPasswordVisible"
                  />

                  <div class="align-right mt-2 mb-4">
                    <RouterLink
                      class="text-primary ms-2 mb-1"
                      :to="{ name: 'forgot-password' }"
                    >
                      Forgot Password?
                    </RouterLink>
                  </div>

                  <VBtn
                    block
                    type="submit"
                  >
                    Login
                  </VBtn>
                </VCol>
              </VRow>
            </VForm>
          </VCardText>
        </VCard>
      </VCol>
    </VRow>
  </div>
</template>

<style lang="scss">
@use "@core/scss/template/pages/page-auth.scss";
</style>

<route lang="yaml">
meta:
  layout: blank
  redirectIfLoggedIn: true
</route>
