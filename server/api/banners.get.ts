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
      'SELECT b.*, p.name as product_name FROM banners b LEFT JOIN products p ON b.product_id = p.id WHERE b.status = 1 ORDER BY b.sort ASC'
    )

    await connection.end()
    
    return {
      code: 0,
      data: Array.isArray(rows) ? rows : [],
      message: 'success'
    }
  } catch (error: any) {
    console.error('Error fetching banners:', error)
    return {
      code: 500,
      data: null,
      message: error.message || '获取轮播图列表失败'
    }
  }
}) 