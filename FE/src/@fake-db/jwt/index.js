import mock from '@/@fake-db/mock'

const userTokens = [
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IDAsICJuYW1lIjogIlN1cGVyIEFkbWluIiwgInJvbGUiOiAiU3VwZXIgQWRtaW4ifQ==.fhc3wykrAnRpcKApKhXiahxaOe8PSHatad31NuIZ0Zg',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IDEsICJuYW1lIjogIk9wZXJhdG9yIiwgInJvbGUiOiAiT3BlcmF0b3IifQ==.cat2xMrZLn0FwicdGtZNzL7ifDTAKWB0k1RurSWjdnw',
]

const database = [
  {
    id: 0,
    name: 'John Doe',
    role: 'Super Admin',
    email: 'superadmin@phibase.com',
    password: 'PhibaseSuperAdmin@2023',
    roleRef: {
      name: 'Super Admin',
      permission: [{
        name: 'Common',
        allAccess: true,
        menu: [{
          name: 'Dashboard',
          view: true,
        }, {
          name: 'Item',
          view: true,
          add: true,
          edit: true,
          delete: true,
        }, {
          name: 'Scan Barcode',
          view: true,
          scan: true,
        }],
      }],
    },
  },
  {
    id: 1,
    name: 'Selina Kyle',
    role: 'Operator',
    email: 'operator@phibase.com',
    password: 'PhibaseOperator@2023',
    roleRef: {
      name: 'Operator',
      permission: [{
        name: 'Common',
        allAccess: false,
        menu: [{
          name: 'Dashboard',
          view: false,
        }, {
          name: 'Item',
          view: true,
          add: false,
          edit: false,
          delete: false,
        }, {
          name: 'Scan Barcode',
          view: true,
          scan: true,
        }],
      }],
    },
  },
]

mock.onPost('/auth/login').reply(request => {
  const { email, password } = JSON.parse(request.data)
  let errors = {
    email: ['Something went wrong'],
  }
  const user = database.find(u => u.email === email && u.password === password)
  if (user) {
    try {
      const accessToken = userTokens[user.id]

      // We are duplicating user here
      const userData = { ...user }

      const response = {
        permission: userData.roleRef.permission,
        accessToken,
      }

      return [200, response]
    }
    catch (e) {
      errors = { email: [e] }
    }
  }
  else {
    errors = {
      email: ['Email or Password is Invalid'],
    }
  }
  
  return [400, { errors }]
})

mock.onGet('/auth/current-user').reply(request => {
  const accessToken = localStorage.getItem('accessToken')
  const payload = accessToken.split('.')[1]
  const decodedPayload = atob(payload)
  const data = JSON.parse(decodedPayload)

  const user = database.find(u => u.id === data.id)
  if (user) {
    return [200, user]
  }

  return [400, { message: 'Failed to get current user.' }]
})
