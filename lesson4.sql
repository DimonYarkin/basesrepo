-- 1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)

use vk;



INSERT IGNORE INTO users
VALUES
	("1","Ashleigh","Predovic","clotilde01@example.net","3ca1f3f09497f0224b7eeadbc025f8b9a694eccb","9478117068"),
	("2","Keagan","Streich","ibrahim.bergnaum@example.net","f9e1ff95a5713fdc3158ff88aba295125dc718f5","9473245063"),
	("3","Ashleigh","Larson","jenkins.lewis@example.org","500758809664bd7dfa8d51b7639a3ee4732f928c","9185862154"),
	("4","Otho","McCullough","ystoltenberg@example.net","615708280fb78477235768a1f1b2294a9d4e82f0","9632331885"),
	("5","Margret","Lockman","dubuque.favian@example.org","578f44b7e8a97bafe87068a9c5302cb4d13e27c9","9022091685"),
	("6","Makenna","Boyer","lura62@example.net","2aad26d0b76a403a4d4a936b582d431ff8e6c71a","9460284688"),
	("7","Leopold","Kuphal","pagac.art@example.org","73a72b2368b8552797133a805e4cb81a13063557","9078847826"),
	("8","Edward","McCullough","gerson.d'amore@example.net","0d53ece6e2838ae5a1bcbb0d759563c46c7c05f1","9926455705"),
	("9","Billie","Littel","jacquelyn.rempel@example.org","6f9695689d0ecfb7c5749564ebf6449a4fb87c91","9657645206"),
	("10","Darlene","Hauck","mckayla03@example.com","126c1cadf381ad5a82dafc93b57ba0d25c49a250","9916236862");



INSERT IGNORE INTO communities 
VALUES
	("1","commodi","1"),
	("2","nulla","2"),
	("3","similique","3"),
	("4","quo","4"),
	("5","quas","5"),
	("6","quidem","6"),
	("7","dignissimos","7"),
	("8","autem","8"),
	("9","deserunt","9"),
	("10","maxime","10"),
	("11","hic","1"),
	("12","et","2");


INSERT IGNORE INTO users_communities 
VALUES
	("1","1"),
	("2","2"),
	("3","3"),
	("4","4"),
	("5","5"),
	("6","6"),
	("7","7"),
	("8","8"),
	("9","9"),
	("10","10");



INSERT IGNORE INTO photo_albums 
VALUES
	("1","aperiam","1"),
	("2","enim","2"),
	("3","officiis","3"),
	("4","sed","4"),
	("5","quaerat","5"),
	("6","eos","6"),
	("7","deleniti","7"),
	("8","deserunt","8"),
	("9","hic","9"),
	("10","consequuntur","10"),
	("11","ipsum","1");

INSERT IGNORE INTO media_types 
VALUES
	("1","sit","2018-01-02 11:52:41","2017-10-17 22:55:55"),
	("2","soluta","2007-12-08 18:48:49","2009-07-20 11:13:43"),
	("3","non","1996-04-06 22:36:40","1970-10-06 22:56:36"),
	("4","nemo","1979-02-08 16:26:42","1989-09-08 09:25:51"),
	("5","quasi","2020-10-12 07:43:04","2005-08-14 08:59:06"),
	("6","similique","2005-04-24 20:30:46","2017-01-05 00:09:05"),
	("7","nisi","2004-01-14 21:23:31","2009-05-17 09:27:04"),
	("8","perferendis","1971-03-20 16:54:54","1972-12-15 17:44:58"),
	("9","aut","1996-06-16 07:05:03","1979-01-03 16:15:26"),
	("10","perferendis","1972-04-21 23:55:35","1986-07-20 09:40:49");

INSERT IGNORE INTO media
VALUES
	("1","1","1","Odio ex aspernatur aspernatur vel eos. Quo ullam velit molestiae ut blanditiis quia culpa. Ipsam minus optio ut dolorum ut tenetur esse.","consequatur","9199397",NULL,"1999-02-19 23:19:14","2017-12-12 08:07:12"),
	("2","2","2","Fuga explicabo perspiciatis voluptatem hic eos. Commodi eligendi illum aut neque. Veniam ab beatae maiores temporibus. Ut repellendus laborum modi natus.","officiis","13389",NULL,"1990-03-28 03:59:46","2008-10-07 12:29:24"),
	("3","3","3","Repellat quo porro nisi qui asperiores. Eum inventore veritatis magnam dolore. Consequatur distinctio quisquam id. Vitae velit error laudantium.","ut","812",NULL,"2008-12-30 22:06:38","1972-12-24 12:52:28"),
	("4","4","4","Doloremque vel beatae enim voluptatum. Consequatur ut quo asperiores et. Ipsa ab ratione dolorem quibusdam.","ratione","5",NULL,"1984-01-24 14:49:44","2009-01-27 19:38:42"),
	("5","5","5","Qui adipisci dolorum similique ea nam nostrum. Aut in ratione et qui pariatur magnam.","a","0",NULL,"1977-02-05 21:27:45","2014-09-13 11:33:22"),
	("6","6","6","Pariatur sapiente qui nihil qui. Quae et consequatur dolorum quis eos et. Aut dolor est quisquam alias sunt reiciendis dolores. Et fugit consequatur velit qui eum aut eligendi.","qui","96782237",NULL,"2006-02-14 22:06:23","1988-09-24 20:10:46"),
	("7","7","7","Alias quia quam quam. Quam aliquam debitis esse dicta sapiente deleniti. Iure et repellendus aut. Quia aperiam reprehenderit incidunt consectetur est esse.","alias","64474",NULL,"1993-11-11 15:31:55","1989-01-22 22:43:49"),
	("8","8","8","Ut sed aut et ut odit rerum omnis. Qui eaque doloremque libero voluptatem nulla. Et voluptas et cumque. Et inventore laboriosam esse quod voluptatum impedit magni.","debitis","26737359",NULL,"2019-12-04 11:08:55","1974-04-26 04:08:55"),
	("9","9","9","Illum soluta temporibus aut consequuntur. Aut rerum aut et rerum saepe dolores odio. Ex et et ducimus quod. Vitae ipsa cum fuga quis illum voluptatibus repellendus laboriosam.","tempora","169551225",NULL,"1980-01-06 15:15:42","2017-02-19 05:36:28"),
	("10","10","10","Quia aut qui numquam neque dolor aut explicabo animi. Modi est qui eos placeat sint porro. Dolore blanditiis quis nemo nemo quibusdam.","corporis","18384",NULL,"1972-04-22 10:11:13","2003-12-21 00:43:14");

INSERT IGNORE INTO photos 
VALUES
	("1","1","1"),
	("2","2","2"),
	("3","3","3"),
	("4","4","4"),
	("5","5","5"),
	("6","6","6"),
	("7","7","7"),
	("8","8","8"),
	("9","9","9"),
	("10","10","10");

-- Сделано просто чтобы все работало при перезапуске скрипта и без пересоздания базы

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
	
    FOREIGN KEY (photo_id) REFERENCES media(id), -- пока рано, т.к. таблицы media еще нет
	FOREIGN KEY (user_id) REFERENCES users(id)
    );

INSERT IGNORE INTO profiles 
VALUES
	("1","","1973-08-30","1","2012-06-06 04:19:47",""),
	("2","","1972-02-23","2","2017-10-24 02:33:11",""),
	("3","","1992-06-15","3","1971-05-03 14:15:36",""),
	("4","","2004-01-15","4","2013-04-07 17:45:18",""),
	("5","","1985-11-25","5","2010-03-06 15:02:48",""),
	("6","","1991-05-22","6","1981-04-16 19:59:02",""),
	("7","","2020-11-11","7","1993-12-06 13:21:51",""),
	("8","","1978-09-25","8","2001-04-14 02:40:45",""),
	("9","","2000-04-12","9","2009-03-20 12:03:01",""),
	("10","","1997-08-05","10","2019-04-12 07:30:19","");

INSERT IGNORE INTO messages 
VALUES
("1","1","2","Asperiores rerum repudiandae officia omnis molestias totam. Nesciunt voluptates id ut iure. Excepturi doloribus aut et eligendi in.","1974-06-07 07:21:17"),
("2","3","2","Ut non voluptatem pariatur odio dolor. Nobis excepturi tempora neque quia. Quod dignissimos occaecati reiciendis quia dolore minima.","1973-10-09 14:27:01"),
("3","1","4","Eius nesciunt fugiat alias sed voluptatem aut iusto. Est recusandae exercitationem accusantium optio corporis qui omnis. Laboriosam illum non totam aut eveniet. Quia repudiandae explicabo non velit optio rem ut sit.","2018-10-28 15:10:13"),
("4","4","1","Unde quam deleniti est officiis iusto corporis. Tempora magni atque voluptatibus facere. Doloremque quo consequatur facilis qui cum. Quis facilis omnis eaque est voluptatem.","1999-04-07 19:07:49"),
("5","10","5","Rerum nisi neque aperiam praesentium placeat voluptatibus. Architecto est et fuga assumenda quas odio. Qui optio aut consequatur similique voluptatem fugiat.","2019-12-30 12:52:20"),
("6","6","2","Voluptas asperiores pariatur nesciunt quia. Cumque maiores ipsa sed atque quod consequuntur et necessitatibus. Sed quas illum tenetur quidem voluptates consequatur rerum.","2009-11-03 14:55:04"),
("7","8","7","Ratione autem rerum recusandae sunt dolorem qui. Nam ex doloribus vel alias saepe temporibus. Earum saepe quia aut commodi repellat doloribus perspiciatis. Nihil inventore molestias eum magnam quasi qui id veniam.","1977-12-10 12:55:10"),
("8","8","9","Voluptas quaerat similique occaecati quidem magni nam autem aliquid. Voluptate placeat repudiandae ullam veniam consequatur. Amet magni quas totam iure deserunt et. Ut sint nobis modi aliquid. Iusto alias aliquid aperiam ipsa et sit.","2005-08-27 04:04:14"),
("9","1","9","Aut et et harum ratione totam dolore aut. Quia tempore quia facere laudantium et consequatur repudiandae. Officia quisquam ut eum cupiditate. Quis maxime molestiae deleniti soluta.","2010-03-11 02:49:19"),
("10","10","5","Ab blanditiis sed id. Quam tenetur corrupti in ea omnis aut consequuntur. Aut quaerat voluptatem id est. Rerum dolorem quod omnis neque ratione.","1993-02-12 10:32:20"),
("11","10","5","Message to the future.","2021-02-12 10:32:20"),
("12","10","5","Message to the future.","2021-02-12 10:32:20");

INSERT IGNORE INTO likes 
VALUES
("1","1","1","1971-02-27 18:06:30"),
("2","2","2","1970-06-18 02:55:30"),
("3","3","3","2018-12-01 17:10:29"),
("4","4","4","2009-12-24 08:04:59"),
("5","5","5","2002-11-10 06:56:53"),
("6","6","6","1977-09-26 11:27:32"),
("7","7","7","1998-09-22 14:03:08"),
("8","8","8","2014-11-13 12:08:51"),
("9","9","9","1972-05-07 11:27:19"),
("10","10","10","1972-12-22 10:17:05"),
("11","1","1","1990-02-22 07:16:32"),
("12","2","2","2011-01-15 05:14:23");


/* 2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке*/

SELECT DISTINCT firstname FROM users
ORDER BY firstname;

/* 3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
 *  Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1) */

ALTER TABLE profiles ADD COLUMN is_active TINYINT(1) DEFAULT 1;


-- SELECT birthday , DATE_FORMAT(FROM_DAYS(TO_DAYS(now()) - TO_DAYS(birthday)), '%Y') + 0 AS yeasold FROM profiles ;


UPDATE profiles 
SET
	is_active = 0
WHERE 
	TIMESTAMPDIFF(YEAR, birthday, CURDATE())<18;

-- Выборка просто для проверки 

SELECT birthday ,TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS yeasold FROM profiles;


/* 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней) */
DELETE FROM messages 
WHERE created_at > NOW(); 


