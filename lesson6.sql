USE vk;

SET @userselect = 1;

/* Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений). */

SELECT 
	userms_id,
	countbody,
	u2.firstname 
FROM 
(
	SELECT 
		userms_id,
		COUNT(*) AS countbody 
	FROM 
	(
		SELECT  
			CASE 
			WHEN NOT from_user_id = @userselect THEN from_user_id
			ELSE to_user_id END AS userms_id,
			body 
		FROM messages
		WHERE from_user_id = @userselect OR to_user_id = @userselect) AS mstab
	GROUP BY 
		userms_id
	ORDER BY 
		countbody DESC
		
	LIMIT 1) rs
	INNER JOIN
		users u2 
		ON
			rs.userms_id = u2.id 
		
;

/* Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.. */

/* Излишнии пола в запросах вывел для себя для тренировки */
SELECT 
	
	COUNT(media_id) AS countlike
	
FROM 

( 
SELECT 
	l.user_id AS user_id , 
	l.media_id,
	u.firstname,
	TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) AS ageuser
	FROM likes l
INNER JOIN users u 
	ON
		l.user_id = u.id
INNER JOIN profiles p 
	ON
		l.user_id = p.user_id 
WHERE 
	TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) <10) rs;

/* Определить кто больше поставил лайков (всего): мужчины или женщины. */


SELECT 
	gender,
	COUNT( media_id) AS countlike
	
FROM 

( 

SELECT 
	l.user_id AS user_id , 
	l.media_id,
	u.firstname,
	p.gender,
	TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) AS ageuser
	FROM likes l
INNER JOIN users u 
	ON
		l.user_id = u.id
INNER JOIN profiles p 
	ON
		l.user_id = p.user_id) rs
GROUP BY 
		gender
HAVING 
	COUNT(media_id) 
	ORDER BY 
	COUNT(media_id) DESC
LIMIT 1
; 







