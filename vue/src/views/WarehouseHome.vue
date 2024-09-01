<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <v-card class="mb-5" color="blue darken-1" dark>
          <v-card-title primary-title>
            <div>
              <h2 class="headline mb-0">数据仓库管理系统</h2>
              <p>欢迎使用数据仓库管理系统。高效地管理和监控您的数据仓库。</p>
            </div>
          </v-card-title>
        </v-card>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12" sm="6" md="4">
        <v-card class="mx-auto" max-width="344">
          <v-img
              class="white--text align-end"
              height="200px"
              src="https://picsum.photos/344/200"
          >
            <v-card-title>仓库概览</v-card-title>
          </v-img>

          <v-card-subtitle>管理和监控您的仓库</v-card-subtitle>

          <v-card-actions>
            <v-btn
                color="blue darken-1"
                text
                @click="navigateTo('overview')"
            >
              查看概览
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>

      <v-col cols="12" sm="6" md="4">
        <v-card class="mx-auto" max-width="344">
          <v-img
              class="white--text align-end"
              height="200px"
              src="https://picsum.photos/344/200?random=1"
          >
            <v-card-title>仓库管理</v-card-title>
          </v-img>

          <v-card-subtitle>创建和删除仓库</v-card-subtitle>

          <v-card-actions>
            <v-btn
                color="blue darken-1"
                text
                @click="navigateTo('manager')"
            >
              管理仓库
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>

      <v-col cols="12" sm="6" md="4">
        <v-card class="mx-auto" max-width="344">
          <v-img
              class="white--text align-end"
              height="200px"
              src="https://picsum.photos/344/200?random=2"
          >
            <v-card-title>仓库监控</v-card-title>
          </v-img>

          <v-card-subtitle>监控仓库数据</v-card-subtitle>

          <v-card-actions>
            <v-btn
                color="blue darken-1"
                text
                @click="navigateTo('monitor')"
            >
              监控数据
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  methods: {
    navigateTo(page) {
      this.$router.push({ path: `/${page}` });
    }
  }
}
</script>

<style scoped>
.headline {
  font-weight: bold;
}

.v-card-title {
  font-size: 24px;
}
</style>
