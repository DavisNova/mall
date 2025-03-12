# 成人用品手机端商城

基于 Nuxt3 + MySQL 的成人用品移动端商城系统

## 项目概述

本项目是一个专注于成人用品销售的移动端商城系统，采用前后端分离架构。前端使用 Nuxt3 + Vant UI 开发，后端使用 MySQL 数据库存储数据。

### 技术栈

#### 前端技术
- 框架：Nuxt3 (Vue3 + TypeScript)
- UI组件：Vant UI (移动端组件库)
- 状态管理：Pinia
- 样式处理：UnoCSS
- 请求处理：Nuxt内置Fetch API

#### 后端技术
- 数据库：MySQL 8.0+
- 服务端：Nuxt Nitro Server
- API风格：RESTful
- 部署：Node.js + PM2

### 环境要求
- Node.js 16.0+
- MySQL 8.0+
- npm 或 yarn

## 项目结构

```bash
mall/
├── components/          # 公共组件
│   ├── layout/         # 布局组件
│   │   ├── Header.vue  # 页面头部
│   │   └── Footer.vue  # 页面底部
│   ├── product/        # 商品相关组件
│   │   ├── Card.vue    # 商品卡片
│   │   └── Detail.vue  # 商品详情
│   └── cart/           # 购物车组件
│       └── CartPopup.vue # 购物车弹窗
├── pages/              # 页面
│   ├── index.vue       # 首页
│   ├── cart.vue        # 购物车页
│   ├── checkout.vue    # 结算页
│   └── product/        # 商品相关页面
│       └── [id].vue    # 商品详情页
├── server/             # 服务端
│   ├── api/            # API接口
│   │   ├── products.ts # 商品接口
│   │   └── cart.ts     # 购物车接口
│   ├── db/            # 数据库配置
│   │   └── index.ts   # 数据库连接配置
│   └── models/        # 数据模型
│       ├── product.ts # 商品模型
│       └── cart.ts    # 购物车模型
├── stores/            # 状态管理
│   ├── cart.ts       # 购物车状态
│   └── product.ts    # 商品状态
├── types/            # TypeScript类型定义
│   └── index.ts     # 全局类型定义
└── assets/          # 静态资源
    └── css/        # 样式文件
        └── main.css # 全局样式

```

## 功能模块说明

### 1. 首页模块
- 顶部搜索栏
- 轮播图展示
- 商品分类导航
- 商品列表（双列瀑布流）
- 下拉刷新和上拉加载
- 底部导航栏

### 2. 商品模块
- 商品列表展示
- 商品详情页
- 商品分类筛选
- 价格排序
- 库存显示
- 加入购物车
- 立即购买

### 3. 购物车模块
- 购物车弹窗
- 商品数量调整
- 商品删除
- 价格计算
- 结算功能
- 购物车同步

### 4. 结算模块
- 确认订单信息
- 选择支付方式
- 订单提交
- 支付流程
- 订单状态跟踪

## 数据库设计

### 商品表 (products)
```sql
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL COMMENT '商品名称',
    price DECIMAL(10,2) NOT NULL COMMENT '商品价格',
    description TEXT COMMENT '商品描述',
    images JSON COMMENT '商品图片集',
    stock INT NOT NULL DEFAULT 0 COMMENT '库存',
    sales INT NOT NULL DEFAULT 0 COMMENT '销量',
    category_id BIGINT COMMENT '分类ID',
    status TINYINT DEFAULT 1 COMMENT '上架状态：0-下架，1-上架',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 订单表 (orders)
```sql
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_no VARCHAR(32) NOT NULL COMMENT '订单编号',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '订单总金额',
    status TINYINT DEFAULT 0 COMMENT '订单状态：0-待支付，1-已支付，2-已取消',
    payment_method TINYINT COMMENT '支付方式：1-在线支付，2-货到付款',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    paid_at TIMESTAMP NULL COMMENT '支付时间'
);
```

### 订单商品表 (order_items)
```sql
CREATE TABLE order_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL COMMENT '订单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    quantity INT NOT NULL COMMENT '购买数量',
    price DECIMAL(10,2) NOT NULL COMMENT '购买时价格'
);
```

## API接口设计

### 商品相关接口

1. 获取商品列表
```
GET /api/products
参数：
- page: 页码
- limit: 每页数量
- category_id: 分类ID（可选）
- sort: 排序方式（price_asc/price_desc/sales_desc）
```

2. 获取商品详情
```
GET /api/products/:id
```

3. 搜索商品
```
GET /api/products/search
参数：
- keyword: 搜索关键词
- page: 页码
- limit: 每页数量
```

### 购物车接口

1. 添加商品到购物车
```
POST /api/cart/add
参数：
- product_id: 商品ID
- quantity: 数量
```

2. 获取购物车列表
```
GET /api/cart
```

3. 更新购物车商品数量
```
PUT /api/cart/update
参数：
- product_id: 商品ID
- quantity: 新数量
```

4. 删除购物车商品
```
DELETE /api/cart/:product_id
```

### 订单接口

1. 创建订单
```
POST /api/orders
参数：
- products: 商品列表
- payment_method: 支付方式
```

2. 获取订单详情
```
GET /api/orders/:id
```

## 开发指南

### 1. 环境准备
```bash
# 克隆项目
git clone <repository_url>

# 安装依赖
npm install

# 配置环境变量
cp .env.example .env
```

### 2. 数据库配置
1. 创建数据库
```sql
CREATE DATABASE mall_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

2. 导入数据表
```bash
mysql -u root -p mall_db < server/db/init.sql
```

### 3. 开发服务器
```bash
# 启动开发服务器
npm run dev
```

### 4. 生产部署
```bash
# 构建项目
npm run build

# 启动服务
npm run start

# 使用PM2部署
pm2 start npm --name "mall" -- start
```

## 移动端适配注意事项

1. 视口配置
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
```

2. 样式适配
- 使用 rem/vw 作为单位
- 避免使用固定宽度
- 考虑不同机型的安全区域

3. 交互优化
- 适当增大点击区域
- 添加触摸反馈
- 优化滚动性能

4. 性能优化
- 图片懒加载
- 组件按需加载
- 合理使用缓存

## 安全注意事项

1. 数据安全
- 敏感信息加密存储
- 使用参数化查询
- 定期数据备份

2. 接口安全
- 添加请求签名
- 限制请求频率
- 验证数据完整性

3. 内容安全
- 图片鉴黄处理
- 敏感词过滤
- 访问权限控制

4. 运行安全
- 定期更新依赖
- 监控系统状态
- 记录关键日志

## 错误处理

1. 前端错误
- 网络请求超时
- 数据加载失败
- 页面渲染异常

2. 后端错误
- 数据库连接失败
- 接口调用异常
- 服务器资源不足

3. 业务错误
- 库存不足
- 订单创建失败
- 支付异常

## 维护和更新

1. 日常维护
- 监控系统运行状态
- 处理用户反馈
- 修复已知问题

2. 功能更新
- 新功能开发计划
- 性能优化方案
- 用户体验改进

3. 版本发布
- 更新文档
- 备份数据
- 灰度发布

## 联系方式

如有问题或建议，请联系：
- 技术支持：support@example.com
- 项目负责人：admin@example.com
