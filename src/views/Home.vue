<template>
  <div class="index">
    <mt-header title="Lover 花" fixed></mt-header>
    <mt-swipe class="swipe">
      <mt-swipe-item>
        <router-link to="/type/1/玫瑰">
        <img src="/img/index/01.jpg">
        </router-link>
      </mt-swipe-item>
      <mt-swipe-item>
        <router-link to="/type/2/康乃馨">
        <img src="/img/index/02.jpg">
        </router-link>
      </mt-swipe-item>
      <mt-swipe-item>
        <router-link to="/type/3/百合">
        <img src="/img/index/03.jpg">
        </router-link>
      </mt-swipe-item>
      <mt-swipe-item>
        <router-link to="/type/4/郁金香">
        <img src="/img/index/04.jpg">
        </router-link>
      </mt-swipe-item>
    </mt-swipe>
    <div class="index_body">
        <h1 v-text="'特别推荐'"></h1>
          <router-link v-for="(p,i) of category1" :key="i" :to="`/details/${p.id}`">
            <div>
              <img :src="`/img/index/${p.flower_image}`">
              <span v-text="p.title.slice(0,10)+'...'"></span>
              <p v-text="'¥'+p.price.toFixed(2)"></p>
            </div>
          </router-link>
        </div>
        <div class="index_body">
        <h1 v-text="'新品推荐'"></h1>
          <router-link v-for="(p,i) of category2" :key="i" :to="`/details/${p.id}`">
            <div>
              <img :src="`/img/index/${p.flower_image}`">
              <span v-text="p.title.slice(0,10)+'...'"></span>
              <p v-text="'¥'+p.price.toFixed(2)"></p>
            </div>
          </router-link>
        </div> 
        <div class="index_body">
        <h1 v-text="'精品推荐'"></h1>
          <router-link v-for="(p,i) of category3" :key="i" :to="`/details/${p.id}`">
            <div>
              <img :src="`/img/index/${p.flower_image}`">
              <span v-text="p.title.slice(0,10)+'...'"></span>
              <p v-text="'¥'+p.price.toFixed(2)"></p>
            </div>
          </router-link>
        </div>     
        <div class="index_body">
        <h1 v-text="'人气推荐'"></h1>
          <router-link v-for="(p,i) of category4" :key="i" :to="`/details/${p.id}`">
            <div>
              <img :src="`/img/index/${p.flower_image}`">
              <span v-text="p.title.slice(0,10)+'...'"></span>
              <p v-text="'¥'+p.price.toFixed(2)"></p>
            </div>
          </router-link>
        </div> 
        
      <mt-tab-container
        infinite-scroll-distance="20"
        v-infinite-scroll="loadMore"
        infinite-scroll-disabled="disabled"
        infinite-scroll-immediate-check="true"
      >
      <mt-tab-container-item>
        <!-- 单一文章信息开始 -->
        <div class="index_body">
        <h1 v-text="'猜你喜欢'"></h1>
          <router-link v-for="(p,i) of category5" :key="i" :to="`/details/${p.id}`">
            <div>
              <img v-lazy="`/img/index/${p.flower_image}`">
              <span v-text="p.title.slice(0,10)+'...'"></span>
              <p v-text="'¥'+p.price.toFixed(2)"></p>
            </div>
          </router-link>
        </div>
        <!-- 单一文章信息结束 -->
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
      active:"1",
      current:"index",
      typeindex:[],
      category:[],
      category1:{},
      category2:[],
      category3:[],
      category4:[],
      category5:[],
      page:1,
      pagecount:0,
      disabled: false,
    }
  },
  methods:{
    loadData(page){
      this.disabled = true;
      this.$indicator.open({
        text: "加载中...",
        spinnerType: "fading-circle",
      });
      this.axios.get("/category",{
        params:{
          page:page,
        }
      }).then((result) => {
        this.pagecount=result.data.pagecount;
        let category = result.data.result;
        console.log(category)
        this.category1=category.splice(0,4);
        this.category2=category.splice(0,4);
        this.category3=category.splice(0,4);
        this.category4=category.splice(0,4);
        category.forEach(item=>{
          this.category5.push(item)
        })
        this.$indicator.close();
        this.disabled = false;
      });
    },
    loadMore() {
      // 页码累加
      this.page++;
      // 当前页码在总页数范围内时获取文章列表数据
      if (this.page <= this.pagecount) {
        this.disabled = true;
        this.$indicator.open({
          text: "加载中...",
          spinnerType: "fading-circle",
        });
        this.axios.get("/category",{
          params:{
            page:this.page,
          }
        }).then((result) => {
          this.pagecount=result.data.pagecount;
          let category=result.data.result;
          console.log(category)
          category.forEach(item=>{
            this.category5.push(item)
          })
          this.$indicator.close();
          this.disabled = false;
        });
        console.log(this.page)
      }
    },
  },
  mounted(){
    this.loadData(1)
  },
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
  width: 100%;
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
}
.index .bottom{
  margin-bottom: 55px;
}
.index .index_body a{
  width: 45%;
  border: 1px solid #eee;
  margin: 0px 5px 10px 10px;
  color: black;
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
.index .mint-button{
  padding: 5px 20px;
  margin: 0 auto;
  text-align: center;
  border: 1px solid red;
  width: 300px;
  border-radius: 39px;
}
.index .mint-tabbar a{
  color: black;
}
</style>




