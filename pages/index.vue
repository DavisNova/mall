<template>
  <div class="index-page">
    <!-- 轮播图 -->
    <div class="banner-container">
      <van-loading v-if="loading" type="spinner" vertical>加载中...</van-loading>
      <van-empty v-else-if="error" :description="error" />
      <van-swipe v-else class="banner" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="banner in banners" :key="banner.id">
          <img :src="banner.image_url" @click="handleBannerClick(banner)" />
        </van-swipe-item>
      </van-swipe>
    </div>

    <!-- 商品列表 -->
    <div class="products-grid">
      <div v-for="product in products" :key="product.id" class="product-item" @click="showProductDetail(product)">
        <van-image :src="product.images[0]" />
        <div class="product-info">
          <div class="product-name">{{ product.name }}</div>
          <div class="product-price">¥{{ product.price }}</div>
        </div>
      </div>
    </div>

    <!-- 底部导航栏 -->
    <van-tabbar v-model="activeTab">
      <van-tabbar-item icon="home-o" @click="goHome">首页</van-tabbar-item>
      <van-tabbar-item icon="cart-o" @click="showCart">购物车</van-tabbar-item>
    </van-tabbar>

    <!-- 商品详情弹窗 -->
    <van-popup v-model:show="showDetail" position="bottom" round>
      <div class="product-detail" v-if="currentProduct">
        <van-swipe class="product-images">
          <van-swipe-item v-for="image in currentProduct.images" :key="image">
            <van-image :src="image" />
          </van-swipe-item>
        </van-swipe>
        <div class="product-info">
          <h2>{{ currentProduct.name }}</h2>
          <div class="price">¥{{ currentProduct.price }}</div>
          <div class="sales">销量: {{ currentProduct.sales }}</div>
          <div class="description">{{ currentProduct.description }}</div>
        </div>
        <div class="action-buttons">
          <van-button type="primary" @click="addToCart">加入购物车</van-button>
          <van-button type="danger" @click="buyNow">立即购买</van-button>
        </div>
      </div>
    </van-popup>

    <!-- 购物车弹窗 -->
    <van-popup v-model:show="showCartPopup" position="bottom" round>
      <div class="cart-content">
        <div class="cart-items">
          <div v-for="item in cartItems" :key="item.id" class="cart-item">
            <van-image :src="item.images[0]" />
            <div class="item-info">
              <div class="item-name">{{ item.name }}</div>
              <div class="item-price">¥{{ item.price }}</div>
            </div>
            <van-stepper v-model="item.quantity" />
          </div>
        </div>
        <div class="cart-footer">
          <div class="total-price">合计：¥{{ totalPrice }}</div>
          <van-button type="danger" @click="checkout">立即下单</van-button>
        </div>
      </div>
    </van-popup>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useCartStore } from '~/stores/cart'

const banners = ref([])
const products = ref([])
const activeTab = ref(0)
const showDetail = ref(false)
const showCartPopup = ref(false)
const currentProduct = ref(null)
const cartStore = useCartStore()
const loading = ref(true)
const error = ref(null)

// 获取轮播图数据
const fetchBanners = async () => {
  try {
    loading.value = true
    const response = await fetch('/api/banners')
    const result = await response.json()
    
    if (result.code === 0 && Array.isArray(result.data)) {
      banners.value = result.data
    } else {
      throw new Error(result.message || '获取轮播图数据失败')
    }
  } catch (err: any) {
    console.error('获取轮播图失败:', err)
    error.value = err.message
  } finally {
    loading.value = false
  }
}

// 处理轮播图点击
const handleBannerClick = (banner: any) => {
  if (banner.product_id) {
    // 根据product_id查找对应商品
    const product = products.value.find((p: any) => p.id === banner.product_id)
    if (product) {
      currentProduct.value = product
      showDetail.value = true
    }
  }
}

// 获取商品列表
const fetchProducts = async () => {
  try {
    console.log('Fetching products...')
    const { data, error } = await useFetch('/api/products', {
      transform: (response: any) => {
        console.log('Products response:', response)
        if (response && response.code === 0 && Array.isArray(response.data)) {
          return response.data
        }
        console.error('Invalid products response:', response)
        return []
      }
    })
    
    if (error.value) {
      console.error('Products fetch error:', error.value)
      return
    }
    
    products.value = data.value || []
    console.log('Products loaded:', products.value)
  } catch (error) {
    console.error('获取商品数据出错:', error)
  }
}

// 显示商品详情
const showProductDetail = (product) => {
  currentProduct.value = product
  showDetail.value = true
}

// 加入购物车
const addToCart = () => {
  cartStore.addItem(currentProduct.value)
  showDetail.value = false
}

// 立即购买
const buyNow = () => {
  cartStore.addItem(currentProduct.value)
  showDetail.value = false
  showCartPopup.value = true
}

// 显示购物车
const showCart = () => {
  showCartPopup.value = true
}

// 回到首页
const goHome = () => {
  activeTab.value = 0
}

// 计算购物车总价
const totalPrice = computed(() => {
  return cartStore.totalPrice
})

// 获取购物车商品
const cartItems = computed(() => {
  return cartStore.items
})

// 结算
const checkout = () => {
  // 实现结算逻辑
}

// 页面加载时获取数据
onMounted(async () => {
  await fetchBanners()
  fetchProducts()
})
</script>

<style scoped>
.index-page {
  padding-bottom: 50px;
}

.banner-container {
  position: relative;
  width: 100%;
  height: 200px;
  background: #f7f8fa;
}

.banner {
  width: 100%;
  height: 100%;
}

.banner img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.van-loading {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 10px;
  padding: 10px;
}

.product-item {
  background: #fff;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product-info {
  padding: 8px;
}

.product-name {
  font-size: 14px;
  margin-bottom: 4px;
}

.product-price {
  color: #f44;
  font-weight: bold;
}

.product-detail {
  padding: 16px;
}

.product-images {
  height: 300px;
}

.action-buttons {
  display: flex;
  gap: 10px;
  padding: 16px;
}

.cart-content {
  padding: 16px;
  max-height: 80vh;
  overflow-y: auto;
}

.cart-item {
  display: flex;
  align-items: center;
  padding: 10px 0;
  border-bottom: 1px solid #eee;
}

.item-info {
  flex: 1;
  padding: 0 10px;
}

.cart-footer {
  position: sticky;
  bottom: 0;
  background: #fff;
  padding: 16px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style> 