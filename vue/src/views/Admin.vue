<template>
  <v-container>
    <v-row>
      <v-col>
        <v-btn color="primary" @click="openDialog">新增用户</v-btn>
        <v-dialog v-model="dialog" max-width="600px">
          <v-card>
            <v-card-title>
              <span class="headline">{{ isEdit ? '编辑用户' : '新增用户' }}</span>
            </v-card-title>
            <v-card-text>
              <v-form ref="form" v-model="valid">
                <v-text-field
                    v-model="editedUser.username"
                    :rules="[v => !!v || 'Username is required']"
                    label="用户名"
                    required
                ></v-text-field>
                <v-text-field
                    v-model="editedUser.password"
                    :rules="[v => !!v || 'Password is required']"
                    label="密码"
                    type="password"
                    required
                ></v-text-field>
                <v-checkbox
                    v-model="editedUser.admin"
                    label="是否为管理员"
                ></v-checkbox>
                <v-checkbox
                    v-model="editedUser.enabled"
                    label="账号是否启用"
                ></v-checkbox>
                <v-text-field
                    v-model="editedUser.organization"
                    label="组织"
                ></v-text-field>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDialog">取消</v-btn>
              <v-btn color="blue darken-1" text @click="saveUser">保存</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-col>
    </v-row>
    <v-data-table :headers="headers" :items="users" class="elevation-1">
      <template v-slot:item.actions="{ item }">
        <v-icon small @click="editUser(item)">
          mdi-pencil
        </v-icon>
        <v-icon small @click="deleteUser(item)">
          mdi-delete
        </v-icon>
      </template>
    </v-data-table>

    <!-- 用户登录历史记录表 -->
    <v-row>
      <v-col>
        <h2>用户登录历史记录</h2>
        <v-data-table :headers="historyHeaders" :items="userHistory" class="elevation-1"></v-data-table>
      </v-col>
    </v-row>
  </v-container>
</template>


<script>
import axios from 'axios';

export default {
  data() {
    return {
      dialog: false,
      valid: true,
      isEdit: false,
      editedUser: {
        username: '',
        password: '',
        admin: false,
        enabled: true,
        organization: ''
      },
      headers: [
        { text: '用户名', value: 'username' },
        { text: '是否为管理员', value: 'admin' },
        { text: '是否启用', value: 'enabled' },
        { text: '隶属组织', value: 'organization' },
        { text: '操作', value: 'actions', sortable: false }
      ],
      users: [],
      userHistory: [],
      historyHeaders: [
        { text: '用户名', value: 'username' },
        { text: '是否为管理员', value: 'admin' },
        { text: '隶属组织', value: 'organization' },
        { text: '登录时间', value: 'loginTime' }
      ]
    };
  },
  methods: {
    openDialog() {
      this.isEdit = false;
      this.editedUser = {
        username: '',
        password: '',
        admin: false,
        enabled: true,
        organization: ''
      };
      this.dialog = true;
    },
    closeDialog() {
      this.dialog = false;
    },
    async fetchUsers() {
      try {
        const response = await axios.get('http://localhost:8081/api/users');
        this.users = response.data;
        console.log(response.data);
      } catch (error) {
        console.error('Failed to fetch users:', error);
      }
    },
    async saveUser() {
      if (this.$refs.form.validate()) {
        try {
          if (this.isEdit) {
            await axios.put(`http://localhost:8081/api/users/${this.editedUser.id}`, this.editedUser);
          } else {
            await axios.post('http://localhost:8081/api/users', this.editedUser);
          }
          await this.fetchUsers();
          this.closeDialog();
        } catch (error) {
          console.error('Failed to save user:', error);
        }
      }
    },
    editUser(user) {
      this.isEdit = true;
      this.editedUser = { ...user };
      this.dialog = true;
    },
    async deleteUser(user) {
      try {
        await axios.delete(`http://localhost:8081/api/users/${user.id}`);
        await this.fetchUsers();
      } catch (error) {
        console.error('Failed to delete user:', error);
      }
    },
    loadUserHistory() {
      axios.get('http://localhost:8081/api/user-history')
          .then(response => {
            this.userHistory = response.data;
            console.log(response.data)
          })
          .catch(error => {
            console.error('Error loading user history:', error);
          });
    }
  },
  mounted() {
    this.fetchUsers();

    this.loadUserHistory();

  }
};
</script>
