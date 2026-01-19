USE Kibby;
#ЗАПРОСЫ

select * from artist;

#БАЗОВЫЕ ЗАПРОСЫ SQL  !!!!!!!
-- 1. Получение треков с возрастом 16+ и их альбомов (track + album)
SELECT t.track_title, t.duration, a.album_title, t.restrict_age
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE t.restrict_age >= 16;

-- 2. Получение пользователей с их типами подписок (user + subscription_type)
SELECT u.user_name, u.email, st.sub_name, st.price_usd
FROM user u
JOIN subscription_type st ON u.sub_type_id = st.type_id;

-- 3. Получение жанров и количества треков в каждом (genre + track_has_genre)
SELECT g.genre_name, COUNT(tg.track_id) as track_count
FROM genre g
LEFT JOIN track_has_genre tg ON g.genre_id = tg.genre_id
GROUP BY g.genre_id;

-- 4. Получение альбомов с исполнителями (album + artist)
SELECT a.album_title, ar.artist_name, a.release_date
FROM album a
JOIN artist ar ON a.artist_id = ar.artist_id;

-- 5. Получение плейлистов пользователя "kibby" (playlist + user)
SELECT p.playlist_title, p.creation_date, u.user_name
FROM playlist p
JOIN user u ON p.user_id = u.user_id
WHERE u.user_name = 'kibby';


#ПРОДВИНУТЫЕ ЗАПРОСЫ SQL !!!!!!!
-- 1. Треки с несколькими жанрами (track + track_has_genre + genre)
SELECT 
    t.track_title,
    a.album_title,
    GROUP_CONCAT(g.genre_name) as genres,
    COUNT(DISTINCT g.genre_id) as genre_count
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN track_has_genre tg ON t.track_id = tg.track_id
JOIN genre g ON tg.genre_id = g.genre_id
GROUP BY t.track_id
HAVING genre_count > 1;

-- 2. Все музыкальные проекты, в которых участвует определенный участник
SELECT
    m.stage_name AS 'Участник',
    a.artist_name AS 'Проект',
    at.type_name AS 'Тип проекта'
FROM member m
JOIN artist_has_member ahm ON m.member_id = ahm.member_id
JOIN artist a ON ahm.artist_id = a.artist_id
JOIN artist_type at ON a.artist_type_id = at.type_id
WHERE m.stage_name = 'Jimmy Urine';

-- 3. Анализ популярности треков через оценки и плейлисты (track + rating + track_in_playlist + playlist)
SELECT 
    t.track_title,
    ar.artist_name,
    COUNT(DISTINCT r.rating_id) as rating_count,
    COUNT(DISTINCT tip.playlist_id) as playlist_count,
    ROUND(AVG(r.value), 2) as avg_rating
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
LEFT JOIN rating r ON t.track_id = r.track_id
LEFT JOIN track_in_playlist tip ON t.track_id = tip.track_id
GROUP BY t.track_id
ORDER BY rating_count DESC, playlist_count DESC;

-- 4. Статистика по странам артистов (artist + artist_has_country + country)
SELECT 
    c.country_name,
    COUNT(DISTINCT ahc.artist_id) as artist_count,
    GROUP_CONCAT(DISTINCT ar.artist_name) as artists
FROM country c
JOIN artist_has_country ahc ON c.country_code = ahc.country_code
JOIN artist ar ON ahc.artist_id = ar.artist_id
GROUP BY c.country_code
ORDER BY artist_count DESC;

-- 5. Детальная информация о ролях участников в треках (track + track_has_credits + member + credit_type)
SELECT 
    t.track_title,
    m.stage_name,
    GROUP_CONCAT(DISTINCT ct.credit_name) as roles,
    COUNT(DISTINCT ct.credit_id) as role_count
FROM track t
JOIN track_has_credits thc ON t.track_id = thc.track_id
JOIN member m ON thc.member_id = m.member_id
JOIN credit_type ct ON thc.credit_id = ct.credit_id
GROUP BY t.track_id, m.member_id
ORDER BY role_count DESC;