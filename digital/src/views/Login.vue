<template>
  <div>
    <div class="register">
      <el-row type="flex" justify="center">
        <el-col :xs="6" :sm="5" :md="5" :lg="5" :xl="5">
          <img src="../assets/images/consultancy.webp" class="front_image" />
        </el-col>
      </el-row>
      <el-row type="flex" class="qyf_title" justify="center">
        <el-col
          :xs="18"
          :sm="12"
          :md="10"
          :lg="10"
          :xl="10"
          :class="[show ? 'consultancy_title1' : 'consultancy_title2']"
          v-model="show"
          >一个帐号，玩转所有官网服务！</el-col
        >
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <el-input
            placeholder="请输入您的账号"
            class="submit"
            type="text"
            clearable
            v-model="zhanghao"
            id="account"
            @blur="tipAccount()"
          ></el-input>
          <span v-show="account" class="regInfo">账号不能为空</span>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <el-input
            placeholder="请输入您的密码"
            class="submit"
            type="password"
            show-password
            clearable
            v-model="mima"
            id="upwd"
            @blur="tipUpwd()"
          ></el-input>
          <span v-show="upwd" class="regInfo sure">密码不能为空</span>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10" class="cbx">
          <el-checkbox>
            <p>记住我（请在私人设备上使用此功能）</p>
          </el-checkbox>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <div class="btn1" @click="toReg">注册</div>
          <div class="btn2" @click="login">登录</div>
          <div class="otherLogin">
            第三方账号登录：
            <router-link
              to="/"
              class="qq-icon_24x24 qfy-icon_24x24 black1"
            ></router-link>
          </div>
          <div class="forgetUpwd">忘记密码？点这里找回</div>
        </el-col>
      </el-row>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
  </div>
</template>
<style>
.register .forgetUpwd {
  text-align: right;
  margin-bottom: 4rem;
}
.register .forgetUpwd:hover {
  color: #00eef3;
  cursor: pointer;
}
</style>
<script>
import app from "../App";
export default {
  data() {
    return {
      show: true,
      account: false,
      upwd: false,
      screenWidth: 0,
      zhanghao: "",
      mima: "",
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
    tipAccount() {
      let account = document.getElementById("account");
      if (account.value.trim() == "") this.account = true;
      else this.account = false;
    },
    tipUpwd() {
      let upwd = document.getElementById("upwd");
      if (upwd.value.trim() == "") this.upwd = true;
      else this.upwd = false;
    },
    toReg() {
      this.$router.push("/register");
    },
    login() {
      let obj = {
        uname: this.zhanghao,
        upwd: this.mima,
      };
      //分发Actions
      this.$store.dispatch("login", obj);
    },
  },
  updated() {
    this.getScreenWidth();
  },
  mounted() {
    this.getScreenWidth();
  },
};
</script>
