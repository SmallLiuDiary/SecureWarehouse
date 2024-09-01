<template>
  <v-container fluid class="login-container">
    <v-row align="center" justify="center">
      <v-col cols="12" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>数据仓库安全信息管理系统</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-form ref="form" v-model="valid" @submit.prevent="login">
              <v-text-field
                  v-model="username"
                  :rules="[v => !!v || 'Username is required']"
                  label="用户名"
                  required
              ></v-text-field>
              <v-text-field
                  v-model="password"
                  :rules="[v => !!v || 'Password is required']"
                  label="密码"
                  type="password"
                  required
              ></v-text-field>
              <v-btn :disabled="!valid" type="submit" color="primary" block>登录</v-btn>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      valid: true,
      username: '',
      password: '',
    };
  },
  methods: {
    async login() {
      const credentials = {
        username: this.username,
        password: this.password
      };
      try {
        const response = await axios.post('http://localhost:8081/api/login', credentials);
        console.log('登录成功', response.data);

        // 存储组织信息到sessionStorage
        sessionStorage.setItem('organization', response.data.organization);

        // 跳转到相应页面
        if (response.data.redirectUrl.includes('/admin')) {
          await this.$router.push('/admin');
        } else {
          await this.$router.push('/home');
        }
      } catch (error) {
        console.error('登录失败', error.response);
        if (error.response && error.response.status === 401) {
          this.errorMessage = "登录失败，请检查您的用户名和密码是否正确。";
        }
      }
    }
  },
};
</script>

<style scoped>
.login-container {
  height: 100vh;
  background: url('https://picsum.photos/1600/900') no-repeat center center;
  background-size: cover;
}
.v-card {
  border-radius: 12px;
}
</style>
