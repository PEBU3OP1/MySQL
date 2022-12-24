-- создаем новую БД
CREATE DATABASE hw5db;
USE hw5db;

-- создаем таблице auto
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

-- заполняем данными из файла
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- дорабатываем поскольку нет нужных полей
ALTER TABLE auto ADD COLUMN PRICE INT;
UPDATE auto SET PRICE = 20000 WHERE (REGNUM = '111113');
UPDATE auto SET PRICE = 30000 WHERE (REGNUM = '111114');
UPDATE auto SET PRICE = 22000 WHERE (REGNUM = '111115');
UPDATE auto SET PRICE = 21000 WHERE (REGNUM = '111116');
UPDATE auto SET PRICE = 35000 WHERE (REGNUM = '111117');
UPDATE auto SET PRICE = 33000 WHERE (REGNUM = '111119');
UPDATE auto SET PRICE = 50000 WHERE (REGNUM = '111121');
UPDATE auto SET PRICE = 60000 WHERE (REGNUM = '111122');
UPDATE auto SET PRICE = 10000 WHERE (REGNUM = '111126');

-- делаем представление
CREATE VIEW new_car AS
SELECT * FROM AUTO
WHERE PRICE < 25000;
-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
-- ИЗМЕНИЛ ЗНАК, ЧТОБЫ РЕЗ-Т БЫЛ ДРУГОЙ
ALTER VIEW new_car AS
SELECT * FROM AUTO
WHERE PRICE > 25000
-- ПРОВЕРКА
SELECT * FROM new_car;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”. ШКОДЫ НЕТ, ПОЭТОМУ лАДА И ВСЕ СИНИЕ))
CREATE VIEW only_skoda_audi AS
SELECT * FROM auto
WHERE MARK = 'AUDI' AND COLOR = 'СИНИЙ' OR MARK = 'LADA' AND COLOR = 'СИНИЙ';