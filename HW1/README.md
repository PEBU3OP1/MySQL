# Реализовано решение ДЗ первого семинара, а также составлен конспект по первой лекции, плюс доп информация  

## Решение ДЗ
 1. <b>Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными</b>
    + Table creation (создание таблицы по моб телефонам: id, производитель, модель, кол-во, цена)

          CREATE TABLE `hw1_db`.`mobile_phones` ( 
              `id_mobile_phones` INT NOT NULL AUTO_INCREMENT,
              `manufacturer_mobile_phones` VARCHAR(45) NOT NULL,
              `models_mobile_phones` VARCHAR(45) NOT NULL,
              `q-ty_mobile_phones` INT NOT NULL,
              `price_mobile_phones` DECIMAL NOT NULL,
              PRIMARY KEY (`id_mobile_phones`),
              UNIQUE INDEX `id_mobile_phones_UNIQUE` (`id_mobile_phones` ASC) VISIBLE);

    + Inserting to table (заполнили таблицу)

          INSERT INTO `hw1_db`.`mobile_phones` 
            (`manufacturer_mobile_phones`, `models_mobile_phones`, `q-ty_mobile_phones`, `price_mobile_phones`) VALUES ('Apple', 'Iphone 14', '97', '140000');

          INSERT INTO `hw1_db`.`mobile_phones` 
            (`manufacturer_mobile_phones`, `models_mobile_phones`, `q-ty_mobile_phones`, `price_mobile_phones`) VALUES ('Sony Ericsson', 'K750i', '2', '1600');

          INSERT INTO `hw1_db`.`mobile_phones` 
            (`manufacturer_mobile_phones`, `models_mobile_phones`, `q-ty_mobile_phones`, `price_mobile_phones`) VALUES ('Samsung', 'Galaxy', '22', '80000');

          INSERT INTO `hw1_db`.`mobile_phones` 
            (`manufacturer_mobile_phones`, `models_mobile_phones`, `q-ty_mobile_phones`, `price_mobile_phones`) VALUES ('Xiaomi ', 'Mi 9', '45', '11000');

          INSERT INTO `hw1_db`.`mobile_phones` 
            (`manufacturer_mobile_phones`, `models_mobile_phones`, `qty_mobile_phones`, `price_mobile_phones`) VALUES ('Xiaomi ', 'Mi 4', '33', '8000');

          INSERT INTO `hw1_db`.`mobile_phones` 
            (`manufacturer_mobile_phones`, `models_mobile_phones`, `q-ty_mobile_phones`, `price_mobile_phones`) VALUES ('Samsung', 'S100', '55', '100');


2. <b>Выведите название, производителя и цену для товаров, количество которых превышает 2:</b>

          SELECT models_mobile_phones, manufacturer_mobile_phones, price_mobile_phones  FROM hw1_db.mobile_phones
          where qty_mobile_phones >2;

3. <b>Выведите весь ассортимент товаров марки “Samsung”:</b>

          SELECT * FROM hw1_db.mobile_phones
          WHERE manufacturer_mobile_phones = 'Samsung';


## Теоритическая часть (данная статья показалась интересной)

1. Создание / модификация БД (DDL – Data Definition Language)



        + CREATE – используется для создания объектов базы данных;
        + ALTER – используется для изменения объектов базы данных;
        + DROP – используется для удаления объектов базы данных.


2. Манипуляция данными (DML – Data Manipulation Language)

      + SELECT – осуществляет выборку данных;
      + INSERT – добавляет новые данные;
      + UPDATE – изменяет существующие данные;
      + DELETE – удаляет данные.

3. Структура sql-запросов

  + Общая структура запроса выглядит следующим образом:

        SELECT ('имена столбцов или * для выбора всех столбцов; обязательно')
        FROM ('таблица; обязательно')
        WHERE ('условие/фильтрация, например, city = 'Moscow', q-ty > 3; необязательно')
        GROUP BY ('столбец, по которому хотим сгруппировать данные; необязательно')
        HAVING ('условие/фильтрация на уровне сгруппированных данных; необязательно')
        ORDER BY ('столбец, по которому хотим отсортировать вывод; необязательно')

    Разберем структуру. Для удобства текущий изучаемый элемент в запроса выделяется CAPS'ом.

      ### SELECT, FROM
        SELECT, FROM — обязательные элементы запроса, которые определяют выбранные столбцы, их порядок и источник данных.

    Выбрать все (обозначается как *) из таблицы Customers:

        SELECT * FROM Customers

    Выбрать столбцы CustomerID, CustomerName из таблицы Customers:

        SELECT CustomerID, CustomerName FROM Customers


### WHERE

+ WHERE — необязательный элемент запроса, который используется, когда нужно отфильтровать данные по нужному условию. Очень часто внутри элемента where используются IN / NOT IN для фильтрации столбца по нескольким значениям, AND / OR для фильтрации таблицы по нескольким столбцам.


  ### Операторы сравнения
  + Операторы сравнения служат для сравнения 2 выражений, их результатом может являться ИСТИНА (1), ЛОЖЬ (0) и NULL.

      Результат сравнения с NULL является NULL. Исключением является оператор эквивалентности.

| Оператор |	Описание |
|----------|:---------:| 
|  =       |    	Оператор - равенство
|<=>	     |Оператор - эквивалентность. Аналогичный оператору равенства, с одним лишь исключением: в отличие от него,        оператор эквивалентности вернет ИСТИНУ при сравнении NULL <=> NULL|
| <> или != |	Оператор - неравенство
|<|	Оператор - меньше
|<=|	Оператор - меньше или равно
|>|	Оператор - больше
|>=|	Оператор - больше или равно

+  Фильтрация по одному условию и одному значению:

        SELECT * from Customers
        WHERE City = 'London'

 + Фильтрация по одному условию и нескольким значениям с применением IN (включение) или NOT IN (исключение):

        select * from Customers
        where City IN ('London', 'Berlin')

        select * from Customers
        where City NOT IN ('Madrid', 'Berlin','Bern')

  + Фильтрация по нескольким условиям с применением AND (выполняются все условия) или OR (выполняется хотя бы одно условие) и нескольким значениям:

        select * from Customers
        where Country = 'Germany' AND City not in ('Berlin', 'Aachen') AND CustomerID > 15

        select * from Customers
        where City in ('London', 'Berlin') OR CustomerID > 4

### GROUP BY

  + GROUP BY — необязательный элемент запроса, с помощью которого можно задать агрегацию по нужному столбцу (например, если нужно узнать какое количество клиентов живет в каждом из городов).

  + При использовании GROUP BY обязательно:

    + перечень столбцов, по которым делается разрез был одинаковым внутри SELECT и внутри GROUP BY
    + агрегатные функции (SUM, AVG, COUNT, MAX, MIN) должны быть также указаны внутри SELECT с указанием столбца, к которому такая функция применяется.

  + Группировка количества клиентов по городу:

        SELECT City, count(CustomerID) from Customers
        GROUP BY City

  + Группировка количества клиентов по стране и городу:

        select Country, City, count(CustomerID) from Customers
        GROUP BY Country, City

 + Группировка продаж по ID товара с разными агрегатными функциями: количество заказов с данным товаром и количество проданных штук товара:


        select ProductID, COUNT(OrderID), SUM(Quantity) from OrderDetails
        GROUP BY ProductID

  + Группировка продаж с фильтрацией исходной таблицы. В данном случае на выходе будет таблица с количеством клиентов по городам Германии:


        select City, count(CustomerID) from Customers
        WHERE Country = 'Germany'
        GROUP BY City

  + Переименование столбца с агрегацией с помощью оператора AS. По умолчанию название столбца с агрегацией равно примененной агрегатной функции, что далее может быть не очень удобно для восприятия.

        select City, count(CustomerID) AS Number_of_clients from Customers
        group by City

### HAVING

  + HAVING — необязательный элемент запроса, который отвечает за фильтрацию на уровне сгруппированных данных (по сути, WHERE, но только на уровень выше).

    + Фильтрация агрегированной таблицы с количеством клиентов по городам, в данном случае оставляем в выгрузке только те города, в которых не менее 5 клиентов:

          select City, count(CustomerID) from Customers
          group by City
          HAVING count(CustomerID) >= 5 


  + В случае с переименованным столбцом внутри HAVING можно указать как и саму агрегирующую конструкцию count(CustomerID), так и новое название столбца number_of_clients:


          select City, count(CustomerID) as number_of_clients from Customers
          group by City
          HAVING number_of_clients >= 5

  + Пример запроса, содержащего WHERE и HAVING. В данном запросе сначала фильтруется исходная таблица по пользователям, рассчитывается количество клиентов по городам и остаются только те города, где количество клиентов не менее 5:


        select City, count(CustomerID) as number_of_clients from Customers
        WHERE CustomerName not in ('Around the Horn','Drachenblut Delikatessend')
        group by City
        HAVING number_of_clients >= 5

### ORDER BY

  + ORDER BY — необязательный элемент запроса, который отвечает за сортировку таблицы.

  + Простой пример сортировки по одному столбцу. В данном запросе осуществляется сортировка по городу, который указал клиент:


    select * from Customers
    ORDER BY City

  + Осуществлять сортировку можно и по нескольким столбцам, в этом случае сортировка происходит по порядку указанных столбцов:


        select * from Customers
        ORDER BY Country, City

  + По умолчанию сортировка происходит по возрастанию для чисел и в алфавитном порядке для текстовых значений. Если нужна обратная сортировка, то в конструкции ORDER BY после названия столбца надо добавить DESC:


        select * from Customers
        order by CustomerID DESC

  + Обратная сортировка по одному столбцу и сортировка по умолчанию по второму:

        select * from Customers
        order by Country DESC, City

### JOIN

  + JOIN — необязательный элемент, используется для объединения таблиц по ключу, который присутствует в обеих таблицах. Перед ключом ставится оператор ON.

  + Запрос, в котором соединяем таблицы Order и Customer по ключу CustomerID, при этом перед названиям столбца ключа добавляется название таблицы через точку:

        select * from Orders
        JOIN Customers ON Orders.CustomerID = Customers.CustomerID

  + Нередко может возникать ситуация, когда надо промэппить одну таблицу значениями из другой. В зависимости от задачи, могут использоваться разные типы присоединений. INNER JOIN — пересечение, RIGHT/LEFT JOIN для мэппинга одной таблицы знаениями из другой,


        select * from Orders
        join Customers on Orders.CustomerID = Customers.CustomerID
        where Customers.CustomerID >10

Внутри всего запроса JOIN встраивается после элемента from до элемента where, пример запроса:

Другие типы JOIN'ов можно увидеть на замечательной картинке ниже:


![image](https://hsto.org/r/w1560/storage3/263/56b/400/26356b400ca9075ac90491edd6623eae.png)