import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import AddCategory from "../views/Category/AddCategory"
import Category from "../views/Category/Category"
import EditCategory from "../views/Category/EditCategory"
import Product from "../views/Product/Product"
import AddProduct from "../views/Product/AddProduct"
import EditProduct from "../views/Product/EditProduct"
import ShowDetails from "../views/Product/ShowDetails"
import ListProducts from "../views/Category/ListProducts"
import WishList from "../views/Product/WishList"
import Admin from "../views/Admin"
import Signup from "../views/Signup"
import Signin from "../views/Signin"
import Cart from "../views/Cart"
import Checkout from "../views/Checkout"
import Success from "../views/Order/Success"
import Failed from "../views/Order/Failed"
import OrderHistory from "../views/Order/OrderHistory"

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: "/admin/category/add",
    name: "AddCategory",
    component: AddCategory,
  },  
  {
    path: "/admin/category",
    name: "AdminCategory",
    component: Category,
  },
  {
    path: "/admin/category/:id",
    name: "EditCategory",
    component: EditCategory,
    props: true,
  },  
  //Show products for a category
  {
    path: '/category/show/:id',
    name: 'ListProducts',
    component: ListProducts
  },
  {
    path: "/admin/product",
    name: "AdminProduct",
    component: Product,
  },
  {
    path: "/admin/product/add",
    name: "AddProduct",
    component: AddProduct,
  },  
  {
    path: "/admin/product/:id",
    name: "EditProduct",
    component: EditProduct,
    props: true,
  },    
  //Show product details
  {
    path: "/product/show/:id",
    name: "ShowDetails",
    component: ShowDetails
  },
  //WishList page
  {
    path: "/wishlist",
    name: "WishList",
    component: WishList
  },
  //admin home page
  {
    path: "/admin",
    name: "Admin",
    component: Admin,
  },
  //signup page
  {
    path: "/signup",
    name: "Signup",
    component: Signup
  },
  //signin page
  {
    path: "/signin",
    name: "Signin",
    component: Signin
  },
  //cart page
  {
    path: "/cart",
    name: "Cart",
    component: Cart
  },
  //checkout page
  {
    path: "/checkout",
    name: "Checkout",
    component: Checkout
  },
  //Payment success page
  {
    path: "/payment/success",
    name: "Success",
    component: Success
  },
  //Payment failed page
  {
    path: "/payment/failed",
    name: "Failed",
    component: Failed
  },
  //Order history page
  {
    path: '/orders',
    name: 'OrderHistory',
    component: OrderHistory
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
