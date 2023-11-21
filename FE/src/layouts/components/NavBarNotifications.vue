<script setup>
const notifications = ref([
  {
    id: 1,
    text: 'Invoice',
    title: 'Invoice Created',
    subtitle: 'New Invoice from SO/20230401/0341',
    time: 'Today',
    isSeen: true,
  },
  {
    id: 2,
    text: 'Shipment',
    title: 'Order is being shipped 📦',
    subtitle: 'by Fantastic Driver',
    time: 'Yesterday',
    isSeen: false,
  },
  {
    id: 3,
    text: 'Job Order',
    title: 'Job Order Delayed',
    subtitle: 'Due to maintenance',
    time: '3 Mar',
    isSeen: true,
  },
  {
    id: 4,
    text: 'Sales Order',
    title: 'Sales Order Approval',
    subtitle: 'Need approval ASAP',
    time: '27 Feb',
    isSeen: false,
    color: 'error',
  },
  {
    id: 5,
    text: 'Purchase Request',
    title: 'New Purchase Request',
    subtitle: 'Requested by John',
    time: '13 Jan',
    isSeen: true,
  },
])

const removeNotification = notificationId => {
  notifications.value.forEach((item, index) => {
    if (notificationId === item.id)
      notifications.value.splice(index, 1)
  })
}

const markRead = notificationId => {
  notifications.value.forEach(item => {
    notificationId.forEach(id => {
      if (id === item.id)
        item.isSeen = true
    })
  })
}

const markUnRead = notificationId => {
  notifications.value.forEach(item => {
    notificationId.forEach(id => {
      if (id === item.id)
        item.isSeen = false
    })
  })
}

const handleNotificationClick = notification => {
  if (!notification.isSeen)
    markRead([notification.id])
}
</script>

<template>
  <Notifications
    :notifications="notifications"
    @remove="removeNotification"
    @read="markRead"
    @unread="markUnRead"
    @click:notification="handleNotificationClick"
  />
</template>
