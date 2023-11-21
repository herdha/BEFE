// Fetch and parse the user permission
export const clusterPermission = () => {
  const cluster = process.env.VITE_CLUSTER
  const permission = JSON.parse(localStorage.getItem('permission'))
  
  return permission?.find(u => u.name.toLowerCase() === cluster.toLowerCase())
}

// Function to update page title
export const pageTitle = page => {
  const title = inject('title')
  
  return `${page} | ${title}`
}

// Function to get user permission on certain action
export const can = (menu, action) => {
  const permission = clusterPermission()

  if (permission && permission.allAccess) {
    return true
  }

  if (permission && permission.menu) {
    return permission.menu.find(u => u.name === menu)[action]
  }

  return false
}
