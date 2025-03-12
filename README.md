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
│   │   ├── cart.ts     # 购物车接口
│   │   ├── banners.ts  # 轮播图接口
│   │   └── test.ts     # 测试接口
│   ├── db/            # 数据库配置
│   │   ├── init.sql   # 数据库初始化
│   │   ├── test-data.sql # 测试数据
│   │   └── update-images.sql # 图片更新脚本
├── stores/            # 状态管理
│   └── cart.ts       # 购物车状态
├── public/           # 公共资源
│   ├── customer-service.svg # 客服图标
│   ├── payment-manual.svg   # 支付图标
│   ├── favicon.ico         # 网站图标
│   └── robots.txt         # 爬虫配置
└── assets/           # 静态资源
    └── css/         # 样式文件
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
- 购物车图标动画效果
- 商品数量实时更新

### 4. 结算模块
- 确认订单信息
- 选择支付方式
- 订单提交
- 支付流程
- 订单状态跟踪
- 支付方式选择界面
- 订单确认动画

### 5. 客服系统
- 在线客服咨询
- 客服图标显示
- 聊天窗口弹出
- 移动端适配
- 实时对话功能
- 客服状态显示
- 会话保持功能

## 最新更新功能

### 1. 在线客服系统
- 集成第三方客服系统
- 自定义客服按钮样式
- 响应式聊天窗口
- 支持移动端显示
- 聊天窗口动画效果
- 遮罩层交互
- 会话状态管理

### 2. UI/UX优化
- 优化移动端适配
- 添加转场动画
- 优化加载状态
- 完善错误提示
- 优化页面布局
- 增强用户交互体验

### 3. 性能优化
- 延迟加载优化
- 组件按需加载
- 图片懒加载
- 缓存优化
- 请求优化

## 开发指南

### 1. 环境准备
```bash
# 克隆项目
git clone https://github.com/DavisNova/mall.git

# 安装依赖
npm install

# 配置环境变量
cp .env.example .env
```

### 2. 开发服务器
```bash
# 启动开发服务器
npm run dev
```

### 3. 生产部署
```bash
# 构建项目
npm run build

# 启动服务
npm run start
```

### 4. 项目配置
- 在 `nuxt.config.ts` 中配置项目参数
- 在 `.env` 文件中配置环境变量
- 在 `app.vue` 中配置全局样式和组件

## 注意事项
1. 确保 Node.js 版本 >= 16.0
2. 开发时注意移动端适配
3. 注意API接口的跨域配置
4. 关注性能优化
5. 保持代码规范

## 更新日志

### 2024-03-12
- 新增在线客服系统
- 优化移动端显示效果
- 完善项目文档
- 修复已知问题

### 2024-03-11
- 初始化项目结构
- 完成基础功能开发
- 添加购物车功能
- 集成支付系统

## 贡献指南
1. Fork 本仓库
2. 创建特性分支
3. 提交代码
4. 创建 Pull Request

## 许可证
MIT License

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

## 部署指南

### PM2 部署方式

PM2 是一个进程管理工具，可以帮助您管理和保持应用程序的运行。

#### 1. 安装 PM2
```bash
# 全局安装 PM2
npm install -g pm2
```

#### 2. 使用 PM2 启动项目
```bash
# 进入项目目录
cd /root/mall

# 启动开发服务器
pm2 start "npm run dev" --name "mall-dev" -- --host 0.0.0.0 --port 3000

# 查看运行状态
pm2 status
```

#### 3. 配置自动启动
```bash
# 生成并配置 PM2 启动脚本
pm2 startup

# 保存当前进程列表
pm2 save
```

#### 4. PM2 常用命令
```bash
# 查看应用状态
pm2 status

# 查看应用日志
pm2 logs mall-dev

# 重启应用
pm2 restart mall-dev

# 停止应用
pm2 stop mall-dev

# 删除应用
pm2 delete mall-dev
```

#### 5. 注意事项
- 确保使用正确的主机和端口配置
- 使用 `pm2 logs` 命令查看错误信息
- 使用 `pm2 save` 保存新的进程配置
- 服务器重启后，PM2 会自动启动已保存的应用

### 开发模式切换

在开发过程中，可以灵活切换between PM2 和直接运行：

1. 使用 PM2（后台运行）：
```bash
pm2 start "npm run dev" --name "mall-dev" -- --host 0.0.0.0 --port 3000
```

2. 直接运行（前台运行）：
```bash
# 如果 PM2 正在运行，先停止它
pm2 stop mall-dev

# 直接启动开发服务器
npm run dev
```
