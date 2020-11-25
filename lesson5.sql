/* 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. */

DROP DATABASE IF EXISTS lesson5;
CREATE DATABASE lesson5;
USE lesson5;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(100),
	birthday DATE,
	birthmonth ENUM('january','february','march','april','may', 'august'),
	created_at DATETIME,
	updated_at DATETIME
);

INSERT IGNORE INTO users(id,name,birthday,birthmonth) VALUES
(1,'User1','1977-01-02','january'),
(2,'User2','1980-05-02','may'),
(3,'User3','1985-08-02','august'),
(4,'User4','1980-04-02','april'),
(5,'User5','1977-01-02','january');

UPDATE users 
SET
	created_at = NOW(),
	updated_at = NOW()
WHERE 
	created_at IS NULL AND updated_at IS NULL; 
	
-- Выводим результат
SELECT * FROM users;	

/* В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
 *  0, если товар закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
 *  Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/


DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
    storehouse_id int unsigned,
    product VARCHAR(150),
    value int unsigned comment 'Запас товарной позиции на складе',
    created_at DATETIME default current_timestamp COMMENT 'Дата регистрации',
    updated_at DATETIME default current_timestamp ON UPDATE current_timestamp COMMENT 'Дата последнего обновления записи'
) COMMENT = 'Склады и продукты';


INSERT INTO storehouses_products (storehouse_id, product, value) VALUES
    (1, 'product 1', 0),
    (1, 'product 2', 2500),
    (1, 'product 3', 0),
    (2, 'product 4', 30),
    (2, 'product 5', 500),
    (1, 'product 6', 1);

SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 THEN 2147483647 ELSE value END; -- 'Если значение value = 0 то задаем максимальное возможное значение для типа INT'
 
 /*(по желанию) Из таблицы users необходимо извлечь пользователей, 
  * родившихся в августе и мае. 
  * Месяцы заданы в виде списка английских названий ('may', 'august')
*/
	
SELECT * FROM users
WHERE birthmonth = 'may' OR birthmonth = 'august';

/*(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
 * Отсортируйте записи в порядке, заданном в списке IN.
*/

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(100)
	);

INSERT INTO catalogs (id, name) VALUES
    (1, 'cat1'),
    (2, 'cat2'),
    (3, 'cat3'),
    (4, 'cat4'),
    (5, 'cat5');

SELECT * FROM catalogs WHERE id IN (5, 1, 2)
ORDER BY 
	CASE WHEN id = 5 THEN 0
	ELSE id END ;
	/*WHEN id = 1 THEN 1
	WHEN id = 2 THEN 2 END;*/
	
/* Подсчитайте средний возраст пользователей в таблице users*/
SELECT 
	AVG(TIMESTAMPDIFF(YEAR, birthday, CURDATE())) AS avgage
FROM users;

/* одсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения. */

SELECT 
	DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) AS dayweek,
	COUNT(*) AS countbirthday 
FROM users
GROUP BY
	dayweek
HAVING 
	COUNT(*) ;

	