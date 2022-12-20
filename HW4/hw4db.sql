--  Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR, COUNT(COLOR) 
FROM auto
WHERE MARK = 'BMW'
GROUP BY COLOR
UNION
SELECT MARK, COLOR, COUNT(COLOR) 
FROM auto
WHERE MARK = 'LADA'
GROUP BY MARK, COLOR;

-- Вывести на экран марку авто и количество AUTO не этой марки

SELECT DISTINCT MARK, ((SELECT COUNT(MARK) FROM auto) - COUNT(MARK)) AS ANOTHER_AUTO
FROM auto
GROUP BY MARK;

-- ИЛИ

SELECT DISTINCT MARK, (SELECT COUNT(1) FROM auto copy_table WHERE copy_table.MARK != checked_table.MARK) AS ANOTHER_AUTO
FROM auto checked_table;


CREATE TABLE test_a 
( id number, 
  data varchar2(1)
  );

CREATE TABLE test_b 
( id number
);

INSERT INTO test_a(id, data) 
VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
INSERT INTO test_b(id) 
VALUES
(10),
(30),
(50);

--Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT * FROM test_a
LEFT JOIN test_b ON test_b.id != test_a.id
WHERE test_b.id IS NULL;