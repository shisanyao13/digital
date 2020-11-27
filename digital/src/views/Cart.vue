<template>
  <div class="cart">
    <app-header></app-header>
    <div class="cart-content">
      <div class="full" v-if="production.code == 1">
        <div class="cartProductInfo">
          <table cellspacing="0">
            <thead>
              <tr>
                <th colspan="1">商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>合计</th>
              </tr>
            </thead>
            <tbody>
              <tr
                class="productHeight"
                v-for="(item, index) of production.result"
                :key="index"
              >
                <td>
                  <div class="trProduct">
                    <i
                      class="el-icon-circle-close"
                      @click="deleteProduct(item.cid)"
                    ></i>
                    <el-image
                      :src="require('../assets/images/' + item.img)"
                      alt=""
                      lazy
                      id="cartImg"
                      @click="toProduct($event)"
                    ></el-image>
                    <p
                      class="hidden-xs-only"
                      @click="searchTitle(item.subtitle)"
                    >
                      {{ item.subtitle }}
                    </p>
                  </div>
                </td>
                <td>
                  <span class="itemPrice" v-html="`￥${item.price}`"></span>
                </td>
                <td
                  @mouseenter="getCount(item.count, item.cid)"
                  @mouseleave="updateCount(item.count, item.cid)"
                >
                  <el-input-number
                    v-model="item.count"
                    :min="1"
                    label="商品数量"
                  ></el-input-number>
                </td>
                <td>
                  <span
                    class="itemTotal"
                    v-html="`￥${item.count * item.price}`"
                  ></span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="totalPrice">
          <h2>购物车总计</h2>
          <div class="subtotal">
            <p>购物车小计</p>
            <span v-html="`￥${totalPrice}`"></span>
          </div>
          <div class="ordertotal">
            <p>订单总计</p>
            <span v-html="`￥${totalPrice}`"></span>
          </div>
          <button class="bankBtn">前往收银台</button>
          <h2 class="coupons">优惠券：</h2>
          <input type="text" placeholder="优惠券代码" />
          <button class="couponsBtn">使用优惠券</button>
        </div>
      </div>
      <div class="cart-empty" v-else>
        <h1>您的购物车目前是空的。</h1>
        <el-button icon="el-icon-refresh-left" @click="$router.push('/')"
          >返回商店</el-button
        >
      </div>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
@media only screen and (max-width: 575.99px) {
  .cart > .cart-content {
    margin: 3rem 1rem;
    animation: bounceInDown 1s;
  }
}
@media only screen and (min-width: 576px) {
  .cart > .cart-content {
    margin: 3rem 3rem 8rem 3rem;
    animation: bounceInDown 1s;
  }
}
@media only screen and (max-width: 1199.99px) {
  .cart > .cart-content > .full > .cartProductInfo {
    width: 100%;
    padding-right: 0;
    border-right: 0;
    margin-bottom: 1rem;
  }
  .cart > .cart-content > .full > .totalPrice {
    display: flex;
    flex-direction: column;
    margin-top: 1rem;
    margin-right: 1rem;
    width: 100%;
  }
}
@media only screen and (min-width: 1200px) {
  .cart > .cart-content > .full > .cartProductInfo {
    width: 42.963rem;
    padding-right: 1.5rem;
    border-right: 3px solid #e8e8e8;
    margin-bottom: 1rem;
  }
  .cart > .cart-content > .full > .totalPrice {
    display: flex;
    flex-direction: column;
    margin-top: 1rem;
    margin-right: 1rem;
    width: 22.25rem;
  }
}
.cart {
  background-color: #fff;
}
.cart > .cart-content > .cart-empty {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding-bottom: 6rem;
}
.cart > .cart-content > .cart-empty > h1 {
  font-size: 1.5rem;
  color: #191919;
  margin-top: 5rem;
  margin-bottom: 2rem;
}
.cart > .cart-content > .cart-empty > .el-button:focus,
.cart > .cart-content > .cart-empty > .el-button:hover {
  color: #fff !important;
  border-color: #00eff2 !important;
  background-color: #00eff2 !important;
  outline: none;
}
.cart > .cart-content > .full {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
/* 购物车账单信息 */
.cart > .cart-content > .full > .totalPrice > h2 {
  font-size: 1rem;
  font-weight: bold;
  color: rgb(85, 85, 85);
  padding-top: 6px;
  padding-bottom: 6px;
  border-bottom: 3px solid #dddddd;
}
.cart > .cart-content > .full > .totalPrice > div {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  color: #777777;
  border-bottom: 3px solid #dddddd;
}
.cart > .cart-content > .full > .totalPrice > .subtotal {
  border-bottom: 1px solid #dddddd;
}
.cart > .cart-content > .full > .totalPrice > .ordertotal {
  margin-bottom: 1rem;
}
.cart > .cart-content > .full > .totalPrice > div > p {
  font-weight: bold;
  padding: 1rem 0;
}
.cart > .cart-content > .full > .totalPrice > div > span {
  font-weight: normal;
}
.cart > .cart-content > .full > .totalPrice > .coupons {
  margin-top: 1rem;
  padding-bottom: 0.5rem;
  padding-top: 0;
}
.cart > .cart-content > .full > .totalPrice > input {
  margin: 0.5rem 0 0.75rem 0;
  padding: 0.35rem;
}
.cart > .cart-content > .full > .totalPrice > button {
  border-radius: 0;
  padding: 0.35rem 0;
}
.cart > .cart-content > .full > .totalPrice > button:hover {
  cursor: pointer;
  color: #000000;
  border-color: #00eef3;
  background-color: #00eef3;
  outline: none;
}
.cart > .cart-content > .full > .totalPrice > .bankBtn {
  background-color: #00eef3;
  border: 1px solid #00eef3;
}
.cart > .cart-content > .full > .totalPrice > .couponsBtn {
  background-color: #fff;
  border: 1px solid #ccc;
}
/* 购物车表单信息 */
table > thead {
  border-bottom: 3px solid #e8e8e8;
}
table > thead > tr > th {
  font-size: 1rem;
  font-weight: bold;
  color: rgb(85, 85, 85);
  padding-top: 6px;
  padding-bottom: 6px;
}
table .productHeight {
  height: 7rem;
  border-bottom: 1px solid #e8e8e8;
}
table .trProduct {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
table .trProduct > i {
  padding: 0 0.5rem;
  color: #e8e8e8;
  font-size: 2rem;
  transition: 1s;
}
table .trProduct > i:hover {
  color: #000000;
  cursor: pointer;
}
#cartImg {
  width: 5.625rem;
  height: 5.625rem;
  padding: 0 0.5rem;
  animation: jello 1s;
}
#cartImg:hover {
  cursor: pointer;
}
table .trProduct > p {
  width: 9.9375rem;
  font-size: 14px;
  line-height: 16px;
  color: #000000;
  padding: 0 1.875rem;
}
table .trProduct > p:hover {
  cursor: pointer;
  color: #00eef3;
}
table .productHeight > td > .itemPrice {
  font-size: 14px;
  color: #777777;
  padding: 0 0.5rem;
}
table .productHeight > td > .el-input-number {
  width: 8.125rem;
  margin: 0 0.5rem;
}
table .productHeight > td > .itemTotal {
  font-size: 14px;
  color: #777777;
  font-weight: bolder;
  padding: 0 0.5rem;
}
</style>
<script>
export default {
  data() {
    return {
      empty: false,
      num: { cid: 0, count: 0 },
      production: { code: 0, result: { count: 0 } },
      totalPrice: 0,
    };
  },
  methods: {
    //按标题查询商品
    searchTitle(value) {
      value = value.trim();
      if (value != "") this.$router.push("/searchResult/" + value);
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
      this.$router.push("/product/" + img);
    },
    //删除商品信息
    deleteProduct(cid) {
      this.$confirm("确认删除该商品, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.axios.delete("/delete?cid=" + cid).then((res) => {
            if (res.data.code == 1) {
              this.userCart();
              this.$message({
                type: "success",
                message: "删除成功!",
                showClose: true,
                center: true,
                offset: 160,
              });
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "warning",
            message: "已取消删除!",
            showClose: true,
            center: true,
            offset: 160,
          });
        });
    },
    //获取该用户下的购物车商品信息
    userCart() {
      this.axios
        .get("/watch?username=" + this.$store.state.uname)
        .then((res) => {
          this.production = res.data;
        });
    },
    //每当进入当前输出框时获取购物车中的商品数量
    getCount(count, cid) {
      this.num = { count, cid };
    },
    //每当离开当前输出框时发送一次请求修改购物车中的商品数据
    updateCount(count, cid) {
      let obj = { count, cid };
      if (this.num.count != obj.count) {
        this.axios.put("/update", this.qs.stringify(obj)).then((res) => {
          this.userCart();
        });
      }
    },
  },
  mounted() {
    //查询该用户下的购物车商品信息
    this.userCart();
  },
  updated() {
    //计算购物车内的商品总价
    let arr1 = this.production.result;
    let arr2 = [];
    arr1.forEach((item) => {
      arr2.push(item.count * item.price);
    });
    this.totalPrice = arr2.reduce((prev, cur) => {
      return prev + cur;
    }, 0);
  },
};
</script>
