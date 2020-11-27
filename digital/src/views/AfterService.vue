<template>
  <div class="after-service">
    <app-header></app-header>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadRoute">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/afterservice' }"
        >售后服务</el-breadcrumb-item
      >
    </el-breadcrumb>
    <div class="ser-content">
      <h3>售后服务</h3>
      <div class="ser_content">
        <div>
          <h5>一、“三包”服务承诺</h5>
          <p v-html="constraint"></p>
        </div>
        <div>
          <h5>二、维修服务方式</h5>
          <p v-html="constraint"></p>
        </div>
        <div>
          <h5>三、保修期及上门期</h5>
          <p v-html="constraint"></p>
        </div>
        <div>
          <h5>四、软件维修服务</h5>
          <p v-html="constraint"></p>
        </div>
        <div>
          <h5>五、数据备份</h5>
          <p v-html="constraint"></p>
        </div>
      </div>
    </div>
    <app-aside class="hidden-sm-and-down"></app-aside>
    <app-up></app-up>
    <app-footer></app-footer>
  </div>
</template>
<style>
.after-service {
  display: flex;
  flex-direction: column;
}
.after-service > .breadRoute {
  background-color: #fff;
  padding: 1.5rem 3.25rem;
}
.after-service .el-breadcrumb__inner.is-link:hover {
  color: #00eef3;
  cursor: pointer;
}
.after-service > .ser-content {
  background-color: #fff;
  margin: 1.5rem 1.5rem 5rem 1.5rem;
  animation: bounceInDown 1s;
}
.after-service > .ser-content > h3 {
  font-size: 26px;
  font-weight: normal;
  font-style: normal;
  color: #333333;
  padding: 4rem 0;
  vertical-align: bottom;
  text-align: center;
}
.after-service > .ser-content > .ser_content {
  display: flex;
  flex-direction: column;
}
.after-service > .ser-content > .ser_content h5 {
  color: #000;
  font-weight: bolder;
  margin: 0 1rem 2.5rem 1rem;
}
.after-service > .ser-content > .ser_content p {
  margin: 0 1rem 2.5rem 1rem;
  text-indent: 2rem;
  line-height: 2rem;
}
</style>
<script>
export default {
  data() {
    return {
      constraint:
        "以任何方式进入起飞页网站即表示您同意自己已经与起飞页订立本条款，且您将受本条款的条件约束。条款的解释权归起飞页所有。您应在第一次登录后仔细阅读修订后的“条款”，并有权选择停止继续使用“服务”；一旦您继续使用“服务”， 则表示您已接受经修订的“条款”，当您与起飞页发生争议时，应以最新的服务条款为准。除另行明确声明外，任何使“服务”范围扩大或功能增强的新内容均受本条款约束。",
    };
  },
};
</script>
