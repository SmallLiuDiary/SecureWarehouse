<template>

  <v-app>
    <router-view />
  </v-app>

</template>

<script>

import MainLayout from "@/components/MainLayout.vue";

export default {
  name: 'App',
  components: {MainLayout},

  data: () => ({
    //
  }),
};
</script>
