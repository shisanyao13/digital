<template>
  <div class="home" v-loading.fullscreen.lock="fullscreenLoading">
    <app-header></app-header>
    <div class="homeSwiper">
      <ul class="hidden-sm-and-down">
        <li>
          <p>全部分类</p>
          <span></span>
        </li>
        <li><router-link to="/notebook">游戏笔记本</router-link></li>
        <li><router-link to="/desktop">游戏台式机</router-link></li>
        <li><router-link to="/office">办公电脑</router-link></li>
        <li><router-link to="/Peripherals">游戏鼠键/耳机</router-link></li>
        <li><router-link to="/camera">高清摄像头</router-link></li>
        <li><router-link to="/vr">VR专区</router-link></li>
        <li><router-link to="/drive">驱动下载</router-link></li>
        <li><router-link to="/afterservice">保修政策</router-link></li>
      </ul>
      <div class="swiperFade hidden-sm-and-down">
        <img src="../assets/images/swiper02.webp" class="fadeIn" />
        <img src="../assets/images/swiper01.webp" class="fadeOut" />
      </div>
      <div class="swiperFade hidden-md-and-up">
        <img src="../assets/images/swiper02.webp" class="fadeIn" />
        <img src="../assets/images/swiper01.webp" class="fadeOut" />
      </div>
    </div>
    <div class="floor1">
      <el-row class="floor1-icon  hidden-sm-and-down">
        <el-col :md="10" :lg="10" :xl="10">
          <img src="../assets/images/yjhx.webp" alt="" />
          <router-link to="/">以旧换新</router-link>
        </el-col>
        <el-col :md="10" :lg="10" :xl="10">
          <img src="../assets/images/qdxz.webp" alt="" />
          <router-link to="/">驱动下载</router-link>
        </el-col>
        <el-col :md="10" :lg="10" :xl="10">
          <img src="../assets/images/pczx.webp" alt="" />
          <router-link to="/assessment">评测中心</router-link>
        </el-col>
        <el-col :md="10" :lg="10" :xl="10">
          <img src="../assets/images/shfw.webp" alt="" />
          <router-link to="/">售后服务</router-link>
        </el-col>
      </el-row>
      <img src="../assets/images/yxtszj.webp" alt="" v-show="show1" />
      <img src="../assets/images/ckyxbjb.webp" alt="" v-show="show1" />
      <img src="../assets/images/snyxej.webp" alt="" v-show="show1" />
    </div>
    <div class="floor2">
      <p v-show="show2">精选单品推荐</p>
      <div class="floorow">
        <div
          v-for="(item, i) of recomItem"
          :key="i"
          class="floor2-icon"
          v-show="show2"
        >
          <el-image
            :src="require('../assets/images/' + item.rimg)"
            alt=""
            lazy
            @click="toProduct($event)"
          ></el-image>
          <p class="pro_title">
            {{ item.rtitle }}
          </p>
          <p class="pro_detail">
            {{ item.rconfig }}
          </p>
        </div>
      </div>
    </div>
    <div class="floor3">
      <div class="bookRoute" v-show="show3">
        <router-link to="/notebook">笔记本/游戏本</router-link>
        <router-link to="/notebook">MORE+</router-link>
      </div>
      <div class="gamecrazy">
        <div class="gamenote hidden-md-and-down" v-show="show3">
          <img src="../assets/images/tsjsyxk.webp" alt="" />
        </div>
        <div class="notebook">
          <div
            class="notebook-icon"
            v-for="(item, i) of noteGame"
            :key="i"
            v-show="show3"
            @click="routeNote()"
          >
            <el-image
              :src="require('../assets/images/' + item.nimg)"
              alt=""
              lazy
              @click="toProduct($event)"
            ></el-image>
            <p class="pro_title">{{ item.ntitle }}</p>
            <p class="pro_detail">
              {{ item.nconfig }}
            </p>
            <p class="pro_price" v-html="`￥${item.nsale}`"></p>
          </div>
        </div>
      </div>
    </div>
    <div class="floor4">
      <div class="bookRoute" v-show="show4">
        <router-link to="/desktop">台式机/一体机</router-link>
        <router-link to="/desktop">MORE+</router-link>
      </div>
      <div class="gamecrazy">
        <div class="gamenote hidden-md-and-down" v-show="show4">
          <img src="../assets/images/cxdyyxb.webp" alt="" />
        </div>
        <div class="notebook">
          <div
            class="notebook-icon"
            v-for="(item, i) of deskTop"
            :key="i"
            v-show="show4"
          >
            <el-image
              :src="require('../assets/images/' + item.dimg)"
              alt=""
              lazy
              @click="toProduct($event)"
            ></el-image>
            <p class="pro_title">{{ item.dtitle }}</p>
            <p class="pro_detail">
              {{ item.dconfig }}
            </p>
            <p class="pro_price" v-html="`￥${item.dsale}`"></p>
          </div>
        </div>
      </div>
    </div>
    <div class="floor5">
      <div class="bookRoute" v-show="show5">
        <router-link to="/peripherals">外设系列</router-link>
        <div class="hardware">
          <p @click="mouse">鼠标</p>
          <p @click="keyboard">键盘</p>
          <p @click="camera">摄像头</p>
        </div>
      </div>
      <div class="gamecrazy">
        <div class="gamenote hidden-md-and-down" v-show="show5">
          <img src="../assets/images/wsjp.webp" alt="" />
          <img src="../assets/images/sjyxjp.webp" alt="" />
        </div>
        <div class="notebook">
          <div
            class="notebook-icon"
            v-for="(item, i) of peripheralsSeries"
            :key="i"
            v-show="show5"
          >
            <el-image
              :src="require('../assets/images/' + item.pimg)"
              alt=""
              lazy
              @click="toProduct($event)"
            ></el-image>
            <p class="pro_title">
              {{ item.ptitle }}
            </p>
            <p class="pro_detail">
              {{ item.pconfig }}
            </p>
            <p class="pro_price" v-html="`￥${item.psale}`"></p>
          </div>
        </div>
      </div>
    </div>
    <div class="floor6">
      <div class="bookRoute" v-show="show6">
        <router-link to="/">热评产品</router-link>
      </div>
      <div class="notebook">
        <div
          class="notebook-icon"
          v-for="(item, i) of buzz"
          :key="i"
          v-show="show6"
          @click="toProduct($event)"
        >
          <el-image
            :src="require('../assets/images/' + item.bimg)"
            alt=""
            lazy
          ></el-image>
          <p class="pro_title">
            {{ item.btitle }}
          </p>
          <p class="pro_detail">
            {{ item.bconfig }}
          </p>
          <p class="pro_price" v-html="`￥${item.bsale}`"></p>
        </div>
      </div>
    </div>
    <div class="floor7">
      <div class="bookRoute" v-show="show7">
        <router-link to="/assessment">评测中心</router-link>
        <router-link to="/assessment">MORE+</router-link>
      </div>
      <div class="assess">
        <div
          class="assess-icon"
          v-for="(item, i) of assessMent"
          :key="i"
          v-show="show7"
        >
          <el-image
            :src="require('../assets/images/' + item.aimg)"
            alt=""
            lazy
          ></el-image>
          <p class="assess_title">
            {{ item.atitle }}
          </p>
          <p class="assess_content">
            {{ item.acontent }}
          </p>
        </div>
      </div>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
.home .homeSwiper {
  animation: bounceInDown 1s;
}
.home .homeSwiper > ul {
  width: 20%;
  height: 29.72875rem;
  font-size: 0.9375rem;
  background-color: #252525;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  text-align: center;
  box-sizing: border-box;
  position: absolute;
  top: 50;
  margin-left: 3.125rem;
  z-index: 10;
}
.home .homeSwiper > ul > li {
  height: 3.303194rem;
  line-height: 3.303194rem;
  width: 100%;
}
.home .homeSwiper > ul > li > a {
  text-decoration: none;
  color: #ccc;
  display: inline-block;
}
.home .homeSwiper > ul > li > a:focus {
  outline: none;
}
.home .homeSwiper > ul > li > a:hover {
  color: white;
}
.home .homeSwiper > ul > li:first-child {
  background-color: #00eef3;
  color: #333;
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 0 1.25rem;
  box-sizing: border-box;
}
.home .homeSwiper > ul > li:first-child > p {
  text-align: center;
}
.home .homeSwiper > ul > li:first-child > span {
  width: 0;
  height: 0;
  border-width: 10px;
  border-style: solid;
  border-color: #3a3a3a transparent transparent transparent;
  margin-top: 0.375rem;
}
.home .homeSwiper > ul > li:first-child > span:hover {
  border-color: #0a0a0a transparent transparent transparent;
}
.home .homeSwiper > ul > li + li {
  border-top: 1px solid #3a3a3a;
}
.home .homeSwiper > ul > li + li:hover {
  background-color: #3a3a3a;
}
.home .swiperFade {
  position: relative;
}
.home .swiperFade.hidden-sm-and-down > img {
  width: 100%;
  height: 29.72875rem;
}
.home .swiperFade.hidden-md-and-up > img {
  width: 100%;
}
.home .swiperFade > .fadeIn {
  -webkit-animation: fadeIn 3s infinite alternate;
  -ms-animation: fadeIn 3s infinite alternate;
  -moz-animation: fadeIn 3s infinite alternate;
  -o-animation: fadeIn 3s infinite alternate;
  animation: fadeIn 3s 3s infinite alternate;
}
.home .swiperFade > .fadeOut {
  -webkit-animation: fadeOut 3s infinite alternate;
  -ms-animation: fadeOut 3s infinite alternate;
  -moz-animation: fadeOut 3s infinite alternate;
  -o-animation: fadeOut 3s infinite alternate;
  animation: fadeOut 3s 3s infinite alternate;
  position: absolute;
  top: 0;
  left: 0;
}
.home .floor1 {
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding-top: 1.25rem;
  padding-bottom: 3.75rem;
  font-size: 0.75rem;
  animation: bounceInDown 1s;
}
.home .floor1 > .floor1-icon {
  width: 20%;
  height: 8rem;
  background-color: #00eef3;
}
.home .floor1 > .floor1-icon > div {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.home .floor1 > .floor1-icon > div a {
  text-decoration: none;
  color: #000;
  display: block;
  padding-top: 0.3125rem;
}
.home .floor1 > .floor1-icon > div a:focus {
  outline: none;
}
.home .floor1 > .floor1-icon > div:first-child {
  border-bottom: 1px solid #000;
  border-right: 1px solid #000;
  margin-top: 0.7rem;
  margin-left: 1.35rem;
}
.home .floor1 > .floor1-icon > div:nth-child(2) {
  border-bottom: 1px solid #000;
  border-left: 1px solid #000;
  margin-top: 0.7rem;
}
.home .floor1 > .floor1-icon > div:nth-child(3) {
  border-top: 1px solid #000;
  border-right: 1px solid #000;
  padding-top: 0.7rem;
  margin-left: 1.35rem;
}
.home .floor1 > .floor1-icon > div:last-child {
  border-top: 1px solid #000;
  border-left: 1px solid #000;
  padding-top: 0.7rem;
}
.home .floor1 > .floor1-icon > div:first-child > a,
.home .floor1 > .floor1-icon > div:nth-child(2) > a {
  margin-bottom: 0.7rem;
}
.home .floor1 > img {
  width: 20%;
  animation: fadeInUp 1s;
}
.home .floor1,
.home .floor2 {
  background-color: #fff;
}
.home .floor2 > p {
  font-size: 22px;
  font-weight: normal;
  font-style: normal;
  color: #333333;
  padding: 5px 10px 5px 0;
  margin-left: 3.75rem;
  animation: fadeInDown 1s;
}
.home .floor2 .floorow {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  margin-left: 1.25rem;
  margin-right: 1.25rem;
  box-sizing: border-box;
}
.home .floor2 .floor2-icon {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  border: 1px solid rgba(255, 203, 107, 0.5);
  margin: 1.25rem 0 3rem 0;
  background-color: rgba(255, 255, 255, 1);
  font-family: 微软雅黑;
  text-align: center;
  width: 15rem;
  height: 15.375rem;
  overflow: hidden;
  animation: fadeInUp 1s;
}
.home .floor2 .floor2-icon img {
  width: 14.628125rem;
  height: 10.056875rem;
  cursor: pointer;
  transition: 1s;
  animation: jello 1s;
}
.home .floor2 .floor2-icon img:hover {
  transform: scale(1.1);
}
.home .floor2 .floor2-icon > .pro_title {
  width: 12rem;
  color: #000000;
  font-size: 15px;
  font-weight: normal;
  margin: 0.9375rem 0.625rem 0.3125rem 0.625rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  box-sizing: border-box;
}
.home .floor2 .floor2-icon > .pro_detail {
  width: 9rem;
  color: #999;
  font-size: 12px;
  line-height: 26px;
  margin-top: 0.5rem;
  margin-bottom: 0.75rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
/* floor2,floor3整体布局 */
.home .bookRoute {
  display: flex;
  justify-content: space-between;
  margin: 3.125rem 3.75rem 3rem 3.75rem;
}
.home .bookRoute > a {
  font-size: 22px;
  font-weight: normal;
  font-style: normal;
  color: #333333;
  padding: 5px 10px 5px 0;
  animation: slideInUp 1s;
}
.home .gamecrazy {
  display: flex;
  justify-content: space-between;
  margin: 1.25rem;
}
.home .gamecrazy > .gamenote img {
  width: 28.375rem;
  height: 37.8125rem;
  animation: slideInLeft 1s linear;
}
.home .gamecrazy > .notebook {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
}
/* 单一产品整体样式 */
.home .notebook-icon {
  width: 15rem;
  height: 17rem;
  overflow: hidden;
  animation: fadeInUp 1s;
  background-color: #fff;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  align-items: center;
  margin: 1rem 0.5rem;
  transition: all 0.3s ease-out 0s;
}
.home .notebook-icon::before {
  content: "";
  display: table;
}
.home .notebook-icon:hover {
  box-shadow: 0 0 20px #5c6061;
  transform: translateY(-10px);
}
.home .notebook-icon img {
  width: 14.628125rem;
  height: 10.056875rem;
  cursor: pointer;
  transition: 1s;
  animation: jello 1s;
}
.home .notebook-icon img:hover {
  transform: scale(1.1);
}
.home .notebook-icon > .pro_title {
  width: 13rem;
  color: #191919;
  font-size: 15px;
  font-family: 微软雅黑;
  margin-top: 0.75rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  cursor: pointer;
}
.home .notebook-icon > .pro_detail {
  width: 9.6rem;
  color: #999;
  font-size: 12px;
  line-height: 26px;
  margin-top: 0.5rem;
  margin-bottom: 0.75rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.home .notebook-icon > .pro_price {
  color: #00eef3;
  font-size: 15px;
}
.home .floor3 .notebook,
.home .floor4 .notebook {
  margin-left: 5px;
}
.home .floor4 .notebook-icon img {
  margin-top: 0.5rem;
}
.home .floor5 .hardware {
  display: flex;
}
.home .floor5 .hardware > p {
  font-size: 20px;
  color: #333333;
  margin: 5px 10px 5px 5px;
  animation: slideInUp 1s;
}
.home .floor5 .hardware > p:hover {
  cursor: pointer;
}
.home .floor5 .gamenote > img {
  width: 28.375rem;
  height: 18.4375rem;
  margin-bottom: 1rem;
  margin-right: 1rem;
}

.home .floor5 > .gamecrazy > .notebook img {
  margin-top: 0.5rem;
  margin-bottom: 0.5rem;
}
.home .floor6 > .notebook {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  margin-left: 2.5rem;
  margin-right: 2.5rem;
}
.home .floor6 > .notebook img {
  margin-top: 0.35rem;
  margin-bottom: 0.35rem;
}
.home .floor7 > .assess {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  margin: 0 2.5rem 2.5rem 2.5rem;
}
.home .floor7 > .assess > .assess-icon {
  width: 18.875rem;
  height: 21.375rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  background-color: #fff;
  margin: 1rem 0.25rem;
  transition: 0.3s ease-out;
  animation: fadeInUp 1s;
  border: 1px solid rgb(209, 205, 205);
}
.home .floor7 > .assess > .assess-icon:hover {
  box-shadow: 0 0 20px #5c6061;
  transform: translateY(-10px);
}
.home .floor7 > .assess > .assess-icon img {
  margin-top: 1rem;
  width: 12.5rem;
  height: 8.625rem;
  transition: 1s;
  animation: jello 1s;
}
.home .floor7 > .assess > .assess-icon img:hover {
  cursor: pointer;
  margin-left: 3rem;
  opacity: 0.5;
}
.home .floor7 > .assess > .assess-icon > .assess_title {
  color: #191919;
  font-size: 15px;
  width: 15.4375rem;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  margin-top: 0.5rem;
}
.home .floor7 > .assess > .assess-icon > .assess_content {
  color: #b7b7b7;
  font-size: 12px;
  line-height: 22px;
  width: 15.4375rem;
  height: 6.65125rem;
  padding: 10px 15px;
  margin-bottom: 0.75rem;
  box-sizing: border-box;
}
</style>
<script>
export default {
  data() {
    return {
      show1: false,
      show2: false,
      show3: false,
      show4: false,
      show5: false,
      show6: false,
      show7: false,
      recomItem: [],
      noteGame: [],
      deskTop: [],
      peripheralsSeries: [],
      buzz: [],
      assessMent: [],
      fullscreenLoading: false,
    };
  },
  mounted() {
    //floor第一层
    window.addEventListener("scroll", this.Scroll1);

    //floor第二层
    window.addEventListener("scroll", this.Scroll2);
    this.axios.get("/recomItem").then((res) => {
      this.recomItem = res.data.result;
    });

    //floor第三层
    window.addEventListener("scroll", this.Scroll3);
    this.axios.get("/noteGame").then((res) => {
      this.noteGame = res.data.result;
    });

    //floor第四层
    window.addEventListener("scroll", this.Scroll4);
    this.axios.get("/deskTop").then((res) => {
      this.deskTop = res.data.result;
    });

    //floor第五层
    window.addEventListener("scroll", this.Scroll5);
    this.axios.get("/peripheralsSeries").then((res) => {
      this.peripheralsSeries = res.data.result;
    });

    //floor第六层
    window.addEventListener("scroll", this.Scroll6);
    this.axios.get("/buzz").then((res) => {
      this.buzz = res.data.result;
    });

    //floor第七层
    window.addEventListener("scroll", this.Scroll7);
    this.axios.get("/assessMent").then((res) => {
      this.assessMent = res.data.result;
    });
  },
  methods: {
    // floor1时触发动画
    Scroll1() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 100) this.show1 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    // floor2时触发动画
    Scroll2() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 300) this.show2 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    // floor3时触发动画
    Scroll3() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 800) this.show3 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    // floor4时触发动画
    Scroll4() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 1600) this.show4 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    // floor5时触发动画
    Scroll5() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 2300) this.show5 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    // floor6时触发动画
    Scroll6() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 3000) this.show6 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    // floor7时触发动画
    Scroll7() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      let count = 0;
      let timer;
      if (count === 0) {
        timer = setTimeout(() => {
          if (scrollTop > 3500) this.show7 = true;
        }, 0);
        count = count + 1;
      } else {
        clearTimeout(timer);
      }
    },
    routeNote() {
      this.$router.push("/product");
    },
    //点鼠标时发送请求
    mouse() {
      const loading = this.$loading({
        lock: true,
        text: "加载中...",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.axios.get("/mouse").then((res) => {
        this.peripheralsSeries = res.data.result;
        loading.close();
      });
    },
    //点键盘时发送请求
    keyboard() {
      const loading = this.$loading({
        lock: true,
        text: "加载中...",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.axios.get("/keyboard").then((res) => {
        this.peripheralsSeries = res.data.result;
        loading.close();
      });
    },
    //点摄像头时发送请求
    camera() {
      const loading = this.$loading({
        lock: true,
        text: "加载中...",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.axios.get("/camera").then((res) => {
        this.peripheralsSeries = res.data.result;
        loading.close();
      });
    },
    //跳转商品详情页面
    toProduct(event) {
      event.stopPropagation();
      let path = event.target.src;
      let i = path.lastIndexOf("/");
      let str = path.slice(i + 1).trim();
      let i2 = str.indexOf(".");
      let i3 = str.lastIndexOf(".");
      let img = str.slice(i2, i3);
      img = str.replace(img, "");
      // this.$router.push("/product/" + img);
      this.$router.push({ name: "product", params: { img: img } });
      //this.$router.push({ path: "/product", query: { img: img } });
    },
  },
};
</script>
