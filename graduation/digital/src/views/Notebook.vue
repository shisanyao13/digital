<template>
  <div class="note-book">
    <app-header></app-header>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadRoute">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/notebook' }"
        >笔记本</el-breadcrumb-item
      >
    </el-breadcrumb>
    <div class="per-con">
      <div
        class="peripherals-icon"
        v-for="(item, index) of noteGame"
        :key="index"
      >
        <el-image
          :src="require('../assets/images/' + item.nimg)"
          alt=""
          lazy
          @click="toProduct($event)"
        ></el-image>
        <h1>
          {{ item.ntitle }}
        </h1>
        <p v-html="`￥${item.nsale}`"></p>
      </div>
    </div>
    <div class="instruction">
      <div>
        说明：商品详情页包额外插件 ，<span @click="enhance">增强型商品属性</span
        >，需单独购买。
      </div>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
.note-book {
  display: flex;
  flex-direction: column;
}
.note-book > .breadRoute {
  background-color: #fff;
  padding: 1.5rem 3.25rem;
}
.note-book .el-breadcrumb__inner.is-link:hover {
  color: #00eef3;
  cursor: pointer;
}
.note-book > .instruction {
  background-color: #fff;
  color: #333;
  font-size: 15px;
}
.note-book > .instruction > div {
  margin: 1.5rem 0 1.5rem 3.25rem;
}
.note-book > .instruction > div > span {
  color: #00eef3;
  cursor: pointer;
}
.note-book .per-con {
  margin: 1.5rem 4.5rem 4.5rem 4.5rem;
  background: #e8e8e8;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  animation: bounceInDown 1s;
}
.note-book .per-con > .peripherals-icon {
  width: 19rem;
  height: 21rem;
  background: #fff;
  margin: 1.5rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  overflow: hidden;
  transition: 1s linear;
  text-align: center;
}
.note-book .per-con > .peripherals-icon:hover {
  box-shadow: 0 0 20px #5c6061;
  transform: translateY(-10px);
}
.note-book .per-con > .peripherals-icon img {
  transition: 1s linear;
  animation: jello 1s;
}
.note-book .per-con > .peripherals-icon img:hover {
  cursor: pointer;
  transform: scale(1.1);
}
.note-book .per-con > .peripherals-icon > h1 {
  width: 85%;
  font-size: 1.125rem;
  color: #191919;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-top: -1rem;
}
.note-book .per-con > .peripherals-icon > p {
  color: #dd3333;
  font-size: 1.125rem;
  margin-bottom: 2.5rem;
}
</style>
<script>
export default {
  data() {
    return {
      noteGame: [],
    };
  },
  methods: {
    enhance() {
      window.open(
        "https://www.qifeiye.com/%E5%95%86%E5%93%81/%e5%a2%9e%e5%bc%ba%e5%9e%8b%e5%95%86%e5%93%81%e5%b1%9e%e6%80%a7/",
        "_blank"
      );
    },
    toProduct(event) {
      event.stopPropagation();
      let path = event.target.src;
      let i = path.lastIndexOf("/");
      let str = path.slice(i + 1).trim();
      let i2 = str.indexOf(".");
      let i3 = str.lastIndexOf(".");
      let img = str.slice(i2, i3);
      img = str.replace(img, "");
      this.$router.push("/product/" + img);
    },
  },
  mounted() {
    this.axios.get("/noteGame").then((res) => {
      this.noteGame = res.data.result;
    });
  },
};
</script>
