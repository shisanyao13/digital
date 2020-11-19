<template>
  <div class="foot">
    <div class="hidden-sm-and-down foot-detail">
      <div class="foot-icon">
        <div class="foot-icon_title">
          <img src="../assets/images/bx.webp" alt />
          <span>3年免费保修</span>
        </div>
        <div class="foot-icon_title">
          <img src="../assets/images/qtth.webp" alt />
          <span>7天无理由退货</span>
        </div>
        <div class="foot-icon_title">
          <img src="../assets/images/swthh.webp" alt />
          <span>15天免费换货</span>
        </div>
        <div class="foot-icon_title">
          <img src="../assets/images/mby.webp" alt />
          <span>满150元包邮</span>
        </div>
        <div class="foot-icon_title">
          <img src="../assets/images/shwd.webp" alt />
          <span>200余家售后网点</span>
        </div>
      </div>
      <div class="foot-router">
        <div>
          <ul>
            <li>帮助中心</li>
            <li>购物指南</li>
            <li>支付方式</li>
            <li>配送方式</li>
          </ul>
        </div>
        <div>
          <ul>
            <li>服务支持</li>
            <li>保修政策</li>
            <li>服务标准</li>
            <li>退换货政策</li>
          </ul>
        </div>
        <div>
          <ul>
            <li>关于我们</li>
            <li>公司介绍</li>
            <li>加入我们</li>
            <li>联系我们</li>
          </ul>
        </div>
        <div>
          <ul>
            <li>新闻资讯</li>
            <li>营业执照</li>
            <li>新闻动态</li>
            <li>版权申明</li>
          </ul>
        </div>
        <div>
          <ul>
            <li>线下门店</li>
            <li>法律申明</li>
            <li>隐私政策</li>
            <li>服务条款</li>
          </ul>
        </div>
        <div class="wxgzh">
          <p>微信公众号</p>
          <img
            src="../assets/images/wxgzh.webp"
            width="79px"
            height="79px"
            alt=""
          />
        </div>
        <div class="foot-timeInfo">
          <h3>4006-999-999</h3>
          <p>周一至周日 8:00-18:00</p>
          <button>24小时在线客服</button>
        </div>
      </div>
    </div>
    <div>
      <div class="foot_recode">
        <div>版权所有2056-2086 数码家电在线商城模板</div>
        <span class="recode" @click="templateSource">沪ICP备000000000号-0</span>
      </div>
    </div>
  </div>
</template>
<style>
.foot {
  position: relative;
  right: 0;
  bottom: 0;
  left: 0;
}
.foot .foot-detail {
  background-color: #272727;
}
.foot .foot-icon {
  display: flex;
  justify-content: space-around;
  padding: 1.875rem 0;
  margin: 0 2.5rem;
  border-bottom: 1px solid rgba(55, 55, 55, 1);
}
.foot .foot-icon_title {
  display: flex;
  align-items: center;
}
.foot .foot-icon_title > span {
  margin-left: 0.5rem;
}
.foot .foot-router {
  display: flex;
  justify-content: space-around;
  align-items: baseline;
  padding: 1.875rem 0;
  margin: 0 2.5rem;
  font-size: 0.75rem;
  color: #999;
}
.foot .foot-router ul li:first-child {
  font-size: 1.125rem;
  margin-bottom: 1rem;
}
.foot .foot-router ul li + li {
  margin-bottom: 0.875rem;
}
.foot .foot-router ul li:hover,
.foot .foot-router .wxgzh :hover {
  cursor: pointer;
  color: #00eff2;
}
.foot .foot-router .wxgzh {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 1.125rem;
}
.foot .foot-router .wxgzh > p {
  margin-bottom: 1rem;
}
.foot .foot-timeInfo {
  font-size: 0.875rem;
  text-align: center;
  border-left: 1px solid rgba(55, 55, 55, 1);
  padding-left: 3rem;
}
.foot .foot-timeInfo > h3 {
  font-size: 1.625rem;
  color: #00eff2;
  font-family: arial;
}
.foot .foot-timeInfo > p {
  margin: 0.625rem 0 1.25rem;
  font-size: 0.75rem;
}
.foot .foot-timeInfo > button {
  width: 9.5rem;
  height: 2.3125rem;
  padding: 0.5rem 1.5625rem;
  border: 1px solid rgb(0, 239, 242);
  color: rgb(0, 239, 242);
  background-color: transparent;
}
.foot .foot-timeInfo > button:hover {
  background-color: rgb(0, 239, 242);
  color: #000;
}
.foot .foot_recode {
  display: flex;
  justify-content: center;
  text-align: center;
  font-size: 0.75rem;
  color: #999;
  background: #000000 none repeat center top;
  border-top: 1px solid transparent;
  padding: 0.875rem 0;
}
.foot .recode {
  cursor: pointer;
  padding-left: 0.3125rem;
}
</style>
<script>
export default {
  methods: {
    templateSource() {
      window.open("http://5c9335fd69abc.t73.qifeiye.com/", "_blank");
    },
  },
};
</script>
