USE lesson_1;

/*Табличка:
https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing
*/

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

-- AUTO
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM auto;

/*
1.Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA
2.Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 - BMW и 80 машин другой марки , AUDI - 30 и 70 машин другой 
марки, LADA - 15, 85 авто другой марки
*/

SELECT MARK, color, COUNT(color) AS 'Quantity of cars' FROM AUTO
WHERE MARK = 'LADA'
GROUP BY color, mark 
UNION SELECT MARK, color, COUNT(color) AS 'Quantity of cars' FROM AUTO
WHERE MARK = 'BMW'
GROUP BY color, mark;

SELECT MARK, COUNT(*) AS COUNT_MARK,
(SELECT COUNT(*) FROM AUTO WHERE MARK != a.MARK) AS COUNT_OTHER_MARK
FROM AUTO AS a
GROUP BY MARK;

/*Задание №3.
Даны 2 таблицы, созданные следующим образом:
*/
CREATE TABLE test_a (id INT, test varchar(10));
CREATE TABLE test_b (id INT);
INSERT INTO test_a(id, test) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
INSERT INTO test_b(id) VALUES
(10),
(30),
(50);

SELECT * FROM test_a;
SELECT * FROM test_b;

/*
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в 
таблице test_b, НЕ используя ключевого слова NOT.
*/

SELECT * FROM test_a 
LEFT JOIN test_b 
USING(id) 
WHERE test_b.id IS NULL;

