<script setup>
import { clusterPermission } from "@utils"

const filterPermission = () => {
  return clusterPermission()?.menu?.filter(el => getAccess(el))
}

const getAccess = menu => {
  return menu.view ? Object.keys(menu).filter(key => menu[key] === true).map(item => item.charAt(0).toUpperCase() + item.slice(1)).join(', ') : false
}
</script>

<template>
  <VRow>
    <VCol cols="12">
      <VCard>
        <VCardText>
          <VTable class="text-no-wrap border rounded">
            <thead>
              <tr>
                <th width="50%">
                  MENU
                </th>
                <th>
                  ACCESS
                </th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in filterPermission()"
                :key="item"
              >
                <td>
                  {{ item.name }}
                </td>
                <td>
                  {{ getAccess(item) }}
                </td>
              </tr>
            </tbody>
          </VTable>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>
</template>
