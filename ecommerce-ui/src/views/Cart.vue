<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h3 class="pt-3">
          Shopping cart
        </h3>
      </div>
    </div>

    <!-- loop over the cart items and display -->

    <div v-for="cartItem in cartItems" :key="cartItem.id" class="row mt-2 pt-3">
      <div class="col-2"></div>
      <div class="col-md-3">
        <img
          :src="cartItem.product.imageURL"
          alt=""
          class="w-100 card-image-top embed-responsive embed-responsive-16by9"
          style="object-fit: cover"
        />
      </div>

      <!-- display product name, quantity -->
      <div class="col-md-5 px-3">
        <div class="card-block px-3">
          <h6 class="card-title">
            {{ cartItem.product.name }}
          </h6>

          <p class="mb-0 font-weight-bold" id="item-price">
            $ {{ cartItem.product.price }} per unit
          </p>
          <p class="mb-0">Quantity:{{ cartItem.quantity }}</p>
        </div>
        <p class="mb-0">
          Total:
          <span class="font-weight-bold">
            $ {{ cartItem.product.price * cartItem.quantity }}
          </span>
        </p>
        <br><a href="#" @click="deleteItem(cartItem.id)">Remove From Cart</a>
      </div>
      <div class="col-2"></div>
      <div class="col-12"><hr /></div>
    </div>

    <!-- display total price -->
    <div class="total-cost pt-2 text-right">
      <h5>Total : $ {{totalCost}}</h5>
      <button :disabled="isDisabled()" type="button" class="btn btn-primary confirm"  @click="checkout">Confirm Order</button>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      cartItems: [],
      token: null,
      totalCost: 0,
       baseURL: "http://localhost:8090/"
    };
  },
  methods: {
     isDisabled(){
       if(this.cartItems.length === 0){
         return true;
       }
       return false;
     },      
    // fetch All items in cart
    listCartItems() {
      axios
        .get(`${this.baseURL}cart/?token=${this.token}`)
        .then((res) => {
          const result = res.data;
          this.cartItems = result.cartItems;
          this.totalCost = result.totalCost;
        })
        .catch((err) => console.log("err", err));
    },
    deleteItem(itemId) {
       // 2. first delete the item by calling delete api
      axios.delete(`${this.baseURL}cart/delete/${itemId}/?token=${this.token}`)
        .then((response)=>{
          if(response.status == 200){
            // 3. refresh the data by calling listCartItems
            this.listCartItems();
          }
        },(error)=>{
          console.log(error)
        })
    },       
    // go to checkout page
    checkout(){
      this.$router.push({ name: 'Checkout'})
    },
  },
  mounted() {
    this.token = localStorage.getItem("token");
    this.listCartItems();
  },
};
</script>

<style scoped>
h4, h5 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}
.embed-responsive .card-img-top {
  object-fit: cover;
}
#item-price {
  color: #232F3E;
}
#item-quantity{
  float: left;
}
#item-total-price {
  float: right;
}
.confirm {
  font-weight: bold;
  font-size: larger;
}
</style>