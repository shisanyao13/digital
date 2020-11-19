<template>
  <div class="asscss-ment" v-loading.fullscreen.lock="fullscreenLoading">
    <app-header></app-header>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadRoute">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/assessment' }"
        >评测中心</el-breadcrumb-item
      >
    </el-breadcrumb>
    <el-tabs :tab-position="tabPosition">
      <el-tab-pane label="全部资讯">
        <div class="moreInfo">
          <ul>
            <li
              class="asscss-icon"
              v-for="(item, index) of measurement"
              :key="index"
            >
              <el-image
                :src="require('../assets/images/' + item.limg)"
                alt=""
                lazy
              ></el-image>
              <div class="asscss-detail">
                <h5>{{ item.ltitle }}</h5>
                <h6>发布日期：{{ item.ltime }}</h6>
                <p>
                  {{ item.lcontent }}
                </p>
              </div>
            </li>
          </ul>
          <button @click="searchAll" v-show="loaded">查看更多</button>
        </div>
      </el-tab-pane>
      <el-tab-pane label="技术分析">
        <div>
          <ul>
            <li
              class="asscss-icon"
              v-for="(item, index) of analysis"
              :key="index"
            >
              <el-image
                :src="require('../assets/images/' + item.limg)"
                alt=""
                lazy
              ></el-image>
              <div class="asscss-detail">
                <h5>{{ item.ltitle }}</h5>
                <h6>发布日期：{{ item.ltime }}</h6>
                <p>
                  {{ item.lcontent }}
                </p>
              </div>
            </li>
          </ul>
        </div>
      </el-tab-pane>
      <el-tab-pane label="行业新闻">
        <div>
          <ul>
            <li class="asscss-icon" v-for="(item, index) of news" :key="index">
              <el-image
                :src="require('../assets/images/' + item.limg)"
                alt=""
                lazy
              ></el-image>
              <div class="asscss-detail">
                <h5>{{ item.ltitle }}</h5>
                <h6>发布日期：{{ item.ltime }}</h6>
                <p>
                  {{ item.lcontent }}
                </p>
              </div>
            </li>
          </ul>
        </div>
      </el-tab-pane>
    </el-tabs>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
.asscss-ment {
  display: flex;
  flex-direction: column;
}
.asscss-ment > .breadRoute {
  background-color: #fff;
  padding: 1.5rem 3.25rem;
}
.asscss-ment .el-breadcrumb__inner.is-link:hover {
  color: #00eef3;
  cursor: pointer;
}
/* 侧边栏导航卡 */
.el-tabs--left {
  margin: 2rem 1.5rem 4rem 1.5rem;
  animation: bounceInDown 1s;
}
.el-tabs--left .el-tabs__header {
  background-color: #fff;
}
.el-tabs--left .el-tabs__header.is-left {
  margin: 0;
}
.el-tabs__item:hover,
.el-tabs__item.is-active {
  color: #00eef3;
}
.el-tabs__active-bar {
  background-color: #00eef3;
}
#pane-0,
#pane-1,
#pane-2 {
  margin-left: 3.125rem;
  margin-right: 1.5rem;
}
.asscss-ment .asscss-icon {
  display: flex;
  background-color: #fff;
  padding: 0.5rem;
  margin-bottom: 0.75rem;
  flex-wrap: wrap;
}
.asscss-ment .asscss-icon img {
  width: 12.5rem;
  height: 8.125rem;
  margin-bottom: 1rem;
  transition: 1s;
  animation: jello 1s;
}
.asscss-ment .asscss-icon img:hover {
  cursor: pointer;
  transform: scale(1.1);
}
.asscss-ment .asscss-icon > .asscss-detail {
  display: flex;
  flex-direction: column;
  margin-left: 1rem;
  transition: 1s linear;
}
.asscss-ment .asscss-icon > .asscss-detail:hover {
  margin-left: 3rem;
}
.asscss-ment .asscss-icon > .asscss-detail > h5 {
  color: #333333;
  font-size: 16px;
  line-height: 16px;
}
.asscss-ment .asscss-icon > .asscss-detail > h5:hover {
  cursor: pointer;
  color: #00eef3;
}
.asscss-ment .asscss-icon > .asscss-detail > h6 {
  padding: 15px 0 10px 0;
  color: #bfbfbf;
  font-size: 12px;
  line-height: 12px;
}
.asscss-ment .asscss-icon > .asscss-detail > p {
  color: #999999;
  font-size: 12px;
  line-height: 22px;
  padding-right: 15px;
}
.asscss-ment .moreInfo {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.asscss-ment .moreInfo > button {
  display: block;
  margin: 1rem;
  font-size: 18px;
  border-radius: 4px;
  border: 1px solid #666;
  padding: 1rem 2rem;
  background-color: transparent;
}
.asscss-ment .moreInfo > button:hover {
  color: #000;
  border: 1px solid #00eef3;
  background-color: #00eef3;
}
</style>
<script>
export default {
  data() {
    return {
      tabPosition: "left",
      measurement: [],
      analysis: [],
      news: [],
      loaded: true,
      fullscreenLoading: false,
    };
  },
  mounted() {
    this.axios.get("/measureFourth").then((res) => {
      this.measurement = res.data.result;
    });
    this.technology("技术分析");
    this.Industry("行业新闻");
  },
  methods: {
    class(classify) {
      return this.axios
        .get("/measure?classify=" + classify)
        .then((res) => res.data);
    },
    async Industry(value) {
      let data = await this.class(value);
      this.news = data.result;
    },
    async technology(value) {
      let data = await this.class(value);
      this.analysis = data.result;
    },
    searchAll() {
      const loading = this.$loading({
        lock: true,
        text: "加载中...",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.axios.get("/measureMent").then((res) => {
        this.measurement = res.data.result;
        loading.close();
      });
      this.loaded = false;
    },
  },
};
</script>
