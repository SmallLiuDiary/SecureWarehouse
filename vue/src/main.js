import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import elementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import request from '@/util/request'
import 'bootstrap/dist/css/bootstrap.css'
import BootstrapVue from 'bootstrap-vue';
import vuetify from './plugins/vuetify'

Vue.config.productionTip = false
Vue.use(elementUI)
Vue.use(BootstrapVue);
Vue.prototype.request = request
new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
