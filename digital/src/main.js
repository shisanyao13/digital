import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import ElementUI from "element-ui";
Vue.use(ElementUI);
import "element-ui/lib/theme-chalk/index.css";
import "element-ui/lib/theme-chalk/display.css";

import moment from 'moment'; 
Vue.prototype.moment = moment;

// 自定义全局组件
import appHeader from "./components/Header.vue";
Vue.component("app-header", appHeader);
import appAside from "./components/Aside.vue";
Vue.component("app-aside", appAside);
import appFooter from "./components/Footer.vue";
Vue.component("app-footer", appFooter);
import appUp from "./components/Up.vue";
Vue.component("app-up", appUp);

import axios from "axios";
axios.defaults.baseURL = "http://ssyserver.applinzi.com";
Vue.prototype.axios = axios;

import qs from "qs";
Vue.prototype.qs = qs;

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
