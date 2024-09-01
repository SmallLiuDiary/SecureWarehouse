<template>
  <v-container fluid>
    <v-row no-gutters>
      <v-col cols="12" md="3">
        <!-- Navigation Drawer for Warehouse Actions -->
        <v-navigation-drawer permanent app class="elevation-1">
          <v-list dense>
            <v-subheader>仓库操作</v-subheader>
            <v-list-item @click="openCreateDialog">
              <v-list-item-icon>
                <v-icon>mdi-plus</v-icon>
              </v-list-item-icon>
              <v-list-item-title>新建数据仓库</v-list-item-title>
            </v-list-item>
            <v-list-item @click="deleteWarehouse">
              <v-list-item-icon>
                <v-icon>mdi-delete</v-icon>
              </v-list-item-icon>
              <v-list-item-title>删除数据仓库</v-list-item-title>
            </v-list-item>
            <v-divider></v-divider>
            <v-subheader>我的仓库</v-subheader>
            <v-list-item v-for="warehouse in filteredWarehouses" :key="warehouse.id" @click="selectWarehouse(warehouse)"
                         :class="{ 'highlighted': selectedWarehouse === warehouse }">
              <v-list-item-content>
                <v-list-item-title>{{ warehouse }}</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-navigation-drawer>
      </v-col>


      <v-row>
        <!-- 条件渲染，如果没有选中仓库，显示欢迎信息 -->
        <div v-if="selectedWarehouse">
          <v-col>
            <v-list dense>
              <v-subheader>{{ selectedWarehouse }} Tables
                <v-col class="text-right">

                  <v-btn @click="showCreateTableDialog = true" color="primary">新建表</v-btn>
                </v-col>
              </v-subheader>
              <v-list-item-group v-model="selectedTableIndex" color="primary">
                <v-list-item v-for="(table, index) in tables" :key="table" >
                  <v-list-item-content @click="selectTable(table, index)"
                             :class="{ 'highlighted': selectedTableIndex === index }">
                    <v-list-item-title>{{ table }}</v-list-item-title>
                  </v-list-item-content>

                  <v-list-item-action>

                    <v-btn icon @click.stop="deleteTable(table)">
                      <v-icon>mdi-delete</v-icon>
                    </v-btn>
                  </v-list-item-action>
                  <v-btn @click="showAddItem = true" color="primary">新增数据</v-btn>
                </v-list-item>
                <v-expand-transition>
                <v-col>
                  <v-data-table v-if="selectedTable" :headers="tableHeaders" :items="tableRows" class="elevation-1"
                                :height="'50vh'" :fixed-header="true">
                  </v-data-table>
                </v-col>
                </v-expand-transition>
              </v-list-item-group>

            </v-list>

          </v-col>
        </div>
        <div v-else>
          <h1>欢迎使用我们的数据仓库管理系统！</h1>
          <p>请从左侧选择一个数据仓库以查看详情。</p>
        </div>

      </v-row>


    </v-row>
    <!-- Create Warehouse Dialog -->
    <v-dialog v-model="showCreateDialog" persistent max-width="600px">
      <v-card>
        <v-card-title>新建数据仓库</v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field
                    v-model="newWarehouseSuffix"
                    :label="`仓库名称 (组织: ${organization})`"
                    :prefix="`${organization}_`"
                    required
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-select
                    v-model="newWarehouse.charset"
                    :items="charsets"
                    item-text="label"
                    item-value="value"
                    label="选择字符集"
                    required
                ></v-select>
              </v-col>
              <v-col cols="12">
                <v-select
                    v-model="newWarehouse.collation"
                    :items="collations"
                    item-text="label"
                    item-value="value"
                    label="选择排序规则"
                    required
                ></v-select>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="showCreateDialog = false
           this.resetForm();">取消</v-btn>
          <v-btn color="blue darken-1" text @click="createWarehouse">创建</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="showCreateTableDialog" persistent max-width="600px">
      <v-card>
        <v-card-title>新建表</v-card-title>
        <v-card-text>
          <v-text-field v-model="newTable.name" label="表名" required clearable></v-text-field>
          <v-btn color="primary" @click="addNewColumn">添加列</v-btn>
          <v-simple-table>
            <template v-slot:default>
              <thead>
              <tr>
                <th class="text-left">列名</th>
                <th class="text-left">数据类型</th>
                <th class="text-left">操作</th>
              </tr>
              </thead>
              <tbody>
              <tr v-for="(col, index) in newTable.columns" :key="index">
                <td>
                  <v-text-field v-model="col.name" label="列名" required clearable></v-text-field>
                </td>
                <td>
                  <v-select
                      v-model="col.type"
                      :items="dataTypes"
                      label="选择类型"
                      required
                  ></v-select>
                </td>
                <td>
                  <v-btn icon color="red" @click="removeColumn(index)">
                    <v-icon>mdi-delete</v-icon>
                  </v-btn>
                </td>
              </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="createTable">创建</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="showAddItem" persistent max-width="600px">
      <v-card>
        <v-card-title>添加数据到 {{ selectedTable }}</v-card-title>
        <v-card-text>
          <v-form ref="form" v-model="valid">
            <v-container>
              <v-row v-for="(header, index) in tableHeaders" :key="index">
                <v-col cols="12">
                  <v-text-field :label="`Enter ${header.text}`" v-model="newRow[header.value]"></v-text-field>
                </v-col>
              </v-row>
            </v-container>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click="submitData">新增</v-btn>
          <v-btn text color="red" @click="showAddItem = false">取消</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>


  </v-container>

</template>

<script>
import axios from "axios";

export default {
  name: 'WarehouseManager',
  created() {
    this.loadWarehouses();
  },
  data() {
    return {
      showCreateDialog: false,
      newWarehouse: {
        name: '',
        charset: '',
        collation: ''
      },
      charsets: [
        {label: 'utf8mb4', value: 'utf8mb4'},
        {label: 'utf8', value: 'utf8'}
      ],
      collations: [
        {label: 'utf8mb4_unicode_ci', value: 'utf8mb4_unicode_ci'},
        {label: 'utf8_unicode_ci', value: 'utf8_unicode_ci'}
      ],
      warehouses: [],  // 这里应该从后端加载数据
      selectedWarehouse: null,
      tables: [],
      selectedTable: null,
      selectedTableIndex: null,
      showTableDialog: null,
      newTable: { // 存储新建表的信息
        name: '',
        columns: []
      },
      tableRows: [],
      tableHeaders: [],
      showCreateTableDialog: false, // 控制新建表对话框
      dataTypes: ['INT', 'VARCHAR(255)', 'TEXT', 'DATE'],  // 数据类型选项

      newRow: {},         // This will hold the new data to be inserted
      valid: true,        // Validation state of the form
      showAddItem: false,
      organization:null,
      newWarehouseSuffix: '',
    };
  },
  mounted() {
    // 获取用户的组织信息
    this.organization = sessionStorage.getItem('organization');
    this.loadWarehouses();
    console.log(this.organization)
  },
  computed: {
    filteredWarehouses() {
      // 根据组织信息筛选仓库，仓库名称前缀匹配组织名称
      return this.warehouses.filter(warehouse =>
          warehouse.startsWith(this.organization)
      );
    }
  },
  methods: {
    openCreateDialog() {
      this.showCreateDialog = true;
    },
    createWarehouse() {
      if (!this.newWarehouse.charset || !this.newWarehouse.collation) {
        alert("所有字段都是必填项。");
        return;
      }
      this.newWarehouse.name = `${this.organization}_${this.newWarehouseSuffix}`;
      axios.post('http://localhost:8081/api/warehouses', this.newWarehouse)
          .then(response => {
            console.log('Warehouse created:', response.data);
            this.warehouses.push(this.newWarehouse.name);
            this.resetForm();
            this.showCreateDialog = false;
            alert('创建数据仓库成功。');
          })
          .catch(error => {
            console.error('Error creating warehouse:', error);
            alert('创建数据仓库失败。');
          });
    },
    resetForm() {
      this.newWarehouse = {name: '', charset: '', collation: ''};
    },
    loadWarehouses() {
      axios.get('http://localhost:8081/api/getwarehouses')
          .then(response => {
            this.warehouses = response.data;
            console.log(this.warehouses);
          })
          .catch(error => {
            console.error('Error loading warehouses:', error);
          });
    },
    updateWarehouseName() {
      this.newWarehouse.name = `${this.organization}_${this.newWarehouse.name.split('_').slice(1).join('_')}`;
    },
    selectWarehouse(warehouse) {
      if (this.selectedWarehouse === warehouse) {
        this.selectedWarehouse = null;  // 取消选中


      } else {

        this.selectedWarehouse = warehouse;
        this.loadTables(warehouse);
      }
    },

    deleteWarehouse() {
      // 触发删除选中的数据仓库的逻辑
      if (!this.selectedWarehouse) {
        alert("请先选择一个数据仓库！");
        return;
      }
      if (confirm(`确定要删除 ${this.selectedWarehouse} 数据仓库吗？`)) {
        axios.delete(`http://localhost:8081/api/deletewarehouses/${this.selectedWarehouse}`)
            .then(response => {
              alert('数据仓库已删除！');
              this.warehouses = this.warehouses.filter(wh => wh !== this.selectedWarehouse);
              this.selectedWarehouse = null; // 重置选中的数据仓库
            })
            .catch(error => {
              console.error('删除数据仓库失败：', error);
              alert('删除数据仓库失败！');
            });
      }
    },
    loadTables(warehouse) {
      axios.get(`http://localhost:8081/api/warehouses/${warehouse}/tables`)
          .then(response => {
            this.tables = response.data;
            this.selectedTable = null; // Reset when switching warehouses
            this.selectedTableIndex = null;
          })
          .catch(error => {
            console.error('Error loading tables:', error);
          });
    },
    selectTable(table, index) {
      // 检查当前点击的表是否已经被选中
      if (this.selectedTable === table) {
        this.selectedTable = null;  // 取消选中
        this.selectedTableIndex = -1;
        this.tableRows = [];  // 清空表详情数据
        this.tableHeaders = [];
      } else {
        this.selectedTable = table;
        this.selectedTableIndex = index;
        axios.get(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables/${table}`)
            .then(response => {
              console.log(response.data);
              this.tableRows = response.data.data;  // 更新数据行
              this.tableHeaders = response.data.columns.map(columnName => ({
                text: columnName,
                value: columnName
              }));  // 创建表头

            })
            .catch(error => {
              console.error('Error loading table details:', error);
            });
      }
    },
    createTable() {
      if (!this.newTable.name) {
        alert('请输入表名！');
        return;
      }

      // 验证是否至少添加了一列，并且所有列都已正确填写
      if (this.newTable.columns.length === 0 || this.newTable.columns.some(col => !col.name || !col.type)) {
        alert('请确保所有列都填写了名称和数据类型！');
        return;
      }
      console.log(this.newTable)
      ;axios.post(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables`, {
        tableName: this.newTable.name,
        columns: this.newTable.columns
      })
          .then(() => {
            alert('表创建成功！');
            this.tables.push(this.newTable.name);  // 假设添加新表到列表视图
            this.showTableDialog = false;  // 关闭对话框
            this.newTable = {name: '', columns: []};  // 重置表单
            this.showCreateTableDialog = false;
          })
          .catch(error => {
            console.error('创建表失败:', error);
            alert('创建表失败！');
          });
    },
    deleteTable(tableName) {
      axios.delete(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables/${tableName}`)
          .then(() => {
            alert('表删除成功！');
            this.tables = this.tables.filter(t => t !== tableName); // 移除已删除的表
          })
          .catch(error => {
            console.error('删除表失败:', error);
            alert('删除表失败！');
          });
    },
    addNewColumn() {
      this.newTable.columns.push({name: '', type: ''});
    },
    removeColumn(index) {
      this.newTable.columns.splice(index, 1);
    },
    submitData() {
      axios.post(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables/${this.selectedTable}/data`, this.newRow)
          .then(() => {
            alert('Data added successfully!');
            this.newRow = {};  // 重置表单
            this.showAddItem = false;
          })
          .catch(error => {
            console.error('Error adding data:', error);
            alert('Failed to add data!');
          });
    },

  }
};
</script>
<style scoped>
.highlighted {
  background-color: #e0e0e0; /* 浅灰色背景表示高亮 */
}

.elevation-1 {
  overflow-y: auto;
  max-height: 75vh;
}
/* 添加一些样式以确保图标正确显示 */
.v-icon {
  margin-right: 8px;
}
</style>
