import { defineEventHandler } from 'h3'
import mysql from 'mysql2/promise'

export default defineEventHandler(async (event) => {
  try {
    const connection = await mysql.createConnection({
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'root',
      database: 'mall_db'
    })

    const [rows] = await connection.execute(
      'SELECT p.*, c.name as category_name FROM products p LEFT JOIN categories c ON p.category_id = c.id WHERE p.status = 1 ORDER BY p.created_at DESC'
    )

    await connection.end()

    // 处理JSON字符串为数组
    const products = Array.isArray(rows) ? rows.map((product: any) => {
      try {
        return {
          ...product,
          images: typeof product.images === 'string' ? JSON.parse(product.images) : product.images
        }
      } catch (e) {
        console.error('Error parsing product images:', e)
        return {
          ...product,
          images: []
        }
      }
    }) : []
    
    return {
      code: 0,
      data: products,
      message: 'success'
    }
  } catch (error: any) {
    console.error('Error fetching products:', error)
    return {
      code: 500,
      data: null,
      message: error.message || '获取商品列表失败'
    }
  }
}) 