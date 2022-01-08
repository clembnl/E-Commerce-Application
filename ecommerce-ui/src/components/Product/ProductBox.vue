<template>
  <div class="card h-100">
    <div class="embed-responsive embed-responsive-16by9">
      <img
          class="card-img-top embed-responsive-item"
          :src="product.imageURL"
          alt="Card image cap"
      />      
    </div>

    <div class="card-body">
      <router-link :to="{name: 'ShowDetails', params: {id : product.id}}">
          <h5 class="card-title">{{ product.name }}</h5>
      </router-link>
      <p class="card-text font-italic">{{product.description.substring(0,65)}}...</p>
      <router-link id="edit-product" :to="{ name: 'EditProduct', params: { id : product.id, product: product } }" v-show="$route.name == 'AdminProduct'">
        <button class="btn btn-primary">Edit</button>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
    name : "ProductBox",
    props : ["product"],
    methods : {
        
    }
}
</script> 

<style scoped>
.card{
  width : 20rem;
  height : 24rem;
}
.embed-responsive .card-img-top {
  object-fit: cover;
}
a {
  text-decoration: none;
}
.card-title {
  color: #484848;
  font-size: 1.1rem;
  font-weight: 400;
}
.card-title:hover {
  font-weight: bold;
}
.card-text {
  font-size: 0.9rem;
}
#edit-category {
  float: right;
}
</style>