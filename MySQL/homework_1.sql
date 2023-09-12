USE mobile_phones;

-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name, manufacturer, price
FROM mobile_phones
WHERE product_count > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM mobile_phones
WHERE manufacturer = "Samsung";

-- С помощью регулярных выражений найти:
-- Товары, в которых есть упоминание "Iphone"
SELECT *
FROM mobile_phones
WHERE product_name LIKE "%Iphone%";

-- Товары, в которых есть упоминание "Samsung"
SELECT *
FROM mobile_phones
WHERE product_name LIKE "%Samsung%";

-- Товары, в которых есть ЦИФРЫ
SELECT *
FROM mobile_phones
WHERE product_name REGEXP "[0-9]";

-- Товары, в которых есть ЦИФРА "8"  
SELECT *
FROM mobile_phones
WHERE product_name LIKE "%8";