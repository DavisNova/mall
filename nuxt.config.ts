// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },
  modules: [
    '@vant/nuxt',
    '@pinia/nuxt',
  ],
  css: [
    '@unocss/reset/tailwind.css',
    '~/assets/css/main.css',
  ],
  vant: {
    importStyle: true,
  },
  runtimeConfig: {
    public: {
      apiBase: process.env.NUXT_PUBLIC_API_BASE || '/api'
    },
    mysql: {
      host: '103.186.112.193',
      port: 3306,
      username: 'root',
      password: 'root',
      database: 'mall_db'
    }
  },
  nitro: {
    routeRules: {
      '/api/**': {
        cors: true,
        headers: {
          'Access-Control-Allow-Methods': 'GET,HEAD,PUT,PATCH,POST,DELETE',
          'Access-Control-Allow-Origin': '*'
        }
      }
    }
  },
  devServer: {
    port: 3000,
    host: '0.0.0.0'
  },
  vite: {
    server: {
      hmr: false
    }
  }
})
