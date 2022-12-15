-- Создаем таблицу goods и заполняем ее

CREATE DATABASE homework_2db;
USE homework_2db;
CREATE TABLE goods (
Goodsid INT AUTO_INCREMENT PRIMARY KEY,
Goods_Name VARCHAR(40) NOT NULL,
Goods_Manufacturer VARCHAR(40) NOT NULL,
Goods_Country VARCHAR(40) NOT NULL,
Goods_quantity INT NOT NULL DEFAULT 0,
Goods_price INT NOT NULL DEFAULT 0
);

INSERT INTO goods (Goods_Name, Goods_Manufacturer, Goods_Country, Goods_quantity, Goods_price)
VALUES
('Microwave oven', 'Philips', 'Norway', 23, 19000),
('Kettler', 'Samsung', 'Japan', 233, 8000),
('Mobile phone', 'Motorolla', 'Russia', 13, 1000),
('Microwave oven', 'Rowenta', 'Germany', 32, 100)
;

-- Создаем таблицу sales и заполняем ее

CREATE TABLE sales(
id INT AUTO_INCREMENT PRIMARY KEY, 
Goods_ID INT,
Sales_Val INT DEFAULT 0,
FOREIGN KEY (Goods_ID) REFERENCES goods (Goodsid) ON DELETE CASCADE
);

INSERT INTO sales (Goods_ID, Sales_Val)
VALUES 
(1, 10),
(2, 3),
(3, 5),
(4, 12);



-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300. - CASE
SELECT *,
CASE
	WHEN Goods_quantity < 14
		THEN 'МАЛО'
	WHEN Goods_quantity > 14 &&  Goods_quantity < 25
		THEN 'СРЕДНЕ'
	ELSE 'МНОГО'
END AS Result
FROM goods;

-- ВАРИАЦИИ НА ТЕМУ

SELECT Goods_Name, Goods_quantity, Sales_percent, 
CASE
    WHEN Goods_quantity - Sales_val < 10 
        THEN 'Мало'
    WHEN Goods_quantity - Sales_val > 10 && Goods_quantity - Sales_percent < 30
        THEN 'Средне'
    ELSE 'МНОГО'
END AS Result
FROM sales, goods;



-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders
(
    `Idorder` INT AUTO_INCREMENT PRIMARY KEY,
    `IdGoods` INT NOT NULL,
    `IdSales` INT NOT NULL,
    Status VARCHAR(40),
    FOREIGN KEY (IdGoods) REFERENCES goods(idGoods) ON DELETE CASCADE,
    FOREIGN KEY (IdSales) REFERENCES sales(id_sales) ON DELETE CASCADE
);


INSERT INTO orders (IdGoods, IdSales, Status)
VALUES ((SELECT idGoods FROM goods WHERE Goods_manufacturer= 'Philips'),  
        (SELECT id_sales FROM sales WHERE Sales_percent = 12),  
        'в резерве'
), 
     	
      ((SELECT idGoods FROM goods WHERE Goods_manufacturer= 'Motorolla'),  
      (SELECT id_sales FROM sales WHERE Sales_percent = 4),  
      NULL
); 

-- покажем “полный” статус заказа, используя оператор CASE
SELECT IdGoods, IdSales, 
      COALESCE(Status, 'не определено') AS Contacts
FROM orders;