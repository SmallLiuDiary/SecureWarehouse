<template>
  <v-app>
    <v-app-bar app dense>
      <v-toolbar-title>数据仓库安全信息管理系统</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn text v-for="page in pages" :key="page.title" @click="changePage(page)">
        {{ page.title }}
      </v-btn>
    </v-app-bar>

    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'MainLayout',
  data() {
    return {
      pages: [
        { title: '数据仓库首页', path: '/home' },
        { title: '数据仓库管理', path: '/manager' },
        { title: '数据仓库监测', path: '/monitor' },
        { title: '用户登出', path: '/login' }
      ]
    };
  },
  methods: {
    changePage(page) {
      this.$router.push(page.path);
    }
  }
};
</script>
