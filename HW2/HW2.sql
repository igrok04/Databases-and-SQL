USE lesson_1;
/*
1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными
id order_date count_product
1 2022-01-01 156
2 2022-01-02 180
3 2022-01-03 21
4 2022-01-04 124
5 2022-01-05 341
*/

CREATE TABLE sales(
    id SERIAL PRIMARY KEY,    -- SERIAL = NOT NULL AI UNIQUE
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

SELECT * FROM sales;

INSERT INTO sales(order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

/*
2. Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ

id заказа Тип заказа
1 Средний заказ
2 Средний заказ
3 Маленький заказ
4 Средний заказ
5 Большой заказ
*/
SELECT id,
CASE
WHEN count_product < 100 THEN "Маленький заказ"
WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
WHEN count_product > 300 THEN "Большой заказ"
END AS 'Тип заказа'

FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями

id employee_id amount order_status
1 e03 15.00 OPEN
2 e01 25.50 OPEN
3 e05 100.70 CLOSED
4 e02 22.18 OPEN
5 e04 9.50 CANCELLED
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,    -- SERIAL = NOT NULL AI UNIQUE
    employee_id VARCHAR(3) NOT NULL,
    amount DOUBLE(5,2) NOT NULL,
    order_status VARCHAR(9) NOT NULL
);

INSERT INTO orders(employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

# Неоднозначно понял задание, поэтому сделал два варианта:
-- 1:
SELECT id, employee_id, amount, order_status,
    CASE order_status
        WHEN 'OPEN' THEN 'Order is in open state'
        WHEN 'CLOSED' THEN 'Order is closed'
        WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS "full_order_status" 
FROM orders;

-- 2:
SELECT id, 
    CASE order_status
        WHEN 'OPEN' THEN 'Order is in open state'
        WHEN 'CLOSED' THEN 'Order is closed'
        WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS "full_order_status" 
FROM orders;

# 4
/*
0 - это число, NULL - это пустая ячейка(отсутствующий какой-либо символ в ячейке)
*/