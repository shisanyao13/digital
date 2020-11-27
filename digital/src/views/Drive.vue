<template>
  <div class="drive">
    <app-header></app-header>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadRoute">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/drive' }">驱动下载</el-breadcrumb-item>
    </el-breadcrumb>
    <div class="drive-content">
      <div class="dricont1">
        <div class="mainBoard">
          <span>
            主板驱动
          </span>
          <ul>
            <li v-for="(item, index) of mainBoard" :key="index">{{ item }}</li>
          </ul>
        </div>
        <div class="networkCard">
          <span>
            网卡驱动
          </span>
          <ul>
            <li v-for="(item, index) of networkCard" :key="index">
              {{ item }}
            </li>
          </ul>
        </div>
      </div>
      <div class="dricont2">
        <div class="graphicsCard">
          <span>
            显卡驱动
          </span>
          <ul>
            <li v-for="(item, index) of graphicsCard" :key="index">
              {{ item }}
            </li>
          </ul>
        </div>
        <div class="soundCard">
          <span>
            声卡驱动
          </span>
          <ul>
            <li v-for="(item, index) of soundCard" :key="index">{{ item }}</li>
          </ul>
        </div>
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
.drive {
  display: flex;
  flex-direction: column;
}
.drive > .breadRoute {
  background-color: #fff;
  padding: 1.5rem 3.25rem;
}
.drive .el-breadcrumb__inner.is-link:hover {
  color: #00eef3;
  cursor: pointer;
}
.drive > .drive-content {
  margin: 1.5rem 4.5rem 4.5rem 4.5rem;
  background: #e8e8e8;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  animation: bounceInDown 1s;
}
.drive > .drive-content > .dricont1,
.drive > .drive-content > .dricont2 {
  margin: 1rem 0.5rem;
}
.drive > .drive-content > .dricont1 > .mainBoard,
.drive > .drive-content > .dricont1 > .networkCard,
.drive > .drive-content > .dricont2 > .graphicsCard,
.drive > .drive-content > .dricont2 > .soundCard {
  margin-bottom: 1rem;
  background-color: #fff;
  padding: 1rem 5rem 2rem 2rem;
}
.drive > .drive-content > .dricont1 > .mainBoard > span,
.drive > .drive-content > .dricont1 > .networkCard > span,
.drive > .drive-content > .dricont2 > .graphicsCard > span,
.drive > .drive-content > .dricont2 > .soundCard > span {
  display: inline-block;
  font-size: 20px;
  color: #000;
  padding: 0.5rem 0 0rem 0;
  transition: 0.5s;
}
.drive > .drive-content > .dricont1 > .mainBoard > span:hover,
.drive > .drive-content > .dricont1 > .networkCard > span:hover,
.drive > .drive-content > .dricont2 > .graphicsCard > span:hover,
.drive > .drive-content > .dricont2 > .soundCard > span:hover {
  cursor: pointer;
  color: #00eef3;
}
.drive > .drive-content ul {
  margin-top: 1rem;
  font-size: 14px;
  border-top: 1px solid #e8e8e8;
}
.drive > .drive-content ul > li {
  list-style: disc;
  margin-left: 1rem;
  margin-top: 1rem;
  transition: 1s linear;
}
.drive > .drive-content ul > li:hover {
  font-size: 1rem;
  color: #000;
  text-shadow: 0px 0px 5px #00eff3;
  cursor: pointer;
}
.drive > .instruction {
  background-color: #fff;
  color: #333;
  font-size: 15px;
}
.drive > .instruction > div {
  margin: 1.5rem 0 1.5rem 3.25rem;
}
.drive > .instruction > div > span {
  color: #00eef3;
  cursor: pointer;
}
</style>
<script>
export default {
  data() {
    return {
      mainBoard: [
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 64bit v2017.11.15.95",
        "万能显卡驱动 for win7 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
        "万能显卡驱动 for winXP 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 64bit v2017.11.15.95",
        "万能显卡驱动 for win7 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
      ],
      networkCard: [
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 64bit v2017.11.15.95",
        "万能显卡驱动 for win7 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
        "万能显卡驱动 for winXP 32bit v2017.11.15.955",
      ],
      graphicsCard: [
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
        "万能显卡驱动 for winXP 32bit v2017.11.15.955",
      ],
      soundCard: [
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 32bit v2017.11.15.955",
        "万能显卡驱动 for win10 64bit v2017.11.15.95",
        "万能显卡驱动 for win7 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
        "万能显卡驱动 for winXP 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
        "万能显卡驱动 for winXP 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 32bit v2017.11.15.955",
        "万能显卡驱动 for win7 64bit v2017.11.15.955",
      ],
    };
  },
  methods: {
    enhance() {
      window.open(
        "https://www.qifeiye.com/%E5%95%86%E5%93%81/%e5%a2%9e%e5%bc%ba%e5%9e%8b%e5%95%86%e5%93%81%e5%b1%9e%e6%80%a7/",
        "_blank"
      );
    },
  },
};
</script>
