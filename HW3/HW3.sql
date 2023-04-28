USE lesson_1;

CREATE TABLE salespeople (
snum INT,
sname VARCHAR(45),
city VARCHAR(45),
comm VARCHAR(45)
);

INSERT INTO salespeople (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');

SELECT * FROM salespeople;

CREATE TABLE customers (
cnum INT,
cname VARCHAR(45),
city VARCHAR(45),
rating INT,
snum INT
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
(1001, 'Hoffman', 'London', 100, 1001),
(1002, 'Giovanni', 'Rome', 200, 1003),
(1003, 'Liu', 'San Jose', 200, 1002),
(1004, 'Grass', 'Berlin', 300, 1002),
(1006, 'Clemens', 'London', 100, 1001),
(1008, 'Cisneros', 'San Jose', 300, 1007),
(1007, 'Pereira', 'Rome', 100, 1004);

SELECT * FROM customers;

CREATE TABLE orders (
onum INT,
amt DOUBLE(8,2),
odate DATE,
cnum INT,
snum INT
);

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

SELECT * FROM orders;

/*
Домашнее задание
1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname,
snum, comm. (к первой или второй таблице, используя SELECT)
2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем
каждого заказчика в городе San Jose. (“заказчики”)
3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без
каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparisonfunctions.
html
5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
(“Заказы”, “amt” - сумма)
6. Напишите запрос который выбрал бы наименьшую сумму заказа.
(Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых
рейтинг больше 100 и они находятся не в Риме.
*/

-- 1
SELECT city, sname, snum, comm
FROM salespeople;

-- 2
SELECT rating, cname, city
FROM customers
WHERE city = 'San Jose';

-- 3
SELECT DISTINCT snum as unicsnum FROM orders;

-- 4
SELECT * FROM customers 
WHERE cname LIKE 'G%';

-- 5
SELECT onum, SUM(amt) as sum
FROM orders
GROUP BY onum
HAVING sum > 1000;

-- 6
SELECT MIN(amt) FROM orders; 

-- 7
SELECT * FROM customers
WHERE rating > '100' AND city != 'Rome';

/*
Таблица для работы (из классной работы)
1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с
наибольшей заработной платой (возможен подзапрос)
3. Выполните группировку всех сотрудников по специальности ,
суммарная зарплата которых превышает 100000
*/

-- 1
SELECT * FROM staff ORDER BY salary DESC;
SELECT * FROM staff ORDER BY salary;

-- 2
SELECT * FROM staff ORDER BY salary;
SELECT * FROM staff ORDER BY salary DESC LIMIT 5;

-- 3
SELECT post, SUM(salary) as sum
FROM staff
GROUP BY post
HAVING sum > 10000;


