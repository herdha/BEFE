import menu from "@/navigation/vertical/index"
import { clusterPermission } from "@utils"

/**
 * Function to get the first parent and child which the user can view
 */
export const getHome = () => {
  const permission = clusterPermission()

  if (!permission) {
    return 'profile'
  }

  if (permission.allAccess) {
    return 'dashboard' // First menu in client
  }

  const firstTrueView = permission.menu.find(obj => obj.view === true)

  const findToValue = obj => {
    if (obj.children) {
      const child = obj.children.find(child => child.title === firstTrueView?.name)
      
      return child?.to || null
    }
    
    return obj.title === firstTrueView?.name ? obj.to : null
  }

  const toValue = menu.reduce((acc, obj) => acc || findToValue(obj), null)

  return toValue || 'profile'
}

/**
 * Function to check if the destination page is accessible to the user
 */
export const canAccessPage = menu => {
  const permission = clusterPermission()

  if (permission && permission.allAccess) {
    return true
  }

  if (permission && permission.menu) {
    return permission.menu.find(u => u.name === menu)?.view
  }

  return false
}
