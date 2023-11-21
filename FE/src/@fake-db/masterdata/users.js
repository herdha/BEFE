// ** Mock Adapter
import mock from '@/@fake-db/mock'
import {config} from "@layouts/config";

const users = [
  {
    id: 1,
    email: 'a@gmail.com',
    role: 'Admin',
    roleRef: {
      name: "Admin",
      level: "Admin",
    },
    createdAt:'2023-02-17T08:31:10.091Z',
    updatedAt:'2023-02-17T08:31:10.091Z',
  },
  {
    id: 2,
    email: 'b@gmail.com',
    role: 'Supplier',
    roleRef: {
      name: "Supplier",
      level: "Senior",
    },
    createdAt:'2023-02-17T08:31:10.091Z',
    updatedAt:'2023-02-17T08:31:10.091Z',
  },
  {
    id: 3,
    email: 'c@gmail.com',
    role: 'Customer',
    roleRef: {
      name: "Customer",
      level: "New",
    },
    createdAt:'2023-02-17T08:31:10.091Z',
    updatedAt:'2023-02-17T08:31:10.091Z',
  },
  {
    id: 4,
    email: 'd@gmail.com',
    role: 'Driver',
    roleRef: {
      name: "Driver",
      level: "Medium",
    },
    createdAt:'2023-02-17T08:31:10.091Z',
    updatedAt:'2023-02-17T08:31:10.091Z',
  },
]

// ** GET Users Data
mock.onGet('/users').reply(config => {
  return [200, [...users]]
})

//  👉 Get user by ID
mock.onGet('/users/user-id').reply(config => {
  const id = config.params.id
  const user = users.find(user => user.id === id)
  if (user === undefined) {
    return [404, { error: 'User not found' }]
  } else {
    return [200, user]
  }
})

// 👉 Add user
mock.onPost('/users/user').reply(config => {
  const user = JSON.parse(config.data)
  console.log(user)
  const { length } = users
  let lastIndex = 0
  if (length) {
    lastIndex = users[length - 1].id
  }
  user.id = lastIndex + 1
  users.push(user)

  return [201, users]
})

// 👉 Delete user
mock.onDelete('/users/delete-user').reply(config => {
  const userId = config.params.id.value
  const userIndex = users.findIndex(user => user.id === userId)
  if (userIndex > -1) {
    users.splice(userIndex, 1)
    return [200, { message: 'User deleted' }]
  } else {
    return [404, { error: 'User not found' }]
  }
})


