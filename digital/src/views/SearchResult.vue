<template>
  <div class="searchResult">
    <app-header></app-header>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadRoute">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/searchResult/游戏笔记本' }"
        >搜索结果页面</el-breadcrumb-item
      >
    </el-breadcrumb>
    <div class="result-content">
      <div
        class="result-icon"
        v-for="(item, index) of searchResult.result"
        :key="index"
        v-show="!showNone"
      >
        <el-image
          :src="require('../assets/images/' + item.img.trim())"
          alt=""
          lazy
          @click="toProduct($event)"
        ></el-image>
        <h1>{{ item.title }}</h1>
        <h3>
          {{ item.config }}
        </h3>
        <p v-html="`￥${item.sale}`"></p>
      </div>
      <h1 v-show="showNone" class="hidden-sm-and-down">
        {{ searchResult.message }}
      </h1>
      <h3 v-show="showNone" class="hidden-md-and-up">
        {{ searchResult.message }}
      </h3>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
.searchResult {
  display: flex;
  flex-direction: column;
}
.searchResult > .breadRoute {
  background-color: #fff;
  padding: 1.5rem 3.25rem;
}
.searchResult .el-breadcrumb__inner.is-link:hover {
  color: #00eef3;
  cursor: pointer;
}
.searchResult > .result-content {
  margin: 2rem 3rem 6rem 3rem;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  animation: bounceInDown 1s;
}
.searchResult > .result-content > h1 {
  font-size: 3rem;
  color: #191919;
  margin-top: 5rem;
}
.searchResult > .result-content > h3 {
  font-size: 1.5rem;
  color: #191919;
  margin-top: 5rem;
}
.searchResult > .result-content > .result-icon {
  width: 17.5rem;
  height: 18.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #fff;
  overflow: hidden;
  transition: 1s linear;
  margin: 1rem;
}
.searchResult > .result-content > .result-icon:hover {
  box-shadow: 0 0 20px #5c6061;
  transform: translateY(-10px);
}
.searchResult > .result-content > .result-icon img {
  padding: 0.5rem 0;
  transition: 1s linear;
  animation: jello 1s;
}
.searchResult > .result-content > .result-icon img:hover {
  cursor: pointer;
  transform: scale(1.1);
}
.searchResult > .result-content > .result-icon > h1 {
  color: #191919;
  font-size: 1rem;
  margin: 1rem;
  padding-bottom: 3px;
  width: 85%;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.searchResult > .result-content > .result-icon > h1:hover {
  cursor: pointer;
}
.searchResult > .result-content > .result-icon > h3 {
  color: #ccc;
  font-size: 0.625rem;
  margin-bottom: 1rem;
  width: 75%;
  padding-bottom: 3px;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.searchResult > .result-content > .result-icon > p {
  color: #dd3333;
  font-size: 18px;
  margin-bottom: 1rem;
}
</style>
<script>
export default {
  data() {
    return {
      searchResult: { message: "没有符合条件的结果。" },
      showNone: false,
      switch: true,
    };
  },
  methods: {
    search() {
      let value = this.$route.params.consequence;
      this.axios.get("/fuzzy?value=" + value).then((res) => {
        if (res.data.code == 1) this.showNone = false;
        else this.showNone = true;
        this.searchResult = res.data;
      });
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
    this.search();
  },
  //每隔1s才能在SearchResult页面再次搜索
  updated() {
    this.time = setTimeout(() => {
      this.search();
    }, 1000);
  },
  beforeDestroy() {
    clearTimeout(this.time);
  },
};
</script>
