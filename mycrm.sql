DROP DATABASE IF EXISTS mycrm;
CREATE DATABASE mycrm;
USE mycrm;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50) COMMENT 'Имя',
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100), 
	phone BIGINT UNSIGNED UNIQUE, 
	
    INDEX users_firstname_lastname_idx(firstname, lastname)
) COMMENT 'Таблица пользователей';


DROP TABLE IF EXISTS photousers;
CREATE TABLE photousers ( 
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	url_pthoto VARCHAR(255),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Фото пользователей';

DROP TABLE IF EXISTS usersprofile;
CREATE TABLE usersprofile ( 
	id SERIAL,
	id_user BIGINT UNSIGNED NOT NULL,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
	
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photousers(id)
	
	) COMMENT 'Профили пользователей';



DROP TABLE IF EXISTS massageusers;
CREATE TABLE massageusers (
	id SERIAL,
	id_user_from BIGINT UNSIGNED NOT NULL,
	id_user_to BIGINT UNSIGNED NOT NULL,
	massage TEXT NOT NULL,
	create_date DATETIME DEFAULT NOW(), 
	
    FOREIGN KEY (id_user_from) REFERENCES users(id),
    FOREIGN KEY (id_user_to) REFERENCES users(id)
	
) COMMENT 'Таблица сообщений пользователей';

DROP TABLE IF EXISTS groupus;
CREATE TABLE groupus (
	id SERIAL,
	name_gruop VARCHAR(150),
	admin_user_id BIGINT UNSIGNED NOT NULL,
	
	INDEX gruop_name_idx(name_gruop), 
	FOREIGN KEY (admin_user_id) REFERENCES users(id)
) COMMENT 'Таблица названий групп юзеров';

DROP TABLE IF EXISTS users_groupus;
CREATE TABLE users_groupus (
	user_id BIGINT UNSIGNED NOT NULL,
	gruop_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (user_id, gruop_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (gruop_id) REFERENCES groupus(id)
   
) COMMENT 'Принадлежность юзеров группам';
