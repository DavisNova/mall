import { defineEventHandler } from 'h3'
import mysql from 'mysql2/promise'

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()
  
  try {
    const connection = await mysql.createConnection({
      host: 'localhost',  // 使用localhost而不是IP
      port: 3306,
      user: 'root',
      password: 'root',
      database: 'mall_db'
    })

    const [version] = await connection.execute('SELECT VERSION()')
    const [products] = await connection.execute('SELECT COUNT(*) as count FROM products')
    const [banners] = await connection.execute('SELECT COUNT(*) as count FROM banners')

    await connection.end()
    
    return {
      code: 0,
      data: {
        version,
        products,
        banners
      },
      message: 'success'
    }
  } catch (error: any) {
    console.error('Database test error:', error)
    return {
      code: 500,
      data: null,
      message: error.message
    }
  }
}) 