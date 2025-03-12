<template>
  <div class="checkout-page">
    <!-- 页眉 -->
    <div class="checkout-header">
      <div class="back-btn" @click="router.back()">
        <i class="fas fa-chevron-left"></i>
      </div>
      <div class="header-title">确认订单</div>
    </div>

    <!-- 订单信息卡片 -->
    <div class="checkout-card order-info">
      <div class="card-title">• 订单信息</div>
      <div class="order-items">
        <div v-for="item in cartStore.items" :key="item.id" class="order-item">
          <img :src="item.image" :alt="item.name" class="item-image">
          <div class="item-info">
            <div class="item-name">{{ item.name }}</div>
            <div class="item-price">¥{{ item.price.toFixed(2) }}</div>
          </div>
        </div>
      </div>
    </div>

    <!-- 合计金额卡片 -->
    <div class="checkout-card total-amount">
      <div class="card-title">• 合计金额</div>
      <div class="total-price">¥{{ cartStore.totalAmount.toFixed(2) }}</div>
    </div>

    <!-- 支付方式卡片 -->
    <div class="checkout-card payment-method">
      <div class="card-title">• 支付方式</div>
      <div class="payment-option" @click="handlePayment">
        <van-icon name="service" size="28" class="payment-icon" />
        <div class="payment-name">人工支付</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { useCartStore } from '~/stores/cart'

const router = useRouter()
const cartStore = useCartStore()

const handlePayment = () => {
  // 跳转到客服页面
  window.location.href = 'http://154.196.128.135:8081/chatIndex?kefu_id=kefu2'
}
</script>

<style scoped>
.checkout-page {
  min-height: 100vh;
  background: #f5f5f5;
  padding-bottom: 20px;
}

.checkout-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 50px;
  background: #fff;
  display: flex;
  align-items: center;
  padding: 0 16px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  z-index: 100;
}

.back-btn {
  font-size: 20px;
  padding: 8px;
  cursor: pointer;
}

.header-title {
  flex: 1;
  text-align: center;
  font-size: 18px;
  font-weight: 500;
  margin-right: 40px;
}

.checkout-card {
  background: #fff;
  border-radius: 8px;
  margin: 12px;
  padding: 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.checkout-page .checkout-card:first-of-type {
  margin-top: 62px;
}

.card-title {
  font-size: 16px;
  font-weight: 500;
  color: #333;
  margin-bottom: 16px;
}

.order-items {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.order-item {
  display: flex;
  gap: 12px;
  padding: 8px;
  background: #f9f9f9;
  border-radius: 4px;
}

.item-image {
  width: 80px;
  height: 80px;
  object-fit: cover;
  border-radius: 4px;
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
}

.item-price {
  font-size: 16px;
  color: #ff4d4f;
  font-weight: 500;
}

.total-amount {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.total-price {
  font-size: 20px;
  color: #ff4d4f;
  font-weight: 500;
}

.payment-option {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  background: #f9f9f9;
  border-radius: 4px;
  cursor: pointer;
}

.payment-icon {
  color: #ff4d4f;
}

.payment-name {
  font-size: 14px;
  color: #333;
}
</style> 