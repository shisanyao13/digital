import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Aside from "../components/Aside.vue";
import Footer from "../components/Footer.vue";
import Header from "../components/Header.vue";
import Up from "../components/Up.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/up",
    component: Up,
  },
  {
    path: "/header",
    component: Header,
  },
  {
    path: "/footer",
    component: Footer,
  },
  {
    path: "/aside",
    component: Aside,
  },
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/register",
    component: () =>
      import(/* webpackChunkName: "Register" */ "../views/Register.vue"),
  },
  {
    path: "/login",
    component: () =>
      import(/* webpackChunkName: "Login" */ "../views/Login.vue"),
  },
  {
    path: "/afterservice",
    component: () =>
      import(
        /* webpackChunkName: "AfterService" */ "../views/AfterService.vue"
      ),
  },
  {
    path: "/notebook",
    component: () =>
      import(/* webpackChunkName: "Notebook" */ "../views/Notebook.vue"),
  },
  {
    path: "/desktop",
    component: () =>
      import(/* webpackChunkName: "desktop" */ "../views/Desktop.vue"),
  },
  {
    path: "/peripherals",
    component: () =>
      import(/* webpackChunkName: "Peripherals" */ "../views/Peripherals.vue"),
  },
  {
    path: "/assessment",
    component: () =>
      import(/* webpackChunkName: "Assessment" */ "../views/Assessment.vue"),
  },
  {
    path: "/office",
    component: () =>
      import(/* webpackChunkName: "office" */ "../views/Office.vue"),
  },
  {
    path: "/camera",
    component: () =>
      import(/* webpackChunkName: "camera" */ "../views/Camera.vue"),
  },
  {
    path: "/vr",
    component: () => import(/* webpackChunkName: "vr" */ "../views/VR.vue"),
  },
  {
    path: "/drive",
    component: () =>
      import(/* webpackChunkName: "drive" */ "../views/Drive.vue"),
  },
  {
    path: "/searchResult/:consequence",
    name:"searchResult",
    component: () =>
      import(/* webpackChunkName: "SearchResult" */ "../views/SearchResult.vue"),
  },
  {
    path: "/product/:img",
    name:"product",
    component: () =>
      import(/* webpackChunkName: "Product" */ "../views/Product.vue"),
  },
  {
    path: "/cart",
    component: () =>
      import(/* webpackChunkName: "Cart" */ "../views/Cart.vue"),
  },
  { 
    name:'NotFound',
    path:'*',
    component: () =>
      import(/* webpackChunkName: "NotFound" */ "../views/NotFound.vue"),
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
