import Vue from "vue";
import Vuex from "vuex";
import axios from 'axios';
import qs from 'qs';
import router from '../router';
import { Message } from 'element-ui'
Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    uname:localStorage.getItem('uname') ? localStorage.getItem('uname') : '',
    upwd:localStorage.getItem('upwd') ? localStorage.getItem('upwd') : '',
  },
  getters: {},
  mutations: {
    logined(state,payload){
      state.isLogined = 1;
      state.uname = payload.uname;
      state.upwd = payload.upwd;
      localStorage.setItem('uname',payload.uname);
      localStorage.setItem('upwd',payload.upwd);
    },
    logout(state){
      state.isLogined = 0;
      state.uname = '';
      state.upwd = '';
      localStorage.removeItem('isLogined');
    }
  },
  actions: {
    login(context,payload){
      axios.post('/login',qs.stringify(payload)).then((res)=>{
        if(res.data.code == 1){
          Message({
            message: "恭喜你，登陆成功！",
            offset: 200,
            type: "success",
            showClose: true,
            duration: 2000,
          });
          context.commit('logined',res.data.results[0]);          
          localStorage.setItem('isLogined','1');
          router.push('/');
        }else {
          Message({
            message: "登陆失败，账号或密码错误！",
            offset: 200,
            type: "error",
            showClose: true,
            duration: 2000,
          });
        }
      });
    }
  },
  modules: {},
});
