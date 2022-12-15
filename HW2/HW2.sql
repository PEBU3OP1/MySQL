-- СОздаем таблицы goods и sales

CREATE TABLE `hw2_db`.`goods` (
  `idGoods` INT NOT NULL AUTO_INCREMENT,
  `Goods_Name` VARCHAR(40) NOT NULL,
  `Goods_manufacturer` VARCHAR(40) NOT NULL,
  `Goods_quantity` INT NULL DEFAULT 0,
  `Goods_country` VARCHAR(45) NOT NULL,
  `Goods_price` INT NULL DEFAULT 0,
  PRIMARY KEY (`idGoods`));


CREATE TABLE `hw2_db`.`sales` (
  `id_sales` INT NOT NULL AUTO_INCREMENT,
  `idGoods` INT NOT NULL,
  `Sales_percent` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_sales`),
  FOREIGN KEY (`idGoods`) REFERENCES goods(idGoods) ON DELETE CASCADE);


-- Заполнение таблиц


INSERT INTO `hw2_db`.`goods` (`Goods_Name`, `Goods_manufacturer`, `Goods_quantity`, `Goods_country`, `Goods_price`) 
VALUES ('Microwave oven', 'Philips', '23', 'Norway', '19000'),
('Kettler', 'Samsung', '233', 'Japan', '8000'),
('Mobile phone', 'Motorolla', '13', 'Russia', '1000'),
('Microwave oven', 'Rowenta', '32', 'Germany', '100');


INSERT INTO `hw2_db`.`sales` (`idGoods`, `Sales_percent`) VALUES ('1', '2');
INSERT INTO `hw2_db`.`sales` (`idGoods`, `Sales_percent`) VALUES ('2', '12');
INSERT INTO `hw2_db`.`sales` (`idGoods`, `Sales_percent`) VALUES ('3', '4');
INSERT INTO `hw2_db`.`sales` (`idGoods`, `Sales_percent`) VALUES ('4', '1');



-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300. - CASE

SELECT Goods_Name, Goods_quantity, Sales_percent, 
CASE
    WHEN Goods_quantity - Sales_percent < 10 
        THEN 'Мало'
    WHEN Goods_quantity - Sales_percent > 10 && Goods_quantity - Sales_percent < 30
        THEN 'Средне'
    ELSE 'МНОГО'
END AS Category
FROM sales, goods;
