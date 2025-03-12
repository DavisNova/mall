<template>
  <div class="cart-popup">
    <div class="cart-header">
      <span>购物车</span>
      <div class="close-btn" @click="$emit('close')">×</div>
    </div>
    
    <div class="cart-items">
      <div v-for="item in cartStore.items" :key="item.id" class="cart-item">
        <img :src="item.image" :alt="item.name" class="item-image">
        <div class="item-info">
          <div class="item-name">{{ item.name }}</div>
          <div class="item-price">¥{{ item.price.toFixed(2) }}</div>
        </div>
      </div>
    </div>
    
    <div class="cart-footer">
      <div class="total">
        <span>合计：</span>
        <span class="total-price">¥{{ cartStore.totalAmount.toFixed(2) }}</span>
      </div>
      <button class="checkout-btn" @click="handleCheckout">立即下单</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { navigateTo } from '#app'
import { useCartStore } from '~/stores/cart'

const cartStore = useCartStore()
const emit = defineEmits(['close'])

const handleCheckout = async () => {
  try {
    // 先关闭弹窗
    emit('close')
    
    // 直接跳转到结算页面
    await navigateTo('/checkout', {
      replace: true
    })
  } catch (error) {
    console.error('导航错误：', error)
    // 如果导航失败，使用最基础的跳转方式
    window.location.href = '/checkout'
  }
}
</script>

<style scoped>
.cart-popup {
  position: fixed;
  right: 0;
  bottom: 0;
  width: 100%;
  max-height: 85vh;
  background: #fff;
  border-radius: 16px 16px 0 0;
  box-shadow: 0 -2px 12px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  z-index: 1000;
  animation: slideUp 0.3s ease-out;
}

@keyframes slideUp {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0);
  }
}

.cart-header {
  padding: 16px;
  border-bottom: 1px solid #f0f0f0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative;
}

.cart-header::after {
  content: '';
  position: absolute;
  top: 8px;
  left: 50%;
  transform: translateX(-50%);
  width: 40px;
  height: 4px;
  background: #e0e0e0;
  border-radius: 2px;
}

.close-btn {
  font-size: 24px;
  cursor: pointer;
  color: #999;
  padding: 8px;
  margin: -8px;
}

.cart-items {
  flex: 1;
  overflow-y: auto;
  padding: 16px;
  -webkit-overflow-scrolling: touch;
}

.cart-item {
  display: flex;
  gap: 12px;
  padding: 12px;
  border-bottom: 1px solid #f0f0f0;
}

.item-image {
  width: 60px;
  height: 60px;
  object-fit: cover;
  border-radius: 8px;
}

.item-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.item-name {
  font-size: 14px;
  color: #333;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.item-price {
  font-size: 16px;
  color: #ff4d4f;
  font-weight: 500;
}

.cart-footer {
  padding: 16px;
  border-top: 1px solid #f0f0f0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fff;
  position: sticky;
  bottom: 0;
  box-shadow: 0 -1px 4px rgba(0, 0, 0, 0.05);
}

.total {
  font-size: 14px;
  color: #333;
}

.total-price {
  font-size: 18px;
  color: #ff4d4f;
  font-weight: 500;
  margin-left: 4px;
}

.checkout-btn {
  height: 44px;
  padding: 0 32px;
  background: #ff4d4f;
  color: #fff;
  border: none;
  border-radius: 22px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s;
  -webkit-tap-highlight-color: transparent;
}

.checkout-btn:active {
  background: #ff7875;
  transform: scale(0.98);
}

@media (max-width: 768px) {
  .cart-popup {
    width: 100%;
  }
  
  .cart-header {
    padding: 12px 16px;
  }
  
  .cart-items {
    padding: 12px;
  }
  
  .cart-footer {
    padding: 12px 16px;
    padding-bottom: calc(12px + env(safe-area-inset-bottom));
  }
}
</style> 