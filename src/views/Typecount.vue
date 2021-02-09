<template>
  <div class="typecount">
    <mt-header title="分类" fixed></mt-header>
    <div class="top"></div>
    <div class="type_count" v-for="(c,v) of typecount" :key="v">
    <router-link :to="`/type/${c.TypeId}/${c.Type}`">
        <img v-lazy="`/img/index/${c.back_img}`">
        <div>
          <p v-text="c.Type"></p>
          <p v-text="c.EnglishgType"></p>
          <p>点击进入&gt;</p>
        </div>
    </router-link>
    </div>
    <div class="type_count">
      <img src="/img/index/type_2.jpg">
      <div>
        <p>更多</p>
        <p>More and more Flowers</p>
        <p>点击进入&gt;</p>
      </div>
    </div>
    <div class="bottom"></div>
    <mt-tabbar v-model="current" fixed>
      <mt-tab-item id="index" href="/">
        <img src="/img/index/home_disable.png" slot="icon" v-if="current=='index'">
        <img src="/img/index/home_enable.png" slot="icon" v-else>
        首页
      </mt-tab-item>
      <mt-tab-item id="type" href="/type">
        <img src="/img/index/type_disable.png" slot="icon" v-if="current=='type'">
        <img src="/img/index/type_enable.png" slot="icon" v-else>        
        分类
      </mt-tab-item>
      <mt-tab-item id="shop" href="/shop">
        <img src="/img/index/shop_disable.png" slot="icon" v-if="current=='shop'">
        <img src="/img/index/shop_enable.png" slot="icon" v-else>        
        购物车
      </mt-tab-item>
      <mt-tab-item id="me">
        <img src="/img/index/me_disable.png" slot="icon" v-if="current=='me'">
        <img src="/img/index/me_enable.png" slot="icon" v-else>
        我的
      </mt-tab-item>
    </mt-tabbar>    
  </div>
</template>

<script>
export default {
  data() {
    return {
      current: "type",
      typecount:[]
    };
  },
  mounted(){
    this.axios.get("/typecount").then((result) => {
      this.typecount = result.data.result;
      console.log(this.typecount)
    });
  }
};
</script>

<style>
.typecount .mint-header {
  background-color: white;
}
.typecount h1 {
  font-size: 20px;
  font-family: "Times New Roman", Times, serif;
  font-weight: 600;
  line-height: 32px;
  padding: 10px 0;
  color: red;
  text-align: center;
}
.typecount .top{
  margin-top: 40px;
}
.typecount .type_count{
  width: 100%;
  height: 160px;
  margin-bottom: 10px;
}
.typecount .type_count img{
  width: 100%;
  height: 100%;
}
.typecount .type_count div{
  position: relative;
  margin-top: -155px;
  color: white;
}
.typecount .type_count div p{
  padding: 10px;
}
.typecount .bottom {
  margin-bottom: 55px;
}
.typecount .mint-tabbar a {
  color: black;
}
</style>