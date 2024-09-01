<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="6">
        <v-select
            :items="filteredWarehouses"
            item-text="name"
            item-value="id"
            v-model="selectedWarehouseId"
            label="选择数据仓库"
            return-object
            @change="onWarehouseSelect"
        ></v-select>
      </v-col>
      <v-col cols="12" md="6">
        <v-btn color="primary" @click="performFullBackup" :disabled="!selectedWarehouseId">执行全量备份</v-btn>
        <v-btn color="secondary" @click="performIncrementalBackup" :disabled="!selectedWarehouseId">执行增量备份</v-btn>
      </v-col>
    </v-row>
    <v-row>
      <div v-if="databaseStats">
        <h3>表总数: {{ databaseStats.tableCount }}</h3>
        <v-data-table
            :headers="[{ text: '表名', value: 'TABLE_NAME' }, { text: '大小 (MB)', value: 'SIZE_MB' }]"
            :items="databaseStats.tableSizes"
            class="elevation-1"
        ></v-data-table>
      </div>
    </v-row>
    <v-row>
      <h3>历史备份记录</h3>
      <v-col cols="12">
        <v-data-table :headers="backupHeaders" :items="backups" class="elevation-1">
          <!-- 数据表格内容 -->
        </v-data-table>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  name: "WarehouseMonitor",
  created() {
    this.loadWarehouses();
  },
  data() {
    return {
      warehouses: [],
      selectedWarehouseId: null,  // 选中的数据仓库ID
      selectedWarehouse: null,
      databaseStats: null,
      backups: [],
      backupHeaders: [


        { text: '备份类型', value: 'backupType' },
        { text: '备份时间', value: 'backupTime' },
        { text: '状态', value: 'status' }
      ],
      organization: null,
      // 其他数据
    };
  },
  computed: {
    filteredWarehouses() {
      //根据组织信息筛选仓库，仓库名称前缀匹配组织名称
      return this.warehouses.filter(warehouse =>
          warehouse.startsWith(this.organization)
      );
    }
  },
  methods: {
    loadWarehouses() {
      axios.get('http://localhost:8081/api/getwarehouses')
          .then(response => {
            this.warehouses = response.data;
          })
          .catch(error => {
            console.error('Error loading warehouses:', error);
          });
    },

    performFullBackup() {
      if (this.selectedWarehouse) {
        axios.post(`http://localhost:8081/api/backup/full/${this.selectedWarehouse}`)
            .then(response => {
              alert(response.data);
              this.loadBackupHistory(); // 重新加载备份历史
            })
            .catch(error => {
              console.error('全量备份失败:', error);
            });
      }
    },
    performIncrementalBackup() {
      if (this.selectedWarehouse) {
        axios.post(`http://localhost:8081/api/backup/incremental/${this.selectedWarehouse}`)
            .then(response => {
              alert(response.data);
              this.loadBackupHistory(); // 重新加载备份历史
            })
            .catch(error => {
              console.error('增量备份失败:', error);
            });
      }

  },

    loadBackupHistory() {
      // 加载备份历史
      axios.get(`http://localhost:8081/api/backup-history/${this.selectedWarehouse}`).then(response => {
        this.backups = response.data;
        console.log(response.data);
      }).catch(error => {
        console.error('加载备份历史失败:', error);
      });
    },
    onWarehouseSelect(item) {
      this.selectedWarehouse = item;
      // 可以在这里加载仓库的其他信息，如表格数据等
      console.log(item)
      axios.get(`http://localhost:8081/api/warehouses/${item}/stats`)
          .then(response => {
            this.databaseStats = response.data;
            this.loadBackupHistory();
          })
          .catch(error => {
            console.error('获取数据库统计信息失败:', error);
            this.databaseStats = null;
          });
    }
  },
  mounted() {
    this.loadBackupHistory();
    // 获取用户的组织信息
    this.organization = sessionStorage.getItem('organization');
    this.loadWarehouses();
  }
}
</script>

<style scoped>

</style>