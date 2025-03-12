USE mall_db;

-- 更新商品图片为实际可访问的图片URL
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+1", "https://via.placeholder.com/400x400?text=Product+1-2"]' WHERE id = 1;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+2", "https://via.placeholder.com/400x400?text=Product+2-2"]' WHERE id = 2;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+3", "https://via.placeholder.com/400x400?text=Product+3-2"]' WHERE id = 3;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+4", "https://via.placeholder.com/400x400?text=Product+4-2"]' WHERE id = 4;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+5", "https://via.placeholder.com/400x400?text=Product+5-2"]' WHERE id = 5;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+6", "https://via.placeholder.com/400x400?text=Product+6-2"]' WHERE id = 6;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+7", "https://via.placeholder.com/400x400?text=Product+7-2"]' WHERE id = 7;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+8", "https://via.placeholder.com/400x400?text=Product+8-2"]' WHERE id = 8;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+9", "https://via.placeholder.com/400x400?text=Product+9-2"]' WHERE id = 9;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+10", "https://via.placeholder.com/400x400?text=Product+10-2"]' WHERE id = 10;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+11", "https://via.placeholder.com/400x400?text=Product+11-2"]' WHERE id = 11;
UPDATE products SET images = '["https://via.placeholder.com/400x400?text=Product+12", "https://via.placeholder.com/400x400?text=Product+12-2"]' WHERE id = 12;

-- 更新轮播图为实际可访问的图片URL
UPDATE banners SET image_url = 'https://via.placeholder.com/800x400?text=Banner+1' WHERE id = 1;
UPDATE banners SET image_url = 'https://via.placeholder.com/800x400?text=Banner+2' WHERE id = 2;
UPDATE banners SET image_url = 'https://via.placeholder.com/800x400?text=Banner+3' WHERE id = 3;
UPDATE banners SET image_url = 'https://via.placeholder.com/800x400?text=Banner+4' WHERE id = 4;
UPDATE banners SET image_url = 'https://via.placeholder.com/800x400?text=Banner+5' WHERE id = 5; 