
-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными

-- Table creation

CREATE TABLE `hw1_db`.`mobile_phones` (
  `id_mobile_phones` INT NOT NULL AUTO_INCREMENT,
  `manufacturer_mobile_phones` VARCHAR(45) NOT NULL,
  `models_mobile_phones` VARCHAR(45) NOT NULL,
  `q-ty_mobile_phones` INT NOT NULL,
  `price_mobile_phones` DECIMAL NOT NULL,
  PRIMARY KEY (`id_mobile_phones`),
  UNIQUE INDEX `id_mobile_phones_UNIQUE` (`id_mobile_phones` ASC) VISIBLE);

-- Inserting to table

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

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT models_mobile_phones, manufacturer_mobile_phones, price_mobile_phones  FROM hw1_db.mobile_phones
where qty_mobile_phones >2;

-- 3.  Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM hw1_db.mobile_phones
WHERE manufacturer_mobile_phones = 'Samsung';