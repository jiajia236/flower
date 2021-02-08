<template>
  <div class="index">
    <mt-header title="Lover 花" fixed></mt-header>
    <mt-swipe class="swipe">
      <mt-swipe-item>
        <img src="/img/index/01.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="/img/index/02.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="/img/index/03.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="/img/index/04.jpg">
      </mt-swipe-item>
    </mt-swipe>
    <!-- <mt-navbar v-model="active">
      <mt-tab-item id="1">
        <img src="../assets/04.jpg" slot="icon">
        玫瑰
      </mt-tab-item>
      <mt-tab-item id="2">
        <img src="../assets/03.jpg" slot="icon">
        康乃馨
      </mt-tab-item>
      <mt-tab-item id="3">
        <img src="../assets/01.jpg" slot="icon">
        郁金香
      </mt-tab-item>
      <mt-tab-item id="4">
        <img src="../assets/02.jpg" slot="icon">
        百合
      </mt-tab-item>
    </mt-navbar> -->
    <h1>精品推荐</h1>
    <div class="index_body">
      <router-link v-for="(p,i) of category1" :key="i" :to="`/details/${p.id}`">
        <div>
          <img :src="`/img/index/${p.flower_image}`">
          <span v-text="p.title.slice(0,10)+'...'"></span>
          <p v-text="'¥'+p.price.toFixed(2)"></p>
        </div>
      </router-link>
    </div>  
    <h1>新品推荐</h1>
    <div class="index_body">
      <router-link v-for="(p,i) of category2" :key="i" :to="`/details/${p.id}`">
        <div>
          <img :src="`/img/index/${p.flower_image}`">
          <span v-text="p.title.slice(0,10)+'...'"></span>
          <p v-text="'¥'+p.price.toFixed(2)"></p>
        </div>
      </router-link>
    </div> 
    <h1>人气推荐</h1>
    <div class="index_body">
      <router-link v-for="(p,i) of category3" :key="i" :to="`/details/${p.id}`">
        <div>
          <img :src="`/img/index/${p.flower_image}`">
          <span v-text="p.title.slice(0,10)+'...'"></span>
          <p v-text="'¥'+p.price.toFixed(2)"></p>
        </div>
      </router-link>
    </div> 
    <h1>猜你喜欢</h1>
    <div class="index_body">
      <router-link v-for="(p,i) of category4" :key="i"  :to="`/details/${p.id}`">
        <div>
          <img v-lazy="`/img/index/${p.flower_image}`">
          <span v-text="p.title.slice(0,10)+'...'"></span>
          <p v-text="'¥'+p.price.toFixed(2)"></p>
        </div>
      </router-link>
    </div> 
    <div class="bottom"></div>
    <mt-tabbar v-model="current" fixed>
      <mt-tab-item id="index" href="/">
        <img src="/img/index/home_disable.png" slot="icon" v-if="current=='index'">
        <img src="/img/index/home_enable.png" slot="icon" v-else>
        首页
      </mt-tab-item>
      <mt-tab-item id="type" href="/typecount">
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
  data(){
    return{
      active:"1",
      current:"index",
      arr:2,
      category:[],
      category1:[],
      category2:[],
      category3:[],
      category4:[]
    }
  },
  mounted(){
    this.axios.get("/category").then((result) => {
      this.category = result.data.result;
      this.category1=this.category.splice(0,4);
      this.category2=this.category.splice(0,4);
      this.category3=this.category.splice(0,4);
      this.category4=this.category.splice(0,4);
      console.log(this.category1)
      console.log(this.category2)
      console.log(this.category3)
      console.log(this.category)
    });
  }
}
</script>

<style>
.index h1{
  font-size: 16px;
  font-weight: 600;
  line-height: 32px;
  padding: 10px 0;
  color: red;
  text-align: center;
}
.index .mint-header{
  background-color: white;
}
.index .mint-header-title{
  font-size: 25px;
   font-family: "Times New Roman", Times, serif;
}
.index .swipe{
  margin-top: 40px;
  height: 220px;
}
.index .swipe img{
  width: 100%;
}
.index .mint-tab-item-icon>*{
  border-radius: 50%;
}
.index .mint-navbar .mint-tab-item.is-selected{
  border: 0;
}
.index .index_body{
  display: flex;
  flex-wrap: wrap;
  text-align: center;
  width: 100%;
  margin-bottom: 8px;
}
.index .bottom{
  margin-bottom: 55px;
}
.index .index_body a{
  width: 45%;
  border: 1px solid gray;
  margin: 0px 5px 10px 10px;
  border-radius: 5px;
}
.index .index_body div img{
  width: 100%;
  margin-bottom: 10px;
}
.index .index_body div span{
  font-size: 16px;
  line-height: 22px;
}
.index .index_body div p{
  padding: 10px 0;
}
.index .mint-tabbar a{
  color: black;
}
</style>




