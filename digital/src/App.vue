<template>
  <div id="app">
    <router-view />
  </div>
</template>

<style>
body {
  color: rgb(141, 144, 149);
  font-family: 微软雅黑, Helvetica, Arial, Verdana, sans-serif;
  background: #e8e8e8 none no-repeat fixed center top;
  background-size: cover;
}
a {
  text-decoration: none;
}
a:focus {
  outline: none;
}
.el-input__inner:hover {
  border-color: #00eef3 !important;
}
.el-input.is-active .el-input__inner,
.el-input__inner:focus {
  border-color: #00eef3 !important;
  outline: none !important;
}
.qfy-icon_24x24 {
  background-image: url(./assets/images/social_icon_24x24.png);
  background-repeat: no-repeat;
  height: 24px;
  width: 24px;
  background-position: 0 0;
  display: inline-block;
}
.qq-icon_24x24 {
  background-position: -48px 0;
}
.phone-icon {
  background-image: url(./assets/images/pic.png);
  background-repeat: no-repeat;
  height: 30px;
  width: 30px;
  background-position: 0 0;
  display: inline-block;
}
/*登录注册共用样式*/
.register .front_image {
  width: 100%;
}
.register .qyf_title {
  padding-top: 1.8rem;
  text-align: center;
}
.register .consultancy_title1 {
  font-size: 1.625rem;
  line-height: 1.625rem;
  padding-bottom: 0.9375rem;
  text-align: center;
  color: #00eef3;
  width: 100%;
  -webkit-transition: 1s linear;
  -ms-transition: 1s linear;
  -moz-transition: 1s linear;
  -o-transition: 1s linear;
  transition: 1s linear;
}
.register .consultancy_title2 {
  font-size: 1rem;
  line-height: 1rem;
  padding-bottom: 0.9375rem;
  text-align: center;
  color: #00eef3;
  width: 100%;
  -webkit-transition: 1s linear;
  -ms-transition: 1s linear;
  -moz-transition: 1s linear;
  -o-transition: 1s linear;
  transition: 1s linear;
}
.register .black1 {
  background-position-y: -4.5rem;
}
.register .submit {
  padding: 1rem 0;
}
.register .regInfo {
  color: #fff;
  background: #d14242;
  border: 1px solid #d14242;
  border-radius: 0.25rem;
  padding: 0.5rem;
  font-size: 0.75rem;
  display: inline-block;
}
.register .sure {
  margin-bottom: 1.25rem;
}
.register .cbx {
  padding: 1rem 0;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #ccc;
  margin-bottom: 1rem;
}
.register .cbx p {
  color: #888;
}
.register .cbx .is-checked p {
  color: #00eef3;
}
.register .cbx .is-checked .el-checkbox__input.is-checked .el-checkbox__inner {
  background-color: #00eef3;
  border-color: #00eef3;
}
.register .el-checkbox__inner:hover,
.register .el-checkbox__input.is-focus .el-checkbox__inner {
  border-color: #00eef3;
}
.register .btn1,
.register .btn2 {
  text-align: center;
  padding: 0.625rem;
  border-radius: 0.25rem;
  color: #000;
  margin-bottom: 1rem;
}
.register .btn1 {
  background-color: #00eef3;
  border-color: #00eef3;
}
.register .btn1:hover {
  cursor: pointer;
}
.register .btn2 {
  background-color: #fff;
  border: 1px solid #dcdfe6;
}
.register .btn2:hover {
  color: #00eef3;
  background-color: #fff;
  border-color: #00eef3;
  cursor: pointer;
}
.register .otherLogin {
  margin-bottom: 2rem;
  margin-top: 2rem;
}
</style>

<script>
import appHeader from "./components/Header";
import appAside from "./components/Aside";
import appFooter from "./components/Footer";
export default {
  components: {
    appAside,
  },
  data() {
    return {
      show: true,
      screenWidth: 0,
    };
  },
  methods: {
    getScreenWidth() {
      this.screenWidth = document.body.clientWidth;
      window.onresize = () => {
        return (() => {
          this.screenWidth = document.body.clientWidth;
          if (this.screenWidth <= 768) {
            this.show = false;
          } else {
            this.show = true;
          }
        })();
      };
    },
  },
};
</script>
