import mock from '@/@fake-db/mock'

let database = []

const category = ['Raw Material', 'Finished Goods', 'WIP']
const unit = ['KG', 'M', 'PCS', 'TON', 'G', 'L', 'mL', 'CM', 'KM', 'MM', 'MG']

for (let i = 0; i < 123; i++) {
  const count = i + 1

  // Define start date and end date
  const startDate = new Date("2022-01-01")
  const endDate = new Date("2023-04-30")

  // Calculate the time difference between start and end date in milliseconds
  const timeDiff = endDate.getTime() - startDate.getTime()

  // Randomize date
  const randomTime = Math.floor(Math.random() * timeDiff)
  const randomDate = new Date(startDate.getTime() + randomTime)
  
  // Buy and Sell Price
  const buyPrice = Math.floor(Math.random() * 1000000)
  const sellPrice = Math.round(buyPrice * 1.1)

  const item = {
    id: count,
    name: `Item ${count}`,
    code: `ITEM-${count}`,
    description: `Description of Item ${count}`,
    category: category[Math.floor(Math.random() * category.length)],
    stock: Math.floor(Math.random() * 10000),
    unit: unit[Math.floor(Math.random() * unit.length)],
    buyPrice,
    sellPrice,
    createdAt: randomDate,
    updatedAt: randomDate,
  }

  database.push(item)
}

// 👉 - Fetch Items
mock.onGet('/items').reply(() => {
  return [200, [...database]]
})

// 👉 - Add Item
mock.onPost('/items').reply(config => {
  // Parse data
  const {
    name,
    code,
    description,
    category,
    stock,
    unit,
    buyPrice,
    sellPrice,
  } = JSON.parse(config.data)

  const newItem = {
    id: Math.floor(Math.random() * 100) + 125,
    name,
    code,
    description,
    category,
    stock,
    unit,
    buyPrice,
    sellPrice,
    createdAt: new Date(),
    updatedAt: new Date(),
  }

  return [201, { ...newItem }]
})

// 👉 - Update Item
mock.onPut('/items').reply(config => {
  const {
    id,
    name,
    code,
    description,
    category,
    stock,
    unit,
    buyPrice,
    sellPrice,
    createdAt,
  } = JSON.parse(config.data)

  const updatedItem = {
    id,
    name,
    code,
    description,
    category,
    stock,
    unit,
    buyPrice,
    sellPrice,
    createdAt,
    updatedAt: new Date(),
  }
  
  return [200, { ...updatedItem }]
})

// 👉 - Delete Item
mock.onDelete('/items').reply(config => {
  return [204, {
    message: `Item successfully deleted!`,
  }]
})
