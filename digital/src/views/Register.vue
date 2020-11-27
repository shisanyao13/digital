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
            placeholder="请输入账号"
            class="submit"
            v-model="nickname"
            type="text"
            clearable
            @blur="tipAccount()"
          ></el-input>
          <span v-show="accountTip" class="regInfo">账号格式错误</span>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <el-input
            placeholder="请输入手机号"
            class="submit"
            v-model="phoneNum"
            type="text"
            @blur="tipPhone()"
            clearable
          ></el-input>
          <span v-show="phoneTip" class="regInfo"
            >请输入11位正确格式的手机号</span
          >
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <el-input
            placeholder="请输入密码"
            class="submit"
            v-model="password"
            type="password"
            show-password
            @blur="tipUpwd()"
            clearable
            id="upwd"
          ></el-input>
          <span v-show="upwdTip" class="regInfo">密码格式错误</span>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <el-input
            placeholder="请确认密码"
            class="submit"
            v-model="sureUpwd"
            type="password"
            @blur="tipSuwd()"
            show-password
            clearable
          ></el-input>
          <span v-show="suwdTip" class="regInfo sure">两次密码不一致</span>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10" class="cbx">
          <el-checkbox>
            <p @click="promise">我同意《用户手册》和《保密条款》</p>
          </el-checkbox>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center">
        <el-col :xs="18" :sm="12" :md="10" :lg="10" :xl="10">
          <div class="btn1" @click="regist" v-show="!diszc">
            注册
          </div>
          <div class="disbtn" v-show="diszc">
            注册
          </div>
          <div class="btn2" @click="tologin">登录</div>
          <div class="otherLogin">
            第三方账号登录：
            <router-link
              to="/"
              class="qq-icon_24x24 qfy-icon_24x24 black1"
            ></router-link>
          </div>
        </el-col>
      </el-row>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
  </div>
</template>
<style>
.register .disbtn,
.register .disbtn:hover {
  cursor: not-allowed;
  text-align: center;
  vertical-align: middle;
  border-radius: 0.25rem;
  color: #ccc;
  background-color: #fff;
  margin-bottom: 1rem;
  padding: 0.625rem;
}
</style>
<script>
export default {
  data() {
    return {
      show: true,
      screenWidth: 0,
      nickname: "",
      phoneNum: "",
      password: "",
      sureUpwd: "",
      accountTip: false,
      phoneTip: false,
      upwdTip: false,
      suwdTip: false,
      diszc: true,
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
    regist() {
      let obj = {
        uname: this.nickname,
        uphone: this.phoneNum,
        upwd: this.password,
      };
      this.axios.post("/register", this.qs.stringify(obj)).then((res) => {
        if (res.data.code == 1) {
          this.$message({
            message: "恭喜你，注册成功！",
            offset: 200,
            type: "success",
            showClose: true,
            duration: 2000,
          });
          this.timer = setTimeout(() => {
            this.$router.push("/login");
          }, 500);
        } else {
          this.$message({
            message: "注册失败，用户名已存在请重新输入！",
            offset: 200,
            type: "error",
            showClose: true,
            duration: 2000,
          });
        }
      });
    },
    tologin() {
      this.$router.push("/login");
    },
    tipAccount() {
      let regExp = /^[\w|[\u4e00-\u9fa5]{1,32}$/;
      this.accountTip = !regExp.test(this.nickname);
    },
    tipPhone() {
      let regExp = /^1[3-9][0-9]{9}$/;
      this.phoneTip = !regExp.test(this.phoneNum);
    },
    tipUpwd() {
      let regExp = /^\w{6,32}$/;
      this.upwdTip = !regExp.test(this.password);
    },
    tipSuwd() {
      let regExp = document.getElementById("upwd").value;
      this.suwdTip = !(regExp == this.sureUpwd);
    },
    promise() {
      this.diszc = false;
    },
  },
  updated() {
    this.getScreenWidth();
  },
  mounted() {
    this.getScreenWidth();
  },
  beforeDestroy() {
    clearTimeout(this.timer);
  },
};
</script>
