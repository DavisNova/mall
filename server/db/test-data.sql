USE mall_db;

-- 清空现有数据
TRUNCATE TABLE categories;
TRUNCATE TABLE products;
TRUNCATE TABLE banners;

-- 插入商品分类
INSERT INTO categories (name, sort) VALUES 
('女性用品', 1),
('男性用品', 2),
('情趣内衣', 3),
('夫妻用品', 4),
('润滑用品', 5),
('安全套', 6);

-- 插入商品数据
INSERT INTO products (name, price, description, images, stock, sales, category_id, status) VALUES
-- 女性用品
('蝴蝶按摩器', 299.00, '静音防水设计，USB充电，多频震动，舒适安全', '["https://img.example.com/product1-1.jpg", "https://img.example.com/product1-2.jpg"]', 100, 258, 1, 1),
('魔法棒按摩器', 399.00, '无线遥控，静音设计，多种模式切换，安全硅胶材质', '["https://img.example.com/product2-1.jpg", "https://img.example.com/product2-2.jpg"]', 80, 186, 1, 1),

-- 男性用品
('飞机杯', 268.00, '真实体验，环保材质，清洗方便', '["https://img.example.com/product3-1.jpg", "https://img.example.com/product3-2.jpg"]', 150, 325, 2, 1),
('前列腺按摩器', 358.00, '医疗级硅胶，防水设计，多频震动', '["https://img.example.com/product4-1.jpg", "https://img.example.com/product4-2.jpg"]', 60, 142, 2, 1),

-- 情趣内衣
('性感蕾丝睡裙', 128.00, '舒适面料，性感透视，多色可选', '["https://img.example.com/product5-1.jpg", "https://img.example.com/product5-2.jpg"]', 200, 467, 3, 1),
('制服诱惑套装', 168.00, '角色扮演，优质面料，尺码齐全', '["https://img.example.com/product6-1.jpg", "https://img.example.com/product6-2.jpg"]', 150, 289, 3, 1),

-- 夫妻用品
('情趣骰子', 29.90, '增进情趣，PVC材质，无毒无害', '["https://img.example.com/product7-1.jpg", "https://img.example.com/product7-2.jpg"]', 500, 1256, 4, 1),
('情趣眼罩', 39.90, '柔软舒适，弹性可调，遮光效果好', '["https://img.example.com/product8-1.jpg", "https://img.example.com/product8-2.jpg"]', 300, 867, 4, 1),

-- 润滑用品
('水溶性润滑液', 69.00, '水溶性配方，安全无刺激，容易清洗', '["https://img.example.com/product9-1.jpg", "https://img.example.com/product9-2.jpg"]', 400, 958, 5, 1),
('果味润滑啫喱', 88.00, '多种水果香型，安全食用级，持久润滑', '["https://img.example.com/product10-1.jpg", "https://img.example.com/product10-2.jpg"]', 300, 756, 5, 1),

-- 安全套
('超薄安全套', 99.00, '001超薄系列，润滑舒适，安全可靠', '["https://img.example.com/product11-1.jpg", "https://img.example.com/product11-2.jpg"]', 1000, 2365, 6, 1),
('颗粒安全套', 108.00, '颗粒设计，增加刺激，润滑充足', '["https://img.example.com/product12-1.jpg", "https://img.example.com/product12-2.jpg"]', 800, 1687, 6, 1);

-- 插入轮播图数据
INSERT INTO banners (image_url, product_id, sort, status) VALUES
('https://img.example.com/banner1.jpg', 1, 1, 1),  -- 女性用品促销
('https://img.example.com/banner2.jpg', 3, 2, 1),  -- 男性用品特惠
('https://img.example.com/banner3.jpg', 5, 3, 1),  -- 情趣内衣新品
('https://img.example.com/banner4.jpg', 9, 4, 1),  -- 润滑用品折扣
('https://img.example.com/banner5.jpg', 11, 5, 1); -- 安全套活动

-- 更新一些商品的销量和库存
UPDATE products SET sales = sales + FLOOR(RAND() * 100) WHERE id > 0;
UPDATE products SET stock = stock - FLOOR(RAND() * 50) WHERE id > 0; 