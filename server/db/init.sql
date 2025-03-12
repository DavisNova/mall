-- 创建数据库
CREATE DATABASE IF NOT EXISTS mall_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE mall_db;

-- 创建商品表
CREATE TABLE IF NOT EXISTS products (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- 创建轮播图表
CREATE TABLE IF NOT EXISTS banners (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL COMMENT '图片URL',
    product_id BIGINT COMMENT '关联商品ID',
    sort INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轮播图表';

-- 创建分类表
CREATE TABLE IF NOT EXISTS categories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL COMMENT '分类名称',
    sort INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态：0-禁用，1-启用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- 插入测试数据
INSERT INTO categories (name, sort) VALUES 
('情趣用品', 1),
('男用玩具', 2),
('女用玩具', 3);

-- 插入测试商品
INSERT INTO products (name, price, description, images, stock, category_id) VALUES
('测试商品1', 188.00, '商品描述1', '["image1.jpg", "image2.jpg"]', 100, 1),
('测试商品2', 288.00, '商品描述2', '["image3.jpg", "image4.jpg"]', 50, 2);

-- 插入测试轮播图
INSERT INTO banners (image_url, product_id, sort) VALUES
('banner1.jpg', 1, 1),
('banner2.jpg', 2, 2); 