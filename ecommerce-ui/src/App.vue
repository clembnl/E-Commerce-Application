<template>
  <Navbar />  
  <router-view v-if="categories && products"
  :baseURL="baseURL"
  :categories="categories"
  :products="products"
  @fetchData="fetchData"
  >
  </router-view>
  <!-- footer -->
  <Footer />
</template>

<script>
import Navbar from "./components/Navbar.vue"
import Footer from "./components/Footer.vue"
import axios from 'axios'
export default {
  components: { Navbar, Footer },
  data() {
    return {
      baseUrl : "http://localhost:8090/",
      products: [],
      categories: []
    }
  },
  methods: {
    async fetchData() {

      //API call to get the categories  
      await axios.get(this.baseUrl + "category/")
      .then(res => {
        this.categories = res.data
      }).catch((err) => console.log('err', err));

      //API call to get the products
      await axios.get(this.baseUrl + "product/")
      .then(res => {
        this.products = res.data
      }).catch((err) => console.log('err', err));      
    }  
  },
  mounted() {
    this.fetchData();
  }
}
</script>


<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
