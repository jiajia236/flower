<template>
  <div class="type">
    <mt-header title="Lover 花" fixed>
      <router-link slot="left" to="/typecount">
        <mt-button  icon="back"></mt-button>
      </router-link>     
    </mt-header>
    <div class="top"></div>
    <mt-tab-container>
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
    <div class="bottom"></div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      type:[],
    }
  },
  mounted(){
    let id = this.$route.params.id;
    this.axios.get("/type",{
      params:{
        id:id,
      }
    }).then((result) => {
      this.type = result.data.result;
      console.log(this.type)
    });
  }  
}
</script>

<style>
.type h1{
  font-size: 16px;
  font-weight: 600;
  line-height: 32px;
  padding: 10px 0;
  color: red;
  text-align: center;
}
.type .mint-header{
  background-color: white;
  border-bottom: 1px solid #aaa;
  color: red;
}

.type .top{
  margin-top: 48px;
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
</style>