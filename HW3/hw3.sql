CREATE DATABASE hw3DB;
USE hw3DB;

CREATE TABLE salary(
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR (30) NOT NULL,
    surname VARCHAR (30) NOT NULL,
    speciality VARCHAR (30) NOT NULL,
    seniority INT NOT NULL DEFAULT 0,
    salary INT NOT NULL DEFAULT 0,
    age INT NOT NULL DEFAULT 0
);

INSERT INTO salary (firstname, surname, speciality, seniority, salary, age)
VALUES
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Каткина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

-- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
SELECT * 
FROM salary
ORDER BY SALARY;

-- Выведите 5 максимальных зарплат (salary)
SELECT * 
FROM salary
ORDER BY salary DESC
LIMIT 5;

-- Подсчитать суммарную зарплату(salary) по каждой специальности (post)

SELECT speciality, SUM(salary) AS sal_sum
FROM salary
GROUP BY speciality;


-- Найти количество сотрудников по специальности “Рабочий” (post) в возрасте от 24 до 42 лет.

SELECT speciality, COUNT(*) AS spec_count
FROM salary
WHERE speciality = 'рабочий' AND age < 42 AND age > 24
GROUP BY speciality;  -- в данном примере работает и без этой строки

-- Найти количество специальностей

SELECT  COUNT(DISTINCT speciality) AS Qty_of_spec
FROM salary;

-- или

SELECT speciality, COUNT(DISTINCT speciality) AS Qty_of_spec
FROM salary
GROUP BY speciality;

-- Вывести специальности, у которых средний возраст сотрудника меньше 44 лет

SELECT speciality, AVG(age) AS average_age
FROM salary
GROUP BY speciality
HAVING average_age < 44;


-- Если не ID, то какое поле можно добавить, чтобы использовать его в качестве первичного ключа
-- В ДАННОМ КОНКРЕТНОМ СЛУЧАЕ ВЗЯЛ БЫ ФАМИЛИИ, ПОСКОЛЬКУ ТОЛЬКО ОНИ УНИКАЛЬНЫ. А ТАК ПОСТАРАЛСЯ БЫ ИЗБЕЖАТЬ ТАКОГО РАСКЛАДА)))