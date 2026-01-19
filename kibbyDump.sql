DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT COMMENT 'айди альбома',
  `album_title` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название альбома',
  `artist_id` int NOT NULL COMMENT 'внешний ключ  исполнителя',
  `release_date` date DEFAULT NULL COMMENT 'дата релиза',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'обложка альбома',
  PRIMARY KEY (`album_id`),
  KEY `fk_album_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_album_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (300,'Three Cheers For The Newlydeads',204,'2007-10-13','url_plm_find_ivan.jpg'),(301,'A Lifetime in the Service of Darkness',204,'2024-10-03','url_plm_krasotka.jpg'),(302,'Achtung 80',203,'2014-08-08','url_andone_achtung.jpg'),(303,'Bodypop',203,'2006-09-01','url_andone_bodypop.jpg'),(304,'Back Home',203,'2007-11-05','url_andone_backhome.jpg'),(305,'You\'ll Rebel to Anything',200,'2005-04-12','url_msi_rebel.jpg'),(306,'MSI B-SIDES vol.1',200,'2024-07-15','url_msi_bsides.jpg'),(307,'How I Learned to Love MSI',200,'2013-05-24','url_msi_howilearned.jpg'),(308,'If',200,'2008-03-25','if_cover.jpg'),(309,'Bad Choices Made Easy',201,'2010-11-09','url_lr_choices.jpg'),(310,'Euringer',202,'2018-10-19','url_euringer_album.jpg');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL AUTO_INCREMENT COMMENT 'айди исполнителя',
  `artist_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название исполнителя/группы',
  `founded_year` int DEFAULT NULL COMMENT 'год основания/начала деятельности',
  `artist_bio` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'биография',
  `artist_photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'ссылка на фото исполнителя',
  `artist_type_id` int NOT NULL COMMENT 'тип исполнителя (пример: группа/дуэт/соло)',
  PRIMARY KEY (`artist_id`),
  KEY `fk_artist_artist_type1_idx` (`artist_type_id`),
  CONSTRAINT `fk_artist_artist_type1` FOREIGN KEY (`artist_type_id`) REFERENCES `artist_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (200,'Mindless Self Indulgence',1997,'Американская группа из Нью-Йорка. Музыкальный стиль сочетает в себе элементы панк-рока, электроники и индастриала.','url_msi_band.jpg',5),(201,'The Left Rights',2002,'Сайд-проект участников MSI Джеймса Юрингера и Стива Монтано. Специализируется на экспериментальной электронной музыке.','url_left_rights.jpg',2),(202,'Euringer',2018,'Сольный проект Джеймса Юрингера (Jimmy Urine). Дебютный одноименный альбом выпущен в октябре 2018 года.','url_euringer.jpg',1),(203,'And One',1989,'Немецкая музыкальная группа, работающая в стилях синти-поп и EBM. Основана в Берлине Стивом Нагави и Крисом Рутцем.','url_and_one.jpg',3),(204,'Ashbury Heights',2005,'Шведский электронный музыкальный дуэт из Сундсвалля.','url_plm.jpg',2);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_has_country`
--

DROP TABLE IF EXISTS `artist_has_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_has_country` (
  `artist_id` int NOT NULL COMMENT 'внешний ключ артиста',
  `country_code` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT ' внешний ключ страны',
  PRIMARY KEY (`artist_id`,`country_code`),
  KEY `fk_artist_has_country_country1_idx` (`country_code`),
  KEY `fk_artist_has_country_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_artist_has_country_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `fk_artist_has_country_country1` FOREIGN KEY (`country_code`) REFERENCES `country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_has_country`
--

LOCK TABLES `artist_has_country` WRITE;
/*!40000 ALTER TABLE `artist_has_country` DISABLE KEYS */;
INSERT INTO `artist_has_country` VALUES (200,'UK'),(200,'US'),(201,'US'),(202,'US'),(203,'DE'),(204,'SE'),(204,'US');
/*!40000 ALTER TABLE `artist_has_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_has_member`
--

DROP TABLE IF EXISTS `artist_has_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_has_member` (
  `artist_id` int NOT NULL COMMENT 'внешний ключ исполнителя',
  `member_id` int NOT NULL COMMENT 'внешний ключ участника',
  PRIMARY KEY (`artist_id`,`member_id`),
  KEY `fk_artist_has_member_member1_idx` (`member_id`),
  KEY `fk_artist_has_member_artist_idx` (`artist_id`),
  CONSTRAINT `fk_artist_has_member_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `fk_artist_has_member_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_has_member`
--

LOCK TABLES `artist_has_member` WRITE;
/*!40000 ALTER TABLE `artist_has_member` DISABLE KEYS */;
INSERT INTO `artist_has_member` VALUES (200,1),(201,1),(202,1),(200,2),(201,2),(200,3),(200,4),(203,5),(203,6),(203,7);
/*!40000 ALTER TABLE `artist_has_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_has_track`
--

DROP TABLE IF EXISTS `artist_has_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_has_track` (
  `artist_id` int NOT NULL,
  `track_id` int NOT NULL,
  PRIMARY KEY (`artist_id`,`track_id`),
  KEY `fk_artist_has_track_track1_idx` (`track_id`),
  KEY `fk_artist_has_track_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_artist_has_track_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `fk_artist_has_track_track1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_has_track`
--

LOCK TABLES `artist_has_track` WRITE;
/*!40000 ALTER TABLE `artist_has_track` DISABLE KEYS */;
INSERT INTO `artist_has_track` VALUES (204,1),(204,2),(204,3),(204,4),(203,5),(203,6),(203,7),(203,8),(203,9),(203,10),(203,11),(203,12),(200,13),(200,14),(200,15),(200,16),(200,17),(200,18),(200,19),(200,20),(200,21),(200,22),(200,23),(200,24),(200,25),(200,26),(200,27),(200,28),(200,29),(200,30),(200,31),(200,32),(201,33),(201,34),(201,35),(202,36),(202,37),(202,38);
/*!40000 ALTER TABLE `artist_has_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_type`
--

DROP TABLE IF EXISTS `artist_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_type` (
  `type_id` int NOT NULL AUTO_INCREMENT COMMENT 'первичяный ключ типа исполнителя+',
  `type_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название типа исполнителя',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_type`
--

LOCK TABLES `artist_type` WRITE;
/*!40000 ALTER TABLE `artist_type` DISABLE KEYS */;
INSERT INTO `artist_type` VALUES (1,'Соло'),(2,'Дуэт'),(3,'Трио'),(4,'Квартет'),(5,'Группа');
/*!40000 ALTER TABLE `artist_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_code` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'код страны (пример - RU)',
  `country_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название страны',
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('CA','Канада'),('DE','Германия'),('RU','Россия'),('SE','Швеция'),('UK','Великобритания'),('US','Соединенные Штаты Америки');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_type`
--

DROP TABLE IF EXISTS `credit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_type` (
  `credit_id` int NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ роли участника (айди)',
  `credit_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название роли',
  PRIMARY KEY (`credit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_type`
--

LOCK TABLES `credit_type` WRITE;
/*!40000 ALTER TABLE `credit_type` DISABLE KEYS */;
INSERT INTO `credit_type` VALUES (1,'Вокалист'),(2,'Гитарист'),(3,'Бас-гитарист'),(4,'Барабанщик'),(5,'Клавишник'),(6,'Продюсер'),(7,'Композитор'),(8,'Текст');
/*!40000 ALTER TABLE `credit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ жанра (айди)',
  `genre_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'название жанра',
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Industrial Rock'),(2,'Synth-pop'),(3,'EBM'),(4,'Punk'),(5,'Electronic'),(6,'Alternative');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT 'айди участника',
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'настоящее имя и фамилия участника',
  `stage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'сценическое имя',
  `birth_date` date DEFAULT NULL COMMENT 'дата рождения',
  `member_bio` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'биография',
  `member_photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'ссылка на фото участника',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'James Euringer','Jimmy Urine','1969-09-07','Американский автор-исполнитель и композитор. Основатель и вокалист группы Mindless Self Indulgence.','url_jimmy.jpg'),(2,'Steve Montano','Steve, Righ?','1970-09-22','Американский музыкант, гитарист группы Mindless Self Indulgence. Участник проекта The Left Rights.','url_steve.jpg'),(3,'Lindsey Way','Lyn-Z','1976-05-22','Американская художница и музыкант. Бас-гитаристка группы Mindless Self Indulgence с 2001 года.','url_lynz.jpg'),(4,'Jennifer Dunn','Kitty','1970-01-01','Американский музыкант, бессменный барабанщик Mindless Self Indulgence.','url_kitty.jpg'),(5,'Steve Naghavi','Steve Naghavi','1970-05-25','Немецкий музыкант ирано-английского происхождения. Основатель, вокалист и автор песен группы And One.','url_naghavi.jpg'),(6,'Joke Jay','Joke Jay','1971-09-12','Немецкий музыкант, барабанщик и вокалист. Участник группы And One (1992–2001, 2011–н.в.).','url_jokejay.jpg'),(7,'Rick Schah','Rick Schah','1972-04-10','Немецкий музыкант, клавишник и продюсер. Участник коллектива And One.','url_rick.jpg');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ плейлиста (айди)',
  `playlist_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'название плейлиста',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'описание',
  `creation_date` datetime DEFAULT NULL COMMENT 'дата создания',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'обложка плейлиста',
  `user_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlist_user1_idx` (`user_id`),
  CONSTRAINT `fk_playlist_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Favorite','','2024-03-05 10:00:00','c1.jpg',3),(2,'Industrial Mix','Just for fun','2024-03-10 18:45:00','c2.jpg',2),(3,'А!','!!!','2024-03-12 21:00:00','c3.jpg',1),(4,'Vibe','Alternative UK','2024-03-15 12:00:00','c4.jpg',4),(5,'001','','2024-03-20 23:00:00','c5.jpg',5);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `value` tinyint DEFAULT NULL COMMENT 'оценка по 5-и бальной системе',
  `user_id` int NOT NULL COMMENT 'внешний ключ пользователя',
  `track_id` int NOT NULL COMMENT 'внешний ключ трека',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `user_track_unique` (`user_id`,`track_id`),
  KEY `fk_rating_user1_idx` (`user_id`),
  KEY `fk_rating_track1_idx` (`track_id`),
  CONSTRAINT `fk_rating_track1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`),
  CONSTRAINT `fk_rating_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,5,1,1),(2,4,2,1),(3,3,3,2),(4,4,4,2),(5,5,5,3),(6,4,1,4),(7,2,2,5),(8,3,3,6),(9,4,4,7),(10,5,5,8),(11,4,1,9),(12,3,2,10),(13,4,3,11),(14,5,4,12),(15,4,5,13),(16,5,1,13),(17,4,2,14),(18,3,3,15),(19,4,4,16),(20,5,5,17),(21,4,1,18),(22,2,2,19),(23,3,3,20),(24,4,4,21),(25,5,5,22),(26,4,1,23),(27,3,2,24),(28,4,3,25),(29,5,4,26),(30,4,5,27),(31,5,1,28),(32,4,2,29),(33,3,3,30),(34,1,4,31),(35,2,5,32),(36,4,1,33),(37,5,2,34),(38,4,3,35),(39,3,4,36),(40,4,5,37),(41,5,1,38),(42,4,2,13),(45,3,5,18),(46,2,1,29),(48,5,3,22),(49,4,4,3),(50,3,5,11);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type`
--

DROP TABLE IF EXISTS `subscription_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_type` (
  `type_id` int NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ',
  `sub_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название подписки',
  `price_usd` decimal(10,2) NOT NULL COMMENT 'цена в долларах (т.к он считается мировой валютой). DECIMAL для абсолоютной точности цен',
  `features` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'особенности подписки',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type`
--

LOCK TABLES `subscription_type` WRITE;
/*!40000 ALTER TABLE `subscription_type` DISABLE KEYS */;
INSERT INTO `subscription_type` VALUES (1,'Бесплатная',0.00,'Базовый доступ с рекламой, перемешивание треков, стандартное качество'),(2,'Премиум',9.99,'Без рекламы, высокое качество звука, скачивание треков, неограниченное прослушивание'),(3,'Студенческая',4.99,'Премиум-доступ со скидкой 50% при подтверждении статуса'),(4,'Семейная',14.99,'Премиум-доступ для 6 аккаунтов'),(5,'Годовая',99.99,'Премиум-доступ на 12 месяцев со скидкой 20%');
/*!40000 ALTER TABLE `subscription_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track` (
  `track_id` int NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ трека (айди)',
  `album_id` int NOT NULL COMMENT 'внешний ключ альбома',
  `track_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'название трека',
  `duration` time NOT NULL COMMENT 'продолжительность трека',
  `restrict_age` tinyint NOT NULL COMMENT 'возрастные ограничения трека (0, 6, 12, 18)',
  `is_explicit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'в треке содержится ненормативная лексика? (0 - нет, 1 - да)',
  `audio_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ссылка на аудиодорожку',
  PRIMARY KEY (`track_id`),
  KEY `fk_track_album1_idx` (`album_id`),
  CONSTRAINT `fk_track_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,300,'Bare Your Teeth','00:02:15',16,1,'url_tr_1.mp3'),(2,300,'Wate of Love','00:03:02',16,1,'url_tr_2.mp3'),(3,300,'Cry Havoc','00:02:45',12,0,'url_tr_3.mp3'),(4,301,'A Lifetime in the Service of Darkness','00:02:50',16,1,'url_tr_4.mp3'),(5,302,'Bad Girl','00:03:42',0,0,'url_tr_5.mp3'),(6,302,'My Angel','00:04:10',0,0,'url_tr_6.mp3'),(7,303,'Military Fashion Show','00:03:38',0,0,'url_tr_7.mp3'),(8,303,'Stand the Pain','00:04:22',0,0,'url_tr_8.mp3'),(9,303,'Love You to the End','00:03:55',0,0,'url_tr_9.mp3'),(10,303,'Body Company','00:03:20',0,0,'url_tr_10.mp3'),(11,304,'Wounds','00:03:45',0,0,'url_tr_11.mp3'),(12,304,'Back Home','00:03:58',0,0,'url_tr_12.mp3'),(13,305,'What Do They Know?','00:03:09',16,1,'url_tr_13.mp3'),(14,305,'Prom','00:02:29',18,1,'url_tr_14.mp3'),(15,305,'1989','00:01:57',16,1,'url_tr_15.mp3'),(16,305,'You\'ll Rebel to Anything','00:02:32',18,1,'url_tr_16.mp3'),(17,306,'3S\'','00:02:24',18,1,'url_tr_17.mp3'),(18,306,'My World','00:03:18',16,1,'url_tr_18.mp3'),(19,306,'Seven Minutes in Heaven','00:02:13',16,1,'url_tr_19.mp3'),(20,306,'Frying Pan','00:02:46',16,0,'url_tr_20.mp3'),(21,306,'Disappoint','00:02:20',12,0,'url_tr_21.mp3'),(22,307,'Witness','00:03:17',16,1,'url_tr_22.mp3'),(23,307,'It Gets Worse','00:02:56',18,1,'url_tr_23.mp3'),(24,307,'The Logical Song','00:04:01',12,0,'url_tr_24.mp3'),(25,308,'Never Wanted to Dance','00:03:09',16,1,'url_tr_310.mp3'),(26,308,'Lights Out','00:02:37',16,1,'url_tr_311.mp3'),(27,308,'Prescription','00:03:06',18,1,'url_tr_312.mp3'),(28,308,'Mastermind','00:03:00',16,1,'url_tr_313.mp3'),(29,308,'Revenge','00:03:09',16,1,'url_tr_314.mp3'),(30,308,'On It','00:03:02',16,1,'url_tr_315.mp3'),(31,308,'Animal','00:02:44',18,1,'url_tr_316.mp3'),(32,308,'Money','00:02:53',16,1,'url_tr_317.mp3'),(33,309,'White','00:01:20',18,1,'url_tr_25.mp3'),(34,309,'Meow','00:02:10',0,0,'url_tr_26.mp3'),(35,309,'Hopeless','00:03:30',16,1,'url_tr_27.mp3'),(36,310,'Problematic','00:03:35',18,1,'url_tr_28.mp3'),(37,310,'Piece of Me','00:03:41',18,1,'url_tr_29.mp3'),(38,310,'If It Ain\'t You Today It Will Be You Tomorrow','00:03:10',16,0,'url_tr_30.mp3');
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_has_credits`
--

DROP TABLE IF EXISTS `track_has_credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_has_credits` (
  `track_id` int NOT NULL,
  `member_id` int NOT NULL,
  `credit_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`member_id`,`credit_id`),
  KEY `fk_track_has_credit_type_credit_type1_idx` (`credit_id`),
  KEY `fk_track_has_credit_type_track1_idx` (`track_id`),
  KEY `fk_track_has_credit_type_member1_idx` (`member_id`),
  CONSTRAINT `fk_track_has_credit_type_credit_type1` FOREIGN KEY (`credit_id`) REFERENCES `credit_type` (`credit_id`),
  CONSTRAINT `fk_track_has_credit_type_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `fk_track_has_credit_type_track1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_has_credits`
--

LOCK TABLES `track_has_credits` WRITE;
/*!40000 ALTER TABLE `track_has_credits` DISABLE KEYS */;
INSERT INTO `track_has_credits` VALUES (5,5,1),(6,5,1),(7,5,1),(8,5,1),(9,5,1),(10,5,1),(11,5,1),(12,5,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(27,1,1),(28,1,1),(29,1,1),(30,1,1),(31,1,1),(32,1,1),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,1),(38,1,1),(13,2,2),(14,2,2),(15,2,2),(16,2,2),(17,2,2),(18,2,2),(19,2,2),(20,2,2),(21,2,2),(22,2,2),(23,2,2),(24,2,2),(25,2,2),(26,2,2),(27,2,2),(28,2,2),(29,2,2),(30,2,2),(31,2,2),(32,2,2),(13,3,3),(14,3,3),(15,3,3),(16,3,3),(17,3,3),(18,3,3),(19,3,3),(20,3,3),(21,3,3),(22,3,3),(23,3,3),(24,3,3),(25,3,3),(26,3,3),(27,3,3),(28,3,3),(29,3,3),(30,3,3),(31,3,3),(32,3,3),(5,6,4),(6,6,4),(7,6,4),(8,6,4),(9,6,4),(10,6,4),(11,6,4),(12,6,4),(13,4,4),(14,4,4),(15,4,4),(16,4,4),(17,4,4),(18,4,4),(19,4,4),(20,4,4),(21,4,4),(22,4,4),(23,4,4),(24,4,4),(25,4,4),(26,4,4),(27,4,4),(28,4,4),(29,4,4),(30,4,4),(31,4,4),(32,4,4),(5,7,5),(6,7,5),(7,7,5),(8,7,5),(9,7,5),(10,7,5),(11,7,5),(12,7,5),(33,2,5),(34,2,5),(35,2,5),(36,1,5),(37,1,5),(38,1,5),(5,7,6),(7,7,6),(33,2,6),(34,2,6),(35,2,6),(36,1,6),(37,1,6),(38,1,6),(5,5,7),(6,5,7),(7,5,7),(8,5,7),(9,5,7),(10,5,7),(11,5,7),(12,5,7),(13,1,7),(14,1,7),(15,1,7),(16,1,7),(17,1,7),(18,1,7),(19,1,7),(20,1,7),(21,1,7),(22,1,7),(23,1,7),(24,1,7),(25,1,7),(26,1,7),(27,1,7),(28,1,7),(29,1,7),(30,1,7),(31,1,7),(32,1,7),(33,1,7),(34,1,7),(35,1,7),(36,1,7),(37,1,7),(38,1,7),(5,5,8),(6,5,8),(7,5,8),(8,5,8),(9,5,8),(10,5,8),(11,5,8),(12,5,8),(13,1,8),(14,1,8),(15,1,8),(16,1,8),(17,1,8),(18,1,8),(19,1,8),(20,1,8),(21,1,8),(22,1,8),(23,1,8),(24,1,8),(25,1,8),(26,1,8),(27,1,8),(28,1,8),(29,1,8),(30,1,8),(31,1,8),(32,1,8),(33,1,8),(34,1,8),(35,1,8),(36,1,8),(37,1,8),(38,1,8);
/*!40000 ALTER TABLE `track_has_credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_has_genre`
--

DROP TABLE IF EXISTS `track_has_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_has_genre` (
  `track_id` int NOT NULL COMMENT 'внешний ключ трека',
  `genre_id` int NOT NULL COMMENT 'внешний ключ жанра',
  PRIMARY KEY (`track_id`,`genre_id`),
  KEY `fk_track_has_genre_genre1_idx` (`genre_id`),
  KEY `fk_track_has_genre_track1_idx` (`track_id`),
  CONSTRAINT `fk_track_has_genre_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `fk_track_has_genre_track1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_has_genre`
--

LOCK TABLES `track_has_genre` WRITE;
/*!40000 ALTER TABLE `track_has_genre` DISABLE KEYS */;
INSERT INTO `track_has_genre` VALUES (13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(35,1),(36,1),(37,1),(38,1),(5,2),(6,2),(7,2),(9,2),(11,2),(12,2),(5,3),(7,3),(8,3),(10,3),(11,3),(12,3),(1,4),(2,4),(4,4),(13,4),(14,4),(15,4),(16,4),(19,4),(22,4),(17,5),(18,5),(20,5),(21,5),(23,5),(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5),(31,5),(32,5),(33,5),(34,5),(35,5),(36,5),(37,5),(38,5),(1,6),(2,6),(3,6),(4,6),(13,6);
/*!40000 ALTER TABLE `track_has_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_in_playlist`
--

DROP TABLE IF EXISTS `track_in_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_in_playlist` (
  `track_id` int NOT NULL COMMENT 'внешний ключ трека',
  `playlist_id` int NOT NULL COMMENT 'внешний ключ плейлиста',
  PRIMARY KEY (`track_id`,`playlist_id`),
  KEY `fk_track_has_playlist_playlist1_idx` (`playlist_id`),
  KEY `fk_track_has_playlist_track1_idx` (`track_id`),
  CONSTRAINT `fk_track_has_playlist_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`),
  CONSTRAINT `fk_track_has_playlist_track1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_in_playlist`
--

LOCK TABLES `track_in_playlist` WRITE;
/*!40000 ALTER TABLE `track_in_playlist` DISABLE KEYS */;
INSERT INTO `track_in_playlist` VALUES (13,1),(14,1),(15,1),(16,1),(22,1),(25,1),(28,1),(30,1),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(28,2),(31,2),(36,2),(37,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(11,3),(12,3),(11,4),(12,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5),(31,5),(32,5),(33,5),(34,5);
/*!40000 ALTER TABLE `track_in_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'айди пользователя',
  `user_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'имя пользователя',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'почта аккаунта пользователя',
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'хэш пароля пользователя',
  `registration_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата регистрации аккаунта',
  `country_code` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'ссылка на аватар пользователя',
  `sub_type_id` int NOT NULL COMMENT 'тип подпики пользователя',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`user_name`),
  KEY `fk_user_country1_idx` (`country_code`),
  KEY `fk_user_subscription_type1_idx` (`sub_type_id`),
  CONSTRAINT `fk_user_country1` FOREIGN KEY (`country_code`) REFERENCES `country` (`country_code`),
  CONSTRAINT `fk_user_subscription_type1` FOREIGN KEY (`sub_type_id`) REFERENCES `subscription_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kibby','kibby@mail.ru','ef92b778bafe421e592046c09','2024-01-10 12:00:00','RU','ava_1.jpg',2),(2,'mewo0','mewo0@gmail.com','5e884898da28047151d0e56f8','2024-02-15 14:30:00','DE','ava_2.jpg',1),(3,'cake_001','cakekkk@gmail.com','f7fbba6ce0634289876e6d1b','2024-03-01 09:15:00','US','ava_3.jpg',2),(4,'mary99_k','mary09@gmail.com','d41d8cd98f00b204e9800998','2024-03-10 11:00:00','CA','ava_4.jpg',3),(5,'cookie888','cookie888_wow@yandex.ru','c4ca4238a0b923820dcc509a','2024-03-15 16:20:00','RU','ava_5.jpg',4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-25 13:39:39

