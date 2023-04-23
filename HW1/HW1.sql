USE mobile_phones;
SELECT * FROM stock_assortment WHERE product_count > 2;
SELECT * FROM stock_assortment WHERE manufacturer = "Samsung";
SELECT * FROM stock_assortment WHERE product_name LIKE"iPhone%";
SELECT * FROM stock_assortment WHERE manufacturer LIKE "Samsung%";
SELECT * FROM stock_assortment WHERE product_name REGEXP '[0-9]';
SELECT * FROM stock_assortment WHERE product_name LIKE '%8%';