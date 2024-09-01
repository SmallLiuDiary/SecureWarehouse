import Vue from 'vue';
import Router from 'vue-router';
import MainLayout from '@/components/MainLayout.vue';
import WarehouseHome from '@/views/WarehouseHome.vue';
import WarehouseManager from '@/views/WarehouseManager.vue';
import WarehouseMonitor from '@/views/WarehouseMonitor.vue';
import Login from '@/views/Login.vue'
import Admin from '@/views/Admin.vue'
Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    {path: '/',
    redirect:'/login'
    },
    {
      path: '/',
      component: MainLayout,
      children: [

        { path: 'home', component: WarehouseHome },
        { path: 'manager', component: WarehouseManager },
        { path: 'monitor', component: WarehouseMonitor }
      ]
    },
    { path: '/login', component: Login },
    { path: '/admin', component: Admin }
  ]
});
