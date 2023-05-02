USE lesson_6;

CREATE TABLE Cars
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    cost INT NOT NULL
);

INSERT INTO Cars (name, cost) VALUES ('Audi', 52642);
INSERT INTO Cars (name, cost) VALUES ('Mercedes', 57127);
INSERT INTO Cars (name, cost) VALUES ('Skoda', 9000);
INSERT INTO Cars (name, cost) VALUES ('Volvo', 29000);
INSERT INTO Cars (name, cost) VALUES ('Bentley', 350000);
INSERT INTO Cars (name, cost) VALUES ('Citroen', 21000);
INSERT INTO Cars (name, cost) VALUES ('Hummer', 41400);
INSERT INTO Cars (name, cost) VALUES ('Volkswagen', 21600);	

SELECT * FROM Cars;

/*
Домашнее задание 1
mysql> SELECT * FROM Cars;
+----+------------+--------+
| Id | Name | Cost |
+----+------------+--------+
| 1 | Audi | 52642 |
| 2 | Mercedes | 57127 |
| 3 | Skoda | 9000 |
| 4 | Volvo | 29000 |
| 5 | Bentley | 350000 |
| 6 | Citroen | 21000 |
| 7 | Hummer | 41400 |
| 8 | Volkswagen | 21600 |
+----+------------+--------+
1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 
долларов (используя оператор ALTER VIEW) 
3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/

-- 1 
CREATE VIEW cars_1_1 AS
SELECT * FROM Cars
WHERE cost < 25000;

SELECT * FROM cars_1_1;

-- 2
ALTER VIEW cars_1_1 AS
SELECT * FROM Cars
WHERE cost < 30000;

SELECT * FROM cars_1_1;

-- 3
CREATE VIEW cars_1_3 AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";

SELECT * FROM cars_1_1;

/*
Домашнее задание 2
Вывести название и цену для всех анализов, которые продавались 5 февраля 
2020 и всю следующую неделю.
Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.
Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.
Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа.
*/
CREATE TABLE Analysis
(
	an_id INT AUTO_INCREMENT PRIMARY KEY,
    an_name VARCHAR(30) NOT NULL,
    an_cost INT NOT NULL,
    an_price INT NOT NULL,
    an_group VARCHAR(30) NOT NULL
);

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES ('A', '1', '2', 'X');
INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES ('B', '2', '4', 'Y');
INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES ('C', '3', '6', 'Z');
INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES ('A', '2', '4', 'X');
INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES ('B', '3', '6', 'Z');

SELECT * FROM Analysis;

CREATE TABLE Groups1
(
	gr_id INT AUTO_INCREMENT PRIMARY KEY,
    gr_name VARCHAR(30) NOT NULL,
    gr_temp VARCHAR(4) NOT NULL
);

INSERT INTO Groups1 (gr_name, gr_temp) VALUES ('A', '-5');
INSERT INTO Groups1 (gr_name, gr_temp) VALUES ('B', '0');
INSERT INTO Groups1 (gr_name, gr_temp) VALUES ('C', '5');

SELECT * FROM Groups1;

CREATE TABLE Orders
(
	ord_id INT AUTO_INCREMENT PRIMARY KEY,
    ord_datetime DATETIME NOT NULL,
    ord_an VARCHAR(10) NOT NULL
);

INSERT INTO Orders (ord_datetime, ord_an) VALUES ('2020-02-03 09:09:09', '11111');
INSERT INTO Orders (ord_datetime, ord_an) VALUES ('2020-02-05 10:10:10', '22222');
INSERT INTO Orders (ord_datetime, ord_an) VALUES ('2020-02-07 11:11:11', '33333');
INSERT INTO Orders (ord_datetime, ord_an) VALUES ('2020-02-10 12:12:12', '44444');
INSERT INTO Orders (ord_datetime, ord_an) VALUES ('2020-02-15 13:13:13', '55555');

SELECT * FROM Orders;

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';

/*
Домашнее задание 3
Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы 
вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции 
LEAD . Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить 
результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу 
после нее.
*/
CREATE TABLE stations
(
train_id INT NOT NULL,
station varchar(20) NOT NULL,
station_time TIME NOT NULL
);
INSERT stations(train_id, station, station_time)
VALUES (110, "SanFrancisco", "10:00:00"),
(110, "Redwood Sity", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "SanFrancisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

SELECT * FROM stations;

SELECT train_id, station, station_time,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM stations;

SELECT * FROM stations;




