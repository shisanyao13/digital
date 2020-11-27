<template>
  <div>
    <div class="notFound">
      <h1>404</h1>
      <span>对不起，你访问的页面不存在！</span>
      <button @click="goHome()">返回首页</button>
    </div>
    <app-aside></app-aside>
  </div>
</template>
<style>
@media only screen and (max-width: 979.99px) {
  .notFound > h1 {
    font-size: 50px;
    font-weight: lighter;
    color: #000000;
    padding: 0 0 15px 0;
    border-bottom: 3px solid #8d9095;
    transition: 1s;
  }
}
@media only screen and (min-width: 980px) {
  .notFound > h1 {
    font-size: 100px;
    font-weight: lighter;
    color: #000000;
    padding: 0 0 15px 0;
    border-bottom: 3px solid #8d9095;
    transition: 1s;
  }
}
.notFound {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin: 10rem 0;
}
.notFound > span {
  font-size: 20px;
  color: #000000;
  display: inline-block;
  margin: 3rem 0;
}
.notFound > button {
  font-size: 14px;
  padding: 15px 40px;
  border: 2px solid rgb(70, 70, 70);
  background-color: rgb(70, 70, 70);
  color: rgb(255, 255, 255);
  border-radius: 34px;
}
.notFound > button:hover {
  border: 2px solid #00eff3;
  background-color: #00eff3;
}
</style>
<script>
export default {
  methods: {
    goHome() {
      this.$router.push("/");
    },
  },
};
</script>
