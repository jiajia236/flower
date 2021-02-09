<template>
  <div class="type">
    <mt-header :title="`${Type}`" fixed>
      <router-link slot="left" to="/typecount">
        <mt-button  icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div class="top"></div>
    <mt-tab-container
      infinite-scroll-distance="20"
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="disabled"
      infinite-scroll-immediate-check="true"
    >
      <mt-tab-container-item>
        <div class="typeitem">
          <router-link v-for="(p,i) of type" :key="i"  :to="`/details/${p.id}`">
            <div>
              <img :src="`/img/index/${p.flower_image}`">
              <span v-text="p.title.slice(0,10)+'...'"></span>
              <p v-text="'¥'+p.price.toFixed(2)"></p>
            </div>
          </router-link>
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
    <div style="padding:20px;background:#f5f5f5;color:#333;text-align:center;" v-show="page==1?false:page>=pagecount">
      到底了,没有更多了...
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
      type:[],
      Type:"",
      page:1,
      pagecount:0,
      disabled:false,
      current:"type"
    }
  },
  methods:{
    loadDate(page){
      this.disabled = true;
      this.$indicator.open({
        text: "加载中...",
        spinnerType: "fading-circle",
      });
      let id = this.$route.params.id;
      this.Type=this.$route.params.Type;
      console.log(this.Type)
      this.axios.get("/type",{
        params:{
          id:id,
          page:page
        }
      }).then((result) => {
        this.pagecount=result.data.result;
        let type = result.data.result;
        type.forEach(item=>{
          this.type.push(item)
          console.log(this.type)
        })
        this.$indicator.close();
        this.disabled = false;
      });
    },
    loadMore(){
      this.page++;
      this.loadDate(this.page);
    }
  },
  mounted(){
    this.loadDate(1)
  }  
}
</script>

<style>
.type h1{
  font-size: 16px;
  font-weight: 600;
  line-height: 32px;
  color: red;
  text-align: center;
}
.type .mint-header{
  background-color: white;
  border-bottom: 1px solid #aaa;
  color: red;
}
.type .top{
  margin-top: 45px;
}
.type .typeitem{
  display: flex;
  flex-wrap: wrap;
  text-align: center;
  width: 100%;
  margin-bottom: 8px;
}
.type .bottom{
  margin-bottom: 55px;
}
.type .typeitem a{
  width: 45%;
  border: 1px solid gray;
  margin: 0px 5px 10px 10px;
  border-radius: 5px;
  color: black;
}
.type .typeitem div img{
  width: 100%;
  margin-bottom: 10px;
}
.type .typeitem div span{
  font-size: 16px;
  line-height: 22px;
}
.type .typeitem div p{
  padding: 10px 0;
}
.type .mint-tabbar a{
  color: black;
}
</style>