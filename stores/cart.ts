import { defineStore } from 'pinia'

interface CartItem {
  id: string
  name: string
  price: number
  image: string
}

export const useCartStore = defineStore('cart', {
  state: () => ({
    items: [] as CartItem[]
  }),
  
  getters: {
    totalAmount: (state) => {
      return state.items.reduce((total, item) => total + item.price, 0)
    }
  },
  
  actions: {
    addItem(item: CartItem) {
      this.items.push(item)
    },
    
    clearCart() {
      this.items = []
    }
  }
}) 