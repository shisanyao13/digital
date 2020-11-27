<template>
  <div class="up">
    <el-button
      icon="el-icon-arrow-up"
      v-show="scrollShow"
      @click="backtop()"
    ></el-button>
  </div>
</template>
<style>
.up > button,
.up > button:hover,
.up > button:focus {
  background-color: #00eef3;
  border: 0;
  border-radius: 0;
  padding: 0.5rem;
}
.up > button {
  position: fixed;
  bottom: 0;
  right: 0;
  margin-right: 1.2rem;
  margin-bottom: 2.55rem;
  z-index: 1;
}
.up > button > i {
  color: #000;
}
</style>
<script>
export default {
  data() {
    return {
      scrollShow: false,
    };
  },
  mounted() {
    window.addEventListener("scroll", this.newScroll);
  },
  methods: {
    newScroll() {
      var scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      if (scrollTop > 300) this.scrollShow = true;
      else this.scrollShow = false;
    },
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
  },
};
</script>
