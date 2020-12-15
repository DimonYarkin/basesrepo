/* Спроектируем базу под мини CRM систему. 
 * 
 *Задачи исполняемые CRM
 *1. Пользователи могут писать друг другу сообщения
 *2. В задачи пользователей входит регистрация Клиентов (контрагентов)
 *3. Регистрачия входящих событий (звонок,email, посещение сайта, youtube)
 *4. Регистрация исходящих событий (звонок, email)
 *4. Регистрация договоров
 *
 **/

-- Создаем базу данных
DROP DATABASE IF EXISTS minicrm;
CREATE DATABASE minicrm;
USE minicrm;

-- Создаем таблицу пользователей crm
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия для уникальности пользователей', 
    email VARCHAR(120) UNIQUE NOT NULL UNIQUE,
 	password_hash VARCHAR(100), 
	phone BIGINT UNSIGNED UNIQUE NOT NULL UNIQUE, 
	
    INDEX users_firstname_lastname_idx(firstname, lastname)
) COMMENT 'Пользователи';

-- Таблица фото пользователей
DROP TABLE IF EXISTS photousers;
CREATE TABLE photousers ( 
	id SERIAL,
	url_pthoto VARCHAR(255)
) COMMENT 'Фото пользователей';

-- Таблица профилей пользователей
DROP TABLE IF EXISTS usersprofile;
CREATE TABLE usersprofile ( 
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    address VARCHAR(150),

    INDEX usersprofile_user_id_idx(user_id),
    INDEX usersprofile_photo_id_idx(photo_id),

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photousers(id)
	
	) COMMENT 'Профили пользователей';

-- Таблица сообщений пользователей друг к другу
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL, 
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 

    INDEX message_from_user_id_idx(from_user_id),
    INDEX message_to_user_id_idx(to_user_id),

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
) COMMENT 'Сообщения пользователей';

-- Содаем таблицу Клиентов зарегистрированных пользователями 
DROP TABLE IF EXISTS customers;
CREATE TABLE customers ( 
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(100) NOT NULL,
	fullname VARCHAR(100),
   	created_at DATETIME DEFAULT NOW(), 
	
  	INDEX customers_user_id_idx(user_id),
  	INDEX customers_name_idx(name),

  	FOREIGN KEY (user_id) REFERENCES users(id)

) COMMENT 'Таблица Клиентов';

-- Таблица профилей Клиентов
DROP TABLE IF EXISTS customersprofiles;
CREATE TABLE customersprofiles ( 
	id SERIAL,
	customers_id BIGINT UNSIGNED NOT NULL UNIQUE,
	email VARCHAR(50),
	phone VARCHAR(50),
	actual_address VARCHAR(150),
	postal_address VARCHAR(150),
  	
	INDEX customersprofiles_customers_id_idx(customers_id),

	FOREIGN KEY (customers_id) REFERENCES customers(id)
) COMMENT 'Профили Клиентов';	

-- Таблица Контактных лиц Клиентов
DROP TABLE IF EXISTS contactpersons;
CREATE TABLE contactpersons ( 
	id SERIAL,
	customers_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(100) NOT NULL,
	fullname VARCHAR(100),
	email VARCHAR(50),
	phone VARCHAR(50),

	INDEX contactpersons_customers_id_idx(customers_id),

	FOREIGN KEY (customers_id) REFERENCES customers(id)
) COMMENT 'Контактные лица Клиентов';

-- Таблица договоров Клиентов
DROP TABLE IF EXISTS customercontracts;
CREATE TABLE customercontracts( 
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	customers_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(100) NOT NULL,
   	created_at DATETIME DEFAULT NOW(),
   	number_contract INT,
   	valid_until DATETIME, 

   	INDEX customercontracts_customers_id_idx(customers_id),
   	INDEX customercontracts_user_id_idx(user_id),

	FOREIGN KEY (customers_id) REFERENCES customers(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Договоры Клиентов';

-- Таблица входящих событий
DROP TABLE IF EXISTS incomingevents;
CREATE TABLE incomingevents( 
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	customers_id BIGINT UNSIGNED NOT NULL,
	type_event ENUM('звонок','email','сайт','youtube') NOT NULL,
   	body_event VARCHAR(500),
	created_at DATETIME DEFAULT NOW(),

   	INDEX incomingevents_customers_id_idx(customers_id),
   	INDEX incomingevents_user_id_idx(user_id),

	FOREIGN KEY (customers_id) REFERENCES customers(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Входящие события от клиентов';

-- Таблица исходящих событий
DROP TABLE IF EXISTS outgoingevents;
CREATE TABLE outgoingevents( 
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	customers_id BIGINT UNSIGNED NOT NULL,
	type_event ENUM('звонок','email') NOT NULL,
   	body_event VARCHAR(500),
	created_at DATETIME DEFAULT NOW(),

   	INDEX outgoingevents_customers_id_idx(customers_id),
   	INDEX outgoingevents_user_id_idx(user_id),

	FOREIGN KEY (customers_id) REFERENCES customers(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Исходящие события от клиентов';



