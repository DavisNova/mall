<template>
  <div class="product-detail">
    <!-- 商品信息展示 -->
    <div class="product-info" v-if="product">
      <div class="product-images">
        <img :src="product.images[0]" :alt="product.name">
      </div>
      <div class="product-content">
        <h1 class="product-name">{{ product.name }}</h1>
        <div class="product-price">¥{{ product.price.toFixed(2) }}</div>
        <div class="product-description">{{ product.description }}</div>
      </div>
    </div>

    <!-- 底部操作栏 -->
    <div class="bottom-bar">
      <div class="action-buttons">
        <button class="cart-btn" @click="showCart = true">
          <i class="fas fa-shopping-cart"></i>
          <span class="cart-count" v-if="cartStore.items.length">{{ cartStore.items.length }}</span>
        </button>
        <button class="buy-now-btn" @click="handleBuyNow">立即购买</button>
      </div>
    </div>

    <!-- 购物车弹窗 -->
    <CartPopup v-if="showCart" @close="showCart = false" />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useCartStore } from '~/stores/cart'
import CartPopup from '~/components/CartPopup.vue'

const router = useRouter()
const cartStore = useCartStore()
const showCart = ref(false)

const product = ref({
  id: '1',
  name: '商品名称',
  price: 599,
  description: '商品描述',
  images: ['商品图片URL']
})

const handleBuyNow = () => {
  // 清空购物车，只添加当前商品
  cartStore.clearCart()
  cartStore.addItem({
    id: product.value.id,
    name: product.value.name,
    price: product.value.price,
    image: product.value.images[0]
  })
  
  // 跳转到结算页面
  router.push('/checkout')
}
</script>

<style scoped>
.product-detail {
  padding-bottom: 60px;
}

.product-info {
  padding: 16px;
}

.product-images img {
  width: 100%;
  height: auto;
  border-radius: 8px;
}

.product-content {
  margin-top: 16px;
}

.product-name {
  font-size: 20px;
  font-weight: 500;
  color: #333;
  margin-bottom: 8px;
}

.product-price {
  font-size: 24px;
  color: #ff4d4f;
  font-weight: 500;
  margin-bottom: 16px;
}

.product-description {
  font-size: 14px;
  color: #666;
  line-height: 1.5;
}

.bottom-bar {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px;
  background: #fff;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding: 0 16px;
  box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.1);
}

.action-buttons {
  display: flex;
  gap: 12px;
}

.cart-btn {
  position: relative;
  width: 40px;
  height: 40px;
  border: none;
  background: #f5f5f5;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
}

.cart-count {
  position: absolute;
  top: -5px;
  right: -5px;
  background: #ff4d4f;
  color: #fff;
  font-size: 12px;
  padding: 2px 6px;
  border-radius: 10px;
  min-width: 18px;
  text-align: center;
}

.buy-now-btn {
  height: 40px;
  padding: 0 24px;
  background: #ff4d4f;
  color: #fff;
  border: none;
  border-radius: 20px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s;
}

.buy-now-btn:hover {
  background: #ff7875;
}
</style> 