<template>
  <div id="app">
    <NuxtPage />
    <div v-if="showChatButton" class="chat-button" @click="openChat">
      <van-icon name="service" size="28" />
      <span class="chat-text">在线咨询</span>
    </div>
    <div v-if="showChatWindow" class="chat-window">
      <iframe 
        :src="'http://154.196.128.135:8081/chatIndex?kefu_id=kefu2'" 
        frameborder="0"
        class="chat-iframe"
      ></iframe>
      <div class="close-chat" @click="closeChat">×</div>
    </div>
    <div v-if="showChatWindow" class="chat-mask" @click="closeChat"></div>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'

const showChatButton = ref(true)
const showChatWindow = ref(false)

// 移除默认按钮
const removeDefaultButton = () => {
  const defaultButtons = document.querySelectorAll('#kefu-icon, .kefu-bottom')
  defaultButtons.forEach(button => {
    if(button) button.remove()
  })
}

// 打开聊天窗口
const openChat = () => {
  showChatWindow.value = true
}

// 关闭聊天窗口
const closeChat = () => {
  showChatWindow.value = false
}

// 初始化聊天功能
const initChat = () => {
  try {
    (function(a, b, c, d) {
      let h = b.getElementsByTagName('head')[0]
      let s = b.createElement('script')
      s.type = 'text/javascript'
      s.src = c + "/static/js/kefu-front.js"
      s.onload = s.onreadystatechange = function () {
        if (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") {
          d(c)
        }
      }
      h.appendChild(s)
    })(window, document, "http://154.196.128.135:8081", function(u) {
      window.KEFU.init({
        KEFU_URL: u,
        KEFU_KEFU_ID: "kefu2",
        SHOW_CHAT_BUTTON: false,  // 隐藏默认的聊天按钮
        AUTO_SHOW: false          // 不自动显示聊天窗口
      })
      // 初始化后移除默认按钮
      setTimeout(removeDefaultButton, 500)
    })
  } catch (error) {
    console.error('初始化客服功能失败:', error)
  }
}

onMounted(() => {
  // 延迟初始化，避免页面加载时的性能影响
  setTimeout(initChat, 1000)
  // 定期检查并移除默认按钮
  setInterval(removeDefaultButton, 100)
})
</script>

<style>
html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: transparent;
}

body {
  margin: 0;
  padding: 0;
  background-color: #f5f5f5;
}

#app {
  width: 100%;
  min-height: 100vh;
}

/* 隐藏默认的客服按钮 */
#kefu-icon {
  display: none !important;
}

.kefu-bottom {
  display: none !important;
}

/* 聊天按钮样式 */
.chat-button {
  position: fixed;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
  padding: 12px;
  background: #1890ff;
  color: #fff;
  border-radius: 12px 0 0 12px;
  box-shadow: 0 2px 8px rgba(24, 144, 255, 0.3);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  z-index: 99;
  transition: all 0.3s;
}

.chat-button:hover {
  transform: translateY(-50%) translateX(-5px);
  box-shadow: 0 4px 12px rgba(24, 144, 255, 0.4);
}

.chat-text {
  font-size: 14px;
  font-weight: 500;
  writing-mode: vertical-lr;
  text-orientation: upright;
  letter-spacing: 4px;
}

/* 聊天窗口样式 */
.chat-window {
  position: fixed;
  right: 20px;
  bottom: 20px;
  width: 400px;
  height: 600px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
  z-index: 1000;
  overflow: hidden;
  animation: slideIn 0.3s ease-out;
}

.chat-iframe {
  width: 100%;
  height: 100%;
  border: none;
}

.close-chat {
  position: absolute;
  top: 10px;
  right: 10px;
  width: 30px;
  height: 30px;
  background: rgba(0, 0, 0, 0.3);
  color: #fff;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-size: 20px;
  transition: background 0.3s;
}

.close-chat:hover {
  background: rgba(0, 0, 0, 0.5);
}

.chat-mask {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.3);
  z-index: 999;
}

@keyframes slideIn {
  from {
    transform: translateX(100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

@media (max-width: 768px) {
  .chat-window {
    right: 0;
    bottom: 0;
    width: 100%;
    height: 75vh;
    border-radius: 16px 16px 0 0;
  }
}
</style>
