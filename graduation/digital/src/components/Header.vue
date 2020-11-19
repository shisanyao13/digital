<template>
  <div class="header">
    <div class="headTime hidden-sm-and-down">
      <div class="headOntime">
        <img src="../assets/images/wi-time-.png" alt="" />
        <p>当前时间： {{ now }}</p>
        <p>欢迎访问数码家电在线商城模板！</p>
      </div>
      <div v-if="this.$store.state.isLogined == 0">
        <router-link to="/login">登录</router-link>
        <router-link to="/register" class="headReg">注册</router-link>
        <div class="el-icon-shopping-cart-2" @click="toCart()"></div>
      </div>
      <div v-else class="Logined">
        <p>{{ this.$store.state.uname }}</p>
        <button @click="logout">退出</button>
        <div class="el-icon-shopping-cart-2" @click="toCart()"></div>
      </div>
    </div>
    <div class="headRoute hidden-sm-and-down">
      <img src="../assets/images/consultancy_logo.webp" alt="" />
      <ul>
        <li v-for="(item, index) of list" :key="index">
          <router-link :to="item.route" active-class="active" exact>{{
            item.name
          }}</router-link>
        </li>
      </ul>
      <div class="headSearch">
        <el-input
          placeholder="游戏笔记本"
          v-model="fuzzy"
          suffix-icon="el-icon-search"
          @keyup.enter.native="fuzzySearch()"
          @change="onTime()"
        >
        </el-input>
      </div>
    </div>
    <!-- 滚动一段距离，原导航不在视野后时的新导航 -->
    <transition name="el-zoom-in-top">
      <div
        class="scrollRoute  hidden-sm-and-down transition-box"
        v-show="scrollShow"
      >
        <ul>
          <li v-for="(item, index) of list" :key="index">
            <router-link :to="item.route" active-class="active" exact>{{
              item.name
            }}</router-link>
          </li>
        </ul>
      </div>
    </transition>
    <div class="hidden-md-and-up headSmall">
      <el-button icon="el-icon-menu" @click="drawer = true"></el-button>
      <el-drawer
        class="drawerLeft"
        :withHeader="drawerTitle"
        :visible.sync="drawer"
        direction="ltr"
      >
        <div class="drawerRoute" v-if="this.$store.state.isLogined == 0">
          <router-link to="/login">登录</router-link>
          <router-link to="/register">注册</router-link>
        </div>
        <div v-else class="smallLogined">
          <p>{{ this.$store.state.uname }}</p>
          <button @click="logout">退出</button>
        </div>
        <img src="../assets/images/consultancy_logo.webp" alt="" />
        <ul>
          <li v-for="(item, index) of list" :key="index">
            <router-link :to="item.route" active-class="active" exact>{{
              item.name
            }}</router-link>
          </li>
          <li>
            <span class="el-icon-shopping-cart-2" @click="toCart()"
              >购物车</span
            >
          </li>
        </ul>
      </el-drawer>
      <img src="../assets/images/consultancy_logo.webp" alt="" />
      <el-button
        icon="el-icon-search"
        @click="dialogFormVisible = true"
      ></el-button>
      <el-dialog title="搜索" :visible.sync="dialogFormVisible">
        <el-form :model="form">
          <el-form-item :label-width="formLabelWidth">
            <el-input
              v-model="form.name"
              autocomplete="off"
              placeholder="请输入关键词"
            ></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="cancel()">取 消</el-button>
          <el-button type="primary" @click="sure()">确 定</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>
<style>
.active {
  color: #00eff2 !important;
}
.header .Logined {
  display: flex;
  align-items: center;
}
.header .Logined > p {
  margin: 0 1rem;
  color: #fff;
}
.header .Logined > p:hover {
  color: #00eff2;
}
.header .Logined > button {
  margin: 0 1rem;
  background-color: transparent;
  border: 1px solid transparent;
  color: #fff;
  border-radius: 2px;
}
.header .Logined > button:hover {
  color: #00eff2;
}
.header .Logined > div {
  margin-left: 1rem;
}
.header .smallLogined {
  font-size: 1.5rem;
  color: #fff;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header .smallLogined > p {
  margin: 1rem;
}
.header .smallLogined > p:hover {
  color: #00eff2;
}
.header .smallLogined > button {
  background-color: transparent;
  color: #fff;
  border: 1px solid transparent;
}
.header .smallLogined > button:hover,
.header .smallLogined > button:focus {
  color: #00eff2;
}
.header .headTime {
  background-color: #272727;
  color: #999;
  font-size: 0.75rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.9375rem 2.5rem;
}
.header .headTime a {
  text-decoration: none;
  color: #999;
}
.header .headTime a:hover {
  color: #00eff2;
}
.header .headOntime > p {
  display: inline-block;
  padding: 0 2.5rem 0 0.13rem;
}
.header .headReg {
  margin-left: 0.5rem;
  margin-right: 1.25rem;
}
.header .el-icon-shopping-cart-2 {
  font-size: 1.25rem;
}
.header .el-icon-shopping-cart-2:hover {
  color: #00eff2;
  cursor: pointer;
}
.header .headRoute {
  background-color: #0a0a0a;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 2rem 2.5rem;
  border-bottom: 1px solid #00eff2;
}
.header .headRoute > img {
  width: 13.75rem;
  height: 2.9rem;
}
.header .headRoute > ul {
  display: flex;
  font-size: 0.875rem;
}
.header .headRoute > ul > li > a {
  margin: 0 0.5rem;
  color: #999;
}
.header .headRoute > ul > li > a:hover {
  color: #00eff2;
  cursor: pointer;
}
.header .headSearch {
  border: 1px solid #999;
}
.header .headSearch:hover {
  border: 1px solid #00eff2;
}
.header .headRoute .el-input__inner,
.header .headRoute .el-input-group__append {
  background-color: transparent;
  border: 0;
  border-radius: 0;
  color: #fff;
}
.header .headSmall {
  background-color: #0a0a0a;
  padding: 0.625rem 0.625rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header .headSmall > img {
  width: 6.25rem;
  height: 1.35rem;
}
.header .headSmall > .el-button {
  background-color: transparent;
  border: 0;
}
.el-button:focus,
.el-button:hover {
  color: #00eff2 !important;
}
[class^="el-icon-"] {
  font-size: 1.125rem;
}
.header .headSmall .el-input__inner {
  margin-left: -5.5rem;
}
.header .headSmall .el-form-item__content {
  width: 80%;
}
.el-button--primary {
  border-color: #00eff3 !important;
  background-color: #fff !important;
  color: #00eff3 !important;
}
.el-button--primary:hover,
.el-button--default:hover {
  background-color: #00eff3 !important;
  color: #fff !important;
}
.el-button--default:focus {
  outline: none;
}
.header .headSmall .drawerLeft {
  width: 50rem;
}
.header .headSmall .drawerLeft .drawerRoute {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header .headSmall .drawerLeft .drawerRoute > a {
  text-decoration: none;
  color: #999;
  padding: 1.875rem;
}
.header .headSmall .drawerLeft .drawerRoute a:hover {
  color: #00eff2;
}
.header .headSmall .drawerLeft .drawerRoute a:focus {
  outline: none;
}
.header .headSmall .el-drawer__body {
  background-color: #0a0a0a;
}
.header .headSmall .el-drawer__body img {
  width: 13.75rem;
  height: 2.95rem;
  margin-left: 0.625rem;
  margin-bottom: 1.5rem;
}
.header .headSmall .drawerLeft ul {
  margin-left: 1.25rem;
}
.header .headSmall .drawerLeft ul > li {
  margin-bottom: 1.25rem;
}
.header .headSmall .drawerLeft ul > li > a {
  color: #999;
  -webkit-transition: 1s linear;
  -moz-transition: 1s linear;
  -ms-transition: 1s linear;
  -o-transition: 1s linear;
  transition: 1s linear;
}
.header .headSmall .drawerLeft ul > li > a:hover {
  color: #00eff2;
  margin-left: 1.25rem;
}
.header .headSmall .drawerLeft ul > li > span {
  font-size: 17px;
  transition: 1s linear;
}
.header .headSmall .drawerLeft ul > li > span:hover {
  color: #00eff2;
  margin-left: 1.25rem;
}
.header .scrollRoute {
  margin: 0 auto;
  font-size: 14px;
  color: #999;
  background-color: #0a0a0a;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
}
.header .transition-box {
  margin-bottom: 10px;
  width: 100%;
  height: 3.75rem;
  background-color: #0a0a0a;
  text-align: center;
  color: #999;
  box-sizing: border-box;
  z-index: 100;
}
.header .scrollRoute > ul {
  display: flex;
  justify-content: space-around;
  width: 60%;
  margin: 0 auto;
  padding: 1.5625rem;
}
.header .scrollRoute > ul > li > a {
  color: #999;
}
.header .scrollRoute > ul > li > a:hover {
  color: #00eff2;
}
.header .el-input__suffix:hover {
  cursor: pointer;
}
</style>
<script>
export default {
  data() {
    return {
      list: [
        { name: "首页", route: "/" },
        { name: "笔记本", route: "/notebook" },
        { name: "台式机", route: "/desktop" },
        { name: "外设系列", route: "/Peripherals" },
        { name: "评测中心", route: "/assessment" },
        { name: "售后服务", route: "/afterservice" },
      ],
      dialogFormVisible: false,
      form: {
        name: "",
      },
      drawer: false,
      drawerTitle: false,
      formLabelWidth: "120px",
      scrollShow: false,
      fuzzy: "",
      result: [],
      now: "",
    };
  },
  methods: {
    newScroll() {
      var scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      if (scrollTop > 160) this.scrollShow = true;
      else this.scrollShow = false;
    },
    onTime() {
      if (this.fuzzy.trim() == "") {
        this.fuzzy = "";
        this.$notify({
          type: "error",
          dangerouslyUseHTMLString: true,
          message:
            '<p style="color:red;padding:10px">搜索不能为空！请重新输入</p>',
          offset: 145,
          duration: 3000,
        });
      }
    },
    fuzzySearch() {
      let value = this.fuzzy.trim();
      if (value != "") {
        this.$router.push("/searchResult/" + value);
      }
    },
    cancel() {
      this.dialogFormVisible = false;
      this.$message({
        dangerouslyUseHTMLString: true,
        message: "<h1 style='color:#skyyellow;font-size:2rem;'>已取消搜索</h1>",
        center: true,
        offset: 150,
        showClose: true,
        type: "warning",
      });
    },
    sure() {
      this.dialogFormVisible = false;
      if (this.form.name.trim() == "") {
        this.form.name = "";
        this.$notify({
          type: "error",
          dangerouslyUseHTMLString: true,
          message:
            '<p style="color:red;padding:10px">搜索不能为空！请重新输入</p>',
          offset: 145,
          duration: 3000,
        });
      }
      let value = this.form.name.trim();
      if (value != "") {
        this.$router.push("/searchResult/" + value);
      }
    },
    // 用户注销
    logout() {
      this.$store.commit("logout");
    },
    toCart() {
      if (this.$store.state.isLogined == 0) {
        this.$message({
          showClose: true,
          message: "请先登录，再查看购物车！",
          type: "error",
          offset: 160,
          duration: 5000,
          onClose: () => this.$router.push("/login"),
        });
      } else {
        this.$router.push("/cart");
        this.$message({
          showClose: true,
          message: "欢迎来到购物车！",
          type: "success",
          offset: 160,
        });
      }
    },
  },
  mounted() {
    window.addEventListener("scroll", this.newScroll);
    this.now = this.moment(Date.parse(new Date())).format(`YY/MM/DD HH:mm:ss`);
    let suffix = document.getElementsByClassName("el-input__suffix")[0];
    suffix.addEventListener("click", this.fuzzySearch);
  },
  updated() {
    this.time = setTimeout(() => {
      this.now = this.moment(Date.parse(new Date())).format(
        `YY/MM/DD HH:mm:ss`
      );
    }, 1000);
  },
  beforeDestroy() {
    clearTimeout(this.time);
  },
};
</script>
