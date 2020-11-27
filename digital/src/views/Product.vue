<template>
  <div class="product" v-if="detailResult.result">
    <app-header></app-header>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadRoute">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: `${detailResult.result.route}` }">{{
        detailResult.result.classify
      }}</el-breadcrumb-item>
      <el-breadcrumb-item>{{ detailResult.result.title }}</el-breadcrumb-item>
    </el-breadcrumb>
    <div class="pro-notebook">
      <div class="glass">
        <div
          id="cover"
          @mouseenter="enterHandler()"
          @mouseleave="outHandler()"
          @mousemove="moveHandler($event)"
        ></div>
        <div id="shadow" v-show="topShow" :style="topStyle"></div>
        <el-image
          id="small"
          :src="require('../assets/images/' + detailResult.result.img)"
          alt=""
          lazy
        >
        </el-image>
        <div id="small-list" @click="togglePic($event)">
          <el-image
            :src="require('../assets/images/' + detailResult.result.img)"
            alt=""
            lazy
          ></el-image>
          <el-image
            :src="require('../assets/images/sw2.jpg')"
            alt=""
            lazy
          ></el-image>
          <el-image
            :src="require('../assets/images/sw3.webp')"
            alt=""
            lazy
          ></el-image>
          <el-image
            :src="require('../assets/images/sw4.jpg')"
            alt=""
            lazy
          ></el-image>
          <el-image
            :src="require('../assets/images/sw5.jpg')"
            alt=""
            lazy
          ></el-image>
        </div>
      </div>
      <div v-show="rShow" class="mask">
        <img
          :src="require('../assets/images/' + detailResult.result.img)"
          id="big"
          :style="r_img"
          alt=""
        />
      </div>
      <div class="pro_det">
        <h1>
          {{ detailResult.result.title }}
        </h1>
        <p>
          {{ detailResult.result.config }}
        </p>
        <span v-html="`￥${detailResult.result.sale}`"></span>
        <div class="package_check" v-if="detailResult.result.label">
          <p>搭配套餐</p>
          <el-checkbox-group v-model="checkedProduction">
            <el-checkbox
              v-for="(item, index) of packages"
              :key="index"
              :label="item.price"
              @change="packagePrice($event, item.price)"
              >{{ item.detail }}</el-checkbox
            >
          </el-checkbox-group>
          <div v-show="packageChecked" class="isCheched">
            <p>选项累计：<span v-html="`¥${packageTotal}`"></span></p>
            <p>全部总计：<span v-html="`¥${productTotal}`"></span></p>
          </div>
        </div>
        <div class="jion_card">
          <button class="card_btn" @click="jioncart()">加入购物车</button>
          <el-input-number
            v-model="num"
            :min="1"
            label="商品数量"
          ></el-input-number>
        </div>
        <div class="prolist_info">
          <ul>
            <li v-if="detailResult.result.number">
              商品编号：{{ detailResult.result.number }}
            </li>
            <li>
              分类：<router-link :to="detailResult.result.route">{{
                detailResult.result.classify
              }}</router-link>
            </li>
            <li v-if="detailResult.result.label">
              标签：<router-link to="/notebook">{{
                detailResult.result.label
              }}</router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
.product {
  background-color: #fff;
}
.product > .breadRoute {
  background-color: #e8e8e8;
  padding: 1.5rem 3.25rem;
}
.product .el-breadcrumb__inner.is-link:hover {
  color: #00eef3;
}
.product > .pro-notebook {
  margin: 3rem 1rem;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: flex-start;
  animation: bounceInDown 1s;
  position: relative;
}
.product > .pro-notebook > .glass {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
  position: relative;
  width: 38.875rem;
  height: 25.875rem;
}
.product > .pro-notebook #small-list {
  display: flex;
  width: 37.5rem;
  flex-wrap: nowrap;
  align-items: center;
  overflow: hidden;
}
.product > .pro-notebook #small-list img {
  width: 7.5rem;
  height: 5rem;
  animation: jello 1s;
}
.product > .pro-notebook #small-list img:hover {
  cursor: pointer;
}
.product .pro_det > h1 {
  font-size: 26px;
  font-weight: bold;
  color: rgb(51, 51, 51);
  margin-bottom: 1.5625rem;
  padding-bottom: 1.5625rem;
  border-bottom: 5px solid #e6e6e6;
}
.product .pro_det > p {
  font-size: 15px;
  color: rgb(97, 97, 97);
  line-height: 18px;
}
.product .pro_det > span {
  font-size: 26px;
  line-height: 26px;
  font-weight: bold;
  color: #dd3333;
  font-family: tahoma;
  margin: 1.5625rem 0;
  display: inline-block;
}
.product .package_check > p {
  font-size: 15px;
  font-weight: bold;
  color: #555555;
  margin-bottom: 0.75rem;
}
.product .package_check .el-checkbox:first-child ~ .el-checkbox {
  margin-top: 1rem;
}
.product .isCheched {
  margin-top: 2rem;
  color: #666;
  font-size: 1.25rem;
}
.product .isCheched > p {
  margin-bottom: 1rem;
}
.product .isCheched > p > span {
  padding-left: 4rem;
  color: #dd3333;
  font-size: 1.625rem;
  font-weight: bold;
  line-height: 1.625rem;
}
.product .jion_card {
  margin-top: 1.5rem;
}
.product .jion_card > .card_btn {
  font-size: 15px;
  color: #000000;
  border: 1px solid #00eef3;
  border-radius: 4px;
  background-color: #00eef3;
  padding: 0.875rem 2.5rem;
  margin-right: 1rem;
}
.el-input-number__decrease:hover:not(.is-disabled)
  ~ .el-input
  .el-input__inner:not(.is-disabled),
.el-input-number__increase:hover:not(.is-disabled)
  ~ .el-input
  .el-input__inner:not(.is-disabled) {
  border-color: #dcdfe6;
}
.el-input-number__decrease:hover,
.el-input-number__increase:hover {
  color: #00eef3;
}
.product .prolist_info {
  margin-top: 1.75rem;
}
.product .prolist_info > ul > li {
  border-top: 1px solid #e8e8e8;
  padding: 0.5rem 0;
}
.product .prolist_info > ul > li > a {
  color: #dd3333;
}
/* 放大镜样式 */
.product > .pro-notebook .glass > .elmage {
  width: 38.875rem;
  height: 25.875rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.product > .pro-notebook #small {
  width: 18.875rem;
  height: 13.875rem;
  animation: jello 1s;
}
#shadow {
  width: 90px;
  height: 90px;
  background-color: #fff;
  opacity: 0.4;
  border: 1px solid rgb(204, 204, 204);
  position: absolute;
  z-index: 50;
  top: 0px;
  left: 0px;
}
#cover {
  width: 100%;
  height: 70%;
  z-index: 60;
  position: absolute;
  left: 0px;
  top: 0px;
}
.product .pro_det {
  width: 31.25rem;
  margin-top: 3.5rem;
}
.product .mask {
  width: 28.125rem;
  height: 28.125rem;
  overflow: hidden;
  border: 1px solid #e8e8e8;
  z-index: 50;
  background-color: #fff;
  position: relative;
}
.product .mask > #big {
  position: absolute;
  top: 150px;
  left: 250px;
  width: 400px;
  height: 300px;
}
</style>
<script>
export default {
  data() {
    return {
      num: 1,
      checkedProduction: [],
      detailResult: {},
      packages: [
        { detail: "M301炫彩鼠标原价159元 (¥99)", price: 99 },
        { detail: "K70红轴机械键盘原价299 (¥240)", price: 240 },
        { detail: "K80樱桃茶轴键盘原价499 (¥399)", price: 399 },
        { detail: "27英寸电竞显示器原价1699元 (¥1499)", price: 1499 },
        { detail: "沙漠风暴H71耳机黑色原价499 (¥349)", price: 349 },
      ],
      packageChecked: false,
      packageTotal: 0,
      productTotal: 0,
      topStyle: { transform: "" },
      r_img: { transform: "" },
      topShow: false,
      rShow: false,
    };
  },
  created() {
    //接收传入的数据
    this.detail();
  },
  // mounted() {
  //   //接收传入的数据
  //   this.detail();
  // },
  methods: {
    detail() {
      let img = this.$route.params.img;
      //this.axios.get("/product?img=" + img).then((res) => {
      this.axios.get(`/product/${img}`).then((res) => {
        this.detailResult = res.data;
      });
    },
    //替换图片
    togglePic(event) {
      event.stopPropagation();
      let epath = event.target.src;
      let i = epath.lastIndexOf("/");
      let str = epath.slice(i + 1).trim();
      let i2 = str.indexOf(".");
      let i3 = str.lastIndexOf(".");
      let imgName = str.slice(i2, i3);
      imgName = str.replace(imgName, "");
      //小的图片列表
      let replaceImg = document.querySelector("#small");
      replaceImg.setAttribute("src", require("../assets/images/" + imgName));
      //放大镜的图片
      let emptyImg = document.querySelector("#big");
      emptyImg.setAttribute("src", require("../assets/images/" + imgName));
    },
    //商品单价计算
    packagePrice(value) {
      event.stopPropagation;
      this.packageChecked = true;
      let countPrice = this.detailResult.result.sale * this.num;
      if (value) {
        this.packageTotal += event.target.value * 1;
        this.productTotal = this.packageTotal + countPrice;
      } else {
        this.packageTotal += event.target.value * -1;
        this.productTotal += event.target.value * -1;
      }
    },
    //添加商品至购物车
    jioncart() {
      let obj = {
        username: this.$store.state.uname,
        count: this.num,
        price:
          this.detailResult.result.label == ""
            ? this.detailResult.result.sale
            : this.packageTotal + this.detailResult.result.sale,
        subtitle: this.detailResult.result.title,
        img: this.detailResult.result.img,
      };
      if (this.$store.state.isLogined == 0) {
        this.$message({
          showClose: true,
          message: "请先登录，再添加至购物车！",
          type: "error",
          offset: 160,
          duration: 5000,
          onClose: () => this.$router.push("/login"),
        });
      } else {
        this.axios.post("/enterCart", this.qs.stringify(obj)).then((res) => {
          if (res.data.code == 1) {
            this.$alert("添加成功！", "提示", {
              confirmButtonText: "确定",
              type: "success",
            });
          }
        });
      }
    },
    //放大镜
    enterHandler() {
      // 层罩及放大空间的显示
      this.topShow = true;
      this.rShow = true;
    },
    // 鼠标移动函数
    moveHandler(event) {
      // 鼠标的坐标位置
      let x = event.offsetX - 45;
      let y = event.offsetY - 45;
      // 对层罩位置再一次限制，保证层罩只能在原图区域空间内
      if (x >= 400) x = 400;
      if (x <= 100) x = 100;
      if (y >= 160) y = 160;
      if (y <= 0) y = 0;
      // 通过 transform 进行移动控制
      this.topStyle.transform = `translate(${x}px,${y}px)`;
      this.r_img.transform = `translate(-${1 * x}px,-${1 * y}px) scale(1.5)`;
    },
    // 鼠标移出函数
    outHandler() {
      // 控制层罩与放大空间的隐藏
      this.topShow = false;
      this.rShow = false;
    },
  },
  watch: {
    //监听商品数量的变化
    num() {
      let countPrice = this.detailResult.result.sale * this.num;
      this.productTotal = this.packageTotal + countPrice;
    },
  },
};
</script>
