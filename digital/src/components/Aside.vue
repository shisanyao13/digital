<template>
  <div>
    <div class="aside-position">
      <ul class="aside-icon">
        <li>
          <div class="phone-icon phone-icon_30x30"></div>
          <span>4006-999-999</span>
        </li>
        <li>
          <div class="phone-icon warning-icon_30x30" @click="back()"></div>
        </li>
        <li>
          <div class="phone-icon top-icon_30x30" @click="backtop()"></div>
        </li>
      </ul>
    </div>
  </div>
</template>
<style scoped>
.aside-position {
  position: fixed;
  top: 12.75rem;
  right: -7.4rem;
  z-index: 100;
}
.aside-icon {
  background-color: #00eef3;
  display: flex;
  flex-direction: column;
}
.aside-icon > li {
  padding: 0.625rem 0.625rem;
}
.aside-icon > li:first-child {
  display: flex;
  align-items: center;
  -webkit-transition: 0.5s linear;
  -ms-transition: 0.5s linear;
  -moz-transition: 0.5s linear;
  -o-transition: 0.5s linear;
  transition: 0.5s linear;
}
.aside-icon > li:first-child:hover {
  -webkit-transform: translateX(-7.5rem);
  -ms-transform: translateX(-7.5rem);
  -moz-transform: translateX(-7.5rem);
  -o-transform: translateX(-7.5rem);
  transform: translateX(-7.5rem);
  background-color: #00eef3;
}
.aside-icon span {
  margin-left: 0.625rem;
}
.phone-icon_30x30 {
  background-position: 0px 0;
}
.warning-icon_30x30 {
  background-position: 0px -114px;
  cursor: pointer;
}
.top-icon_30x30 {
  background-position: 0px -264px;
  cursor: pointer;
}
</style>
<script>
export default {
  mounted() {
    window.addEventListener("scroll", this.showbtn, true);
  },
  methods: {
    // 显示回到顶部按钮
    showbtn() {
      let that = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      that.scrollTop = scrollTop;
    },
    /**
     * 回到顶部功能实现过程：
     * 1. 获取页面当前距离顶部的滚动距离（虽然IE不常用了，但还是需要考虑一下兼容性的）
     * 2. 计算出每次向上移动的距离，用负的滚动距离除以5，因为滚动的距离是一个正数，想向上移动就是做一个减法
     * 3. 用当前距离加上计算出的距离，然后赋值给当前距离，就可以达到向上移动的效果
     * 4. 最后记得在移动到顶部时，清除定时器
     */
    backtop() {
      var timer = setInterval(function() {
        let osTop =
          document.documentElement.scrollTop || document.body.scrollTop;
        let ispeed = Math.floor(-osTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop =
          osTop + ispeed;
        this.isTop = true;
        if (osTop === 0) {
          clearInterval(timer);
        }
      }, 30);
    },
    //回退按钮
    back() {
      if (window.history.length <= 1) {
        this.$router.push({ path: "/" });
        return false;
      } else {
        this.$router.go(-1);
      }
    },
  },
};
</script>
