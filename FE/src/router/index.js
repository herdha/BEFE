import { setupLayouts } from 'virtual:generated-layouts'
import { createRouter, createWebHistory } from 'vue-router'
import routes from '~pages'
import { canAccessPage, getHome } from './utils'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: to => {
        const home = getHome()
        
        return { name: home }
      },
    },
    ...setupLayouts(routes),
  ],
})

router.beforeEach((to, from, next) => {
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth)
  const token = localStorage.getItem('accessToken')

  if (requiresAuth && !token) {
    next('/login')
  } else {
    if (to.meta.redirectIfLoggedIn && token)
      next('/')
    else if (to.meta.parent && !canAccessPage(to.meta.subject))
      next('/not-authorized')
    else
      next()
  }
})

// Docs: https://router.vuejs.org/guide/advanced/navigation-guards.html#global-before-guards
export default router
