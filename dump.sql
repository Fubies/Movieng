-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: team01
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bad`
--

DROP TABLE IF EXISTS `bad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bad` (
  `bad_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`bad_id`),
  KEY `FK_DISLIKE_USER_idx` (`user_id`),
  KEY `FK_DISLIKE_MOVIE_idx` (`movie_id`),
  CONSTRAINT `FK_DISLIKE_MOVIE` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DISLIKE_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bad`
--

LOCK TABLES `bad` WRITE;
/*!40000 ALTER TABLE `bad` DISABLE KEYS */;
INSERT INTO `bad` VALUES (1,2,153),(2,3,58),(3,3,90);
/*!40000 ALTER TABLE `bad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK_CATEGORY_MOVIE_idx` (`movie_id`),
  KEY `FK_CATEGORY_GENRE_idx` (`genre_id`),
  CONSTRAINT `FK_CATEGORY_MOVIE` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEOGRY_GENRE` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,2,1),(2,5,2),(3,6,3),(4,9,3),(5,11,4),(6,6,4),(7,17,5),(8,17,6),(9,3,7),(10,17,7),(11,11,7),(12,6,8),(13,14,8),(14,1,8),(15,6,9),(16,1,9),(17,11,9),(18,15,10),(19,11,10),(20,6,11),(21,13,12),(22,8,13),(23,17,14),(24,17,15),(25,9,15),(26,17,16),(27,5,17),(28,9,18),(29,17,18),(30,9,19),(31,17,19),(32,17,20),(33,8,21),(34,8,22),(35,5,23),(36,17,24),(37,17,25),(38,17,26),(39,11,26),(40,17,27),(41,17,28),(42,17,29),(43,17,30),(44,17,31),(45,5,32),(46,5,33),(47,1,34),(48,11,34),(49,9,34),(50,15,34),(51,7,35),(52,17,36),(53,16,37),(54,11,38),(55,6,38),(56,18,39),(57,17,40),(58,13,41),(59,4,42),(60,5,43),(61,13,44),(62,3,44),(63,2,45),(64,9,45),(65,11,46),(66,3,46),(67,2,47),(68,3,48),(69,11,48),(70,17,49),(71,17,50),(72,17,51),(73,11,51),(74,15,51),(75,7,52),(76,6,53),(77,11,54),(78,8,54),(79,17,55),(80,6,56),(81,6,57),(82,10,57),(83,2,58),(84,7,59),(85,7,60),(86,17,61),(87,6,61),(88,17,62),(89,17,63),(90,8,63),(91,6,64),(92,8,64),(93,13,65),(94,10,65),(95,11,66),(96,2,67),(97,15,68),(98,4,68),(99,12,69),(100,3,69),(101,13,69),(102,8,69),(103,17,70),(104,13,71),(105,3,72),(106,11,72),(107,17,73),(108,17,74),(109,17,75),(110,13,76),(111,8,77),(112,7,78),(113,18,79),(114,7,79),(115,2,80),(116,17,81),(117,2,82),(118,17,82),(119,8,83),(120,17,83),(121,4,84),(122,13,84),(123,17,85),(124,17,86),(125,7,87),(126,7,88),(127,6,89),(128,11,89),(129,17,90),(130,17,91),(131,17,92),(132,16,92),(133,17,93),(134,17,94),(135,17,95),(136,4,96),(137,9,96),(138,6,97),(139,7,98),(140,8,99),(141,17,99),(142,9,99),(143,17,100),(144,8,101),(145,17,101),(146,9,101),(147,8,102),(148,17,102),(149,1,102),(150,17,103),(151,8,104),(152,17,104),(153,17,105),(154,17,106),(155,2,107),(156,8,108),(157,17,108),(158,7,109),(159,17,109),(160,14,110),(161,11,110),(162,19,111),(163,5,112),(164,5,113),(165,5,114),(166,5,115),(167,7,115),(168,5,116),(169,6,117),(170,5,118),(171,5,119),(172,7,120),(173,5,121),(174,17,122),(175,2,123),(176,17,124),(177,17,125),(178,11,125),(179,2,126),(180,15,127),(181,11,127),(182,13,128),(183,17,129),(184,13,130),(185,9,130),(186,5,131),(187,2,132),(188,8,132),(189,9,132),(190,14,132),(191,17,133),(192,8,133),(193,17,134),(194,17,135),(195,14,136),(196,17,136),(197,17,137),(198,17,138),(199,5,139),(200,5,140),(201,5,141),(202,5,142),(203,5,143),(204,17,144),(205,5,145),(206,17,146),(207,12,146),(208,5,147),(209,5,148),(210,5,149),(211,5,150),(212,5,151),(213,6,152),(214,17,153),(215,5,154),(216,5,155),(217,5,156),(218,5,157),(219,5,158),(220,17,159),(221,1,160),(222,17,160),(223,7,161),(224,6,162),(225,17,163),(226,7,164),(227,8,165),(228,17,165),(229,17,166),(230,6,167),(231,6,168),(232,7,169),(233,5,170),(234,5,171),(235,5,172),(236,17,173),(237,7,174),(238,5,175),(239,5,176),(240,1,177),(241,11,177),(242,6,178),(243,13,179),(244,5,180),(245,17,181),(246,17,182),(247,12,182),(248,2,183),(249,5,184),(250,17,185),(251,5,186),(252,17,187),(253,13,187),(254,17,188),(255,12,189),(256,9,189),(257,14,189),(258,16,189),(259,17,190),(260,7,191),(261,17,192),(262,13,192),(263,6,193),(264,14,193),(265,1,193),(266,8,194),(267,7,195),(268,6,196),(269,2,197),(270,11,198),(271,3,198),(272,6,198),(273,17,199),(274,15,200),(275,13,200);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_COMMENT_POST_idx` (`post_id`),
  KEY `FK_COMMENT_USER_idx` (`user_id`),
  CONSTRAINT `FK_COMMENT_POST` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COMMENT_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,5,'저 가고 싶습니다!'),(2,5,6,'저요! 저도 영화제 처음이라 같이 가고 싶습니다'),(3,2,6,'저도 가고 싶습니다!!');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival`
--

DROP TABLE IF EXISTS `festival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festival` (
  `festival_id` int(11) NOT NULL AUTO_INCREMENT,
  `kor_title` varchar(255) NOT NULL,
  `eng_title` varchar(255) NOT NULL,
  `continent` varchar(50) NOT NULL,
  `nation` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `main` varchar(5) NOT NULL,
  `interest_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`festival_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival`
--

LOCK TABLES `festival` WRITE;
/*!40000 ALTER TABLE `festival` DISABLE KEYS */;
INSERT INTO `festival` VALUES (1,'부산국제영화제','Busan International Film Festival : BIFF','아시아','한국','부산','http://www.biff.kr','예',0),(2,'야마가타 국제다큐멘터리영화제','Yamagata International Documentary Film Festival','아시아','일본','야마가타','http://www.yidff.jp','예',0),(3,'시카고 국제영화제','Chicago International Film Festival','북미주','미국','시카고','http://www.chicagofilmfestival.com','예',0),(4,'토론토 국제영화제','Toronto International Film Festival','북미주','캐나다','토론토','http://tiff.net','예',0),(5,'상하이 국제영화제','Shanghai International Film & TV Festival','아시아','중국','상하이','http://www.siff.com','예',0),(6,'부천국제판타스틱영화제','Bucheon International Fantastic Film Festival : BIFAN','아시아','한국','부천','http://www.bifan.kr','예',0),(7,'애니마 문디 - 브라질 국제애니메이션영화제','Anima Mundi - International Animation Festival of Brazil','중남미','브라질','리오데자네이로, 상파울로','','예',0),(8,'베를린 국제영화제','Berlin International Film Festival','유럽','독일','베를린','http://www.berlinale.de','예',0),(9,'모스크바 국제영화제','Moscow International Film Festival','유럽','러시아','모스크바','http://www.moscowfilmfestival.ru','예',0),(10,'안시 국제애니메이션영화제','Annecy International Animated Film Festival','유럽','프랑스','안시','http://www.annecy.org/home','예',0),(11,'칸 국제영화제','Cannes Film Festival','유럽','프랑스','칸','http://www.festival-cannes.com','예',0),(12,'선댄스 영화제','Sundance Film Festival','북미주','미국','솔트레이크시티','http://www.sundance.org/festival','예',0),(13,'카를로비 바리 국제영화제','Karlovy Vary International Film Festival','유럽','체코','카를로비 바리','http://www.kviff.com','예',0),(14,'마르델플라타 국제영화제','Mar del Plata International Film Festival','중남미','아르헨티나','마르델플라타','http://www.mardelplatafilmfest.com','예',0),(15,'전주국제영화제','Jeonju International Film Festival : JIFF','아시아','한국','전주','http://www.jiff.or.kr','예',0),(16,'베니스 국제영화제','Venice International Film Festival','유럽','이탈리아','베니스','http://www.labiennale.org/en/cinema','예',0),(17,'로카르노 국제영화제','Locarno International Film Festival','유럽','스위스','로카르노','http://www.pardo.ch','예',0),(18,'도쿄 국제영화제','Tokyo International Film Festival','아시아','일본','도쿄','http://www.tiff-jp.net/','예',1),(19,'크레떼이유 국제여성영화제','International Women film festival of Creteil','유럽','프랑스','크레떼이유','http://www.filmsdefemmes.com','예',0),(20,'가톨릭영화제','Catholic Film Festival','아시아','한국','서울','http://www.caff.kr','아니오',1),(21,'충주단편영화제','Chungju Short Film Festival','아시아','한국','충주','http://cafe.daum.net/cj-shortfl.daum.net','아니오',0),(22,'서울국제실험영화페스티벌','Experimental Film &amp; Video Festival in Seoul : EXiS','아시아','한국','서울','http://www.ex-is.org','아니오',0),(23,'부천국제애니메이션페스티벌','Bucheon International Animation Festival : BIAF','아시아','한국','부천','http://www.biaf.or.kr','아니오',0),(24,'제주여성영화제','Jeju Women\'s Film Festival','아시아','한국','제주','http://jejuwomen.tistory.com','아니오',0),(25,'한국영화평론가협회상','The Korean Association of Film Critics Awards','아시아','한국','서울','http://fca.kr/','아니오',0),(26,'강정국제평화영화제','International PEACE Film Festival in GANGJEONG','아시아','한국','제주도 서귀포','','아니오',1),(27,'DMZ국제다큐멘터리영화제','DMZ International Documentary Film Festival','아시아','한국','고양','http://www.dmzdocs.com','아니오',3),(28,'전주국제단편영화제','Jeonju International Short Film Festival: JISFF','아시아','한국','전주','http://www.jisff.kr','아니오',0),(29,'들꽃영화상','Wildflower Film Awards Korea','아시아','한국','서울','http://www.wildflower-awards.com/','아니오',0),(30,'전북가족영화제','Jeonbuk Family Film Festival','아시아','한국','전주','http://www.jfff.or.kr','아니오',0),(31,'서울국제여성영화제','Seoul International Women’s Film Festival : SIWFF','아시아','한국','서울','http://www.siwff.or.kr','아니오',0),(32,'EBS 국제다큐영화제','EBS International Documentary Film Festival : EIDF','아시아','한국','서울','http://www.eidf.co.kr/kor','아니오',2),(33,'제천국제음악영화제','Jecheon International Music & Film Festival : JIMFF','아시아','한국','제천','http://www.jimff.org','아니오',0),(34,'정동진독립영화제','Jeongdongjin Independent Film Festival : JIFF','아시아','한국','강릉','http://jiff.kr/','아니오',0),(35,'전북독립영화제','Jeonbuk Independent Film Festival','아시아','한국','전주','http://www.jifa.or.kr/','아니오',0),(36,'광화문국제단편영화제','GwangHwaMun International Short Film Festival : GISFF','아시아','한국','서울','http://www.gisff.kr/','아니오',0),(37,'대종상영화제','DAEJONG FILM AWARDS','아시아','한국','서울','','아니오',0),(38,'울산단편영화제','Ulsan Short Film Festival: USFF','아시아','한국','','http://uisff.com/','아니오',0),(39,'부산국제어린이청소년영화제','Busan International Kids & Youth Film Festival : BIKY','아시아','한국','부산','http://www.biky.or.kr','아니오',0),(40,'대한민국청소년영화제','Korea Youth Film Festival, INTYFF','아시아','한국','대전','http://intyca.com/','아니오',0),(41,'리치몬드국제영화제','','아시아','한국','','','아니오',0),(42,'파이브플레이버스아시아','Five Flavours Asian Film Festival','아시아','한국','','http://https://www.piecsmakow.pl/index.do','아니오',0),(43,'이흘라바 다큐','Ji.hlava International Documentary Film Festival','아시아','한국','','http://https://www.ji-hlava.com/','아니오',0),(44,'이흘라바 다큐','Ji.hlava International Documentary Film Festival','아시아','한국','','http://https://www.ji-hlava.com/','아니오',0),(45,'셰필드 호러','Celluloid Screams: Shefcontinent Horror Film Festival','아시아','한국','','http://https://www.celluloidscreams.com/','아니오',0),(46,'키츠뷔엘','Filmfestival Kitzbuehel','아시아','한국','','http://https://ffkb.at/','아니오',0),(47,'독빌 다큐','DOCVILLE International Documentary Film Festival','아시아','한국','','','아니오',0),(48,'룩셈부르크 시티','Luxembourg City Film Festival','아시아','한국','','http://https://www.docville.be/en','아니오',1),(49,'애드먼턴','Edmonton International Film Festival','아시아','한국','','http://https://edmontonfilmfest.com/','아니오',0),(50,'KF세계영화주간','KF World Cinema Week','아시아','한국','서울','http://kfworldcinemaweek.or.kr','아니오',1),(51,'서울남아시아영화제','International Film Festival of South Asia-Seoul: IFFSA-Seoul','아시아','한국','서울','http://iffsa.kr/','아니오',0),(52,'서울노인영화제','Seoul International Senior Film Festival : SISFF','아시아','한국','서울','http://sisff.seoulnoin.or.kr','아니오',0),(53,'목포국도1호선독립영화제','Mokpo national Road 1 Independent Film Festival: NR1IFF','아시아','한국','목포','http://www.facebook.com/nr1iff','아니오',0),(54,'강원영화제: 햇시네마 페스티벌','HAT Cinema Festival','아시아','한국','','http://www.gwfilm.kr','아니오',0),(55,'평창국제평화영화제','PyeongChang International Peace Film Festival','아시아','한국','평창','http://pipff.org','아니오',0),(56,'글래스고 영화제','Glasgow Film Festival','아시아','한국','','http://glasgowfilm.org/glasgow-film-festival','아니오',0),(57,'충무로영화제-디렉터스 위크','Chungmuro Film Festival-directors Week','아시아','한국','서울','http://https://thecmr.kr/','아니오',0),(58,'무중력영화제','MUjungryuck Film Festival: MUFF','아시아','한국','서울','http://www.instagram.com/youthzone_muff/','아니오',0),(59,'서울영등포국제초단편영화제','Seoul Yeongdeungpo International Extreme-Short Image & Film Festival: SESIFF','아시아','한국','서울','http://www.sesiff.org','아니오',0),(60,'서울독립영화제','Seoul Independent Film Festival : SIFF','아시아','한국','서울','http://www.siff.kr/','아니오',0),(61,'서울국제음식영화제','Seoul International Food Film Festival','아시아','한국','서울','http://www.sifff.kr/','아니오',0),(62,'성북청춘불패영화제','Seongbuk Film Festival','아시아','한국','서울','http://www.sbff.co.kr/','아니오',0),(63,'충무로단편영화제','Chungmuro Short Film Festival','아시아','한국','서울','http://blog.naver.com/moonok0784','아니오',0),(64,'서울국제환경영화제','Seoul International Eco Film Festival : SIEFF','아시아','한국','서울','http://sieff.kr/','아니오',0),(65,'충북국제무예액션영화제','Chungbuk International Martial Arts & Action Film Festival : CIMAFF','아시아','한국','청주','http://cimaff.kr/','아니오',0),(66,'청주국제단편영화제','Cheongju International Short Film Festival : CISFF','아시아','한국','청주','http://cjiff.co.kr','아니오',0),(67,'서울국제어린이영화제','Seoul International Children\'s Film Festival: SICFF','아시아','한국','서울','http://www.sicff.kr','아니오',0),(68,'디아스포라영화제','Diaspora Film Festival : DIAFF','아시아','한국','인천','http://www.diaff.org','아니오',0),(69,'부산국제단편영화제','Busan International Short Film Festival : BISFF','아시아','한국','부산','http://www.bisff.org/','아니오',0),(70,'울주세계산악영화제','Ulju Mountain Film Festival : UMFF','아시아','한국','울주','http://www.umff.kr/','아니오',0),(71,'서울인디애니페스트','Seoul Indie-AniFest: Korean Independent Animation Film Festival','아시아','한국','서울','http://www.ianifest.org','아니오',0),(72,'한국퀴어영화제','Korea Queer Film Festival : KQFF','아시아','한국','서울','http://kqff.co.kr/','아니오',0),(73,'대전독립영화제','Daejeon Independent Film&Video Festival : DIFV','아시아','한국','대전','http://www.difv.co.kr','아니오',0),(74,'대한민국청소년미디어대전','Korea Youth Media Festival : KYMF','아시아','한국','서울','http://kymf.ssro.net/','아니오',0),(75,'상록수다문화국제단편영화제','Evergreen Multi-culture International Short Film Festival','아시아','한국','안산','http://www.evff.co.kr','아니오',0),(76,'울산국제영화제','Ulsan International Film Festival: UIFF','아시아','한국','울산','http://www.ulsan.go.kr/uiff','아니오',0),(77,'한국청소년영화제','Korea Youth Film Festival: KYFF','아시아','한국','광주광역시','http://cafe.daum.net/KYFF.macji','아니오',0),(78,'청룡영화상','The Blue Dragon Awards','아시아','한국','서울','http://www.blueaward.co.kr/awards/','아니오',0),(79,'KYFF단편영화제','Kookmin Youth Film Festival','아시아','한국','','http://www.instagram.com/kyff_2021/','아니오',0),(80,'강릉국제영화제','Gangneung International Film Festival','아시아','한국','강릉','http://www.giff.kr/','아니오',3),(81,'대청호가 그린 영화제','','아시아','한국','','','아니오',0),(82,'제1회 건넛마을 영화제','','아시아','한국','','','아니오',0),(83,'여성인권영화제','Film Festival for Women\'s Rights : FIWOM','아시아','한국','서울','http://www.fiwom.org','아니오',0),(84,'황금촬영상 시상식','Korea Gold Awards Festival','아시아','한국','가평','http://kgoldaward.com/','아니오',0),(85,'부산독립영화제','Independent Film Festival BUSAN','아시아','한국','부산','http://indiebusan.modoo.at/','아니오',0),(86,'제주영화제','Jeju Film Festival','아시아','한국','제주','http://www.jejuff.kr/','아니오',0),(87,'인천독립영화제 : inFilm','Incheon Independent Film Festival','아시아','한국','인천','http://cafe.daum.net/in-film','아니오',0),(88,'도시영화제','','아시아','한국','','http://blog.naver.com/urban_filmfestival','아니오',1),(89,'상록수디지로그월드영화제','','아시아','한국','','','아니오',0),(90,'KTV 국민영상제','','아시아','한국','','','아니오',1),(91,'헤이리시네마 국제단편영화제','','아시아','한국','','','아니오',0),(92,'인천인권영화제','Incheon Human Rights Film Festival','아시아','한국','인천','http://www.inhuriff.org','아니오',0),(93,'꽃심어린이청소년영화제','','아시아','한국','','','아니오',1),(94,'천안춤영화제','CheonAn Dance Film Festival : CADFF','아시아','한국','천안','http://www.cadff.kr','아니오',0),(95,'금천패션영화제','','아시아','한국','','','아니오',0),(96,'원주여성영화제','','아시아','한국','','','아니오',0),(97,'우리나라 가장 동쪽 영화제','','아시아','한국','','','아니오',0),(98,'시네광주1980 온라인 영화제','','아시아','한국','','http://cineg1980.kr','아니오',0),(99,'김포국제청소년영화제','Gimpo International Youth Film Festival : GIYFF','아시아','한국','김포','http://www.gimpoyff.com/','아니오',1),(100,'광주독립영화제','Gwangju Independent Film Festival','아시아','한국','광주','http://gift4u.or.kr/','아니오',1);
/*!40000 ALTER TABLE `festival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'SF'),(2,'애니메이션'),(3,'범죄'),(4,'공포(호러)'),(5,'기타'),(6,'액션'),(7,'다큐멘터리'),(8,'코미디'),(9,'판타지'),(10,'전쟁'),(11,'스릴러'),(12,'가족'),(13,'멜로/로맨스'),(14,'어드벤처'),(15,'미스터리'),(16,'뮤지컬'),(17,'드라마'),(18,'공연'),(19,'서부극(웨스턴)');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`good_id`),
  KEY `FK_GOOD_USER_idx` (`user_id`),
  KEY `FK_GOOD_MOVIE_idx` (`movie_id`),
  CONSTRAINT `FK_GOOD_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_LIKE_MOVIE` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (1,1,1),(2,1,22),(3,1,8),(4,1,89),(5,1,58),(6,1,123),(7,2,8),(8,2,22),(9,2,89),(10,2,58),(11,3,1),(12,3,8),(13,3,22),(14,3,123),(15,3,6),(16,3,200),(17,1,200);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest` (
  `interest_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `festival_id` int(11) NOT NULL,
  PRIMARY KEY (`interest_id`),
  KEY `FK_INTEREST_USER_idx` (`user_id`),
  KEY `FK_INTEREST_FESTIVAL_idx` (`festival_id`),
  CONSTRAINT `FK_INTEREST_FESTIVAL` FOREIGN KEY (`festival_id`) REFERENCES `festival` (`festival_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INTEREST_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (1,4,32),(2,4,80),(3,4,20),(4,4,93),(5,4,99),(6,4,88),(7,4,27),(8,4,90),(9,4,48),(10,4,18),(11,5,27),(12,5,50),(13,5,32),(14,5,80),(15,5,26),(16,5,100),(17,6,27),(18,6,80);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `released_date` varchar(4) NOT NULL,
  `nation` varchar(50) NOT NULL,
  `movie_type` varchar(50) NOT NULL,
  `movie_status` varchar(50) NOT NULL,
  `director` varchar(255) NOT NULL,
  `production` varchar(255) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `dislike_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'극장판 검정고무신 : 즐거운 나의 집','2022','한국','장편','개봉','송정율,송요한','㈜형설앤,㈜새한프로덕션',2,0),(2,'4DX 문유','2022','한국','장편','개봉','윤현정,이지혜,문교리','씨제이포디플렉스 주식회사',0,0),(3,'음양살수','2019','중국','장편','기타','','',0,0),(4,'천년여우','2019','중국','장편','기타','','',0,0),(5,'소리가 사라진 마을','2020','한국','단편','기타','정지나','',0,0),(6,'마이 리틀 레나타','2020','독일','장편','기타','','',1,0),(7,'유포자들','2022','한국','장편','개봉예정','','KBS',0,0),(8,'캡틴 아메리카: 윈터 솔져','2014','미국','장편','개봉','조 루소,안소니 루소','',3,0),(9,'캡틴 아메리카: 시빌 워','2015','미국','장편','개봉','안소니 루소,조 루소','',0,0),(10,'더 메뉴','2022','미국','장편','개봉예정','마크 미로드','',0,0),(11,'데시벨','2021','한국','장편','개봉예정','황인호','이스트드림시노펙스(주),㈜기억속의매미',0,0),(12,'초대: 스와핑 데이','2021','프랑스','장편','기타','','',0,0),(13,'작전','2022','한국','단편','기타','김태윤','',0,0),(14,'지나친 하루','2021','한국','단편','기타','','',0,0),(15,'깜빡깜빡','2021','한국','단편','기타','임다슬','',0,0),(16,'호수','2022','한국','단편','기타','','',0,0),(17,'산낙지','2022','한국','단편','기타','','',0,0),(18,'나를 찾아서','2021','한국','단편','기타','황동욱','',0,0),(19,'캐리어우먼','2022','한국','단편','기타','황동욱','',0,0),(20,'먼길 3부작','2019','한국','옴니버스','기타','황동욱','',0,0),(21,'졸작이 살아있다','2022','한국','단편','기타','','',0,0),(22,'정직한 후보2','2022','한국','장편','개봉','장유정','(주)수필름,(주)홍필름',3,0),(23,'만원의 행복','2022','한국','단편','기타','','',0,0),(24,'혜주','2020','한국','단편','기타','황동욱','',0,0),(25,'또 만나요','2022','한국','단편','기타','옥수분','',0,0),(26,'이고','2022','한국','단편','기타','','',0,0),(27,'글을 쓴다는 것, 생이 쓰다는 것','2022','한국','단편','기타','','',0,0),(28,'초복','2022','한국','단편','기타','','',0,0),(29,'일반통행','2021','한국','단편','기타','','',0,0),(30,'매장','2021','한국','단편','기타','','',0,0),(31,'런','2021','한국','단편','기타','','',0,0),(32,'양의 공간','2021','한국','단편','기타','','',0,0),(33,'레이징 비트','2021','한국','단편','기타','전아현','',0,0),(34,'트랜스','2020','한국','장편','개봉예정','도내리','네거티브 필름 프로덕션즈',0,0),(35,'수프와 이데올로기','2021','한국','장편','개봉','양영희','',0,0),(36,'탑','2022','한국','장편','개봉예정','홍상수','(주)영화제작전원사 ',0,0),(37,'인생은 아름다워','2020','한국','장편','개봉','최국희','더램프(주)',0,0),(38,'폴: 600미터','2022','영국,미국','장편','개봉예정','스콧 만','',0,0),(39,'창극 춘향','2022','한국','장편','개봉예정','김명곤','문화체육관광부 국립극장',0,0),(40,'픽션들','2022','한국','장편','개봉예정','장세경','경 필름',0,0),(41,'소금과 호수','2021','한국','단편','기타','','',0,0),(42,'헬 카운트','2022','미국','장편','개봉예정','브렌든 멀다우니','',0,0),(43,'202 201','2021','한국','단편','기타','','',0,0),(44,'오아시스','2019','한국','단편','기타','박주희','',0,0),(45,'프린스 챠밍','2018','미국,영국,캐나다','장편','개봉예정','로스 베노커','',0,0),(46,'세척','2020','한국','단편','기타','은종훈','',0,0),(47,'사슴의 왕','2021','일본','장편','기타','미야지 마사유키','',0,0),(48,'살인청부업자','2022','한국','장편','개봉예정','강태호','(주)피터팬픽쳐스',0,0),(49,'청춘시련','2021','대만','장편','개봉예정','','',0,0),(50,'그녀가 말했다','2022','미국','장편','개봉예정','마리아 슈라더','',0,0),(51,'세이레','2021','한국','장편','개봉예정','박강','',0,0),(52,'초선','2022','한국','장편','개봉예정','전후석','',0,0),(53,'남호요재3: 천년여우전','2022','중국','장편','기타','','',0,0),(54,'옆집사람','2022','한국','장편','개봉예정','염지호','',0,0),(55,'거래완료','2020','한국','장편','개봉','조경호','한국예술종합학교 산학협력단',0,0),(56,'비룡외전','2022','중국','장편','기타','','',0,0),(57,'킹덤2: 아득한 대지로','2022','미국','장편','개봉예정','사토 신스케','',0,0),(58,'신 에반게리온 극장판','2021','일본','장편','개봉','안노 히데아키','',2,1),(59,'잔혹했던 1948년 탐라의 봄','2022','한국','장편','기타','권순도','퓨어웨이픽쳐스',0,0),(60,'작은연못','2021','한국','장편','개봉예정','','',0,0),(61,'크리스마스 캐럴','2022','한국','장편','개봉준비','김성수','(주)화인컷,(주)블루플랜잇',0,0),(62,'강남좀비','2021','한국','장편','개봉예정','이수성','㈜리필름',0,0),(63,'대무가','2022','한국','장편','개봉','이한종','(주)쿠키픽쳐스',0,0),(64,'에브리씽 에브리웨어 올 앳 원스','2022','미국','장편','개봉','다니엘 콴,다니엘 쉐이너트','',0,0),(65,'파이어버드','2021','에스토니아,영국','장편','개봉예정','','',0,0),(66,'올빼미','2021','한국','장편','개봉예정','안태진','(주)씨제스엔터테인먼트,(주)영화사 담담',0,0),(67,'스트레인지 월드','2022','미국','장편','개봉예정','돈 홀,퀴 응우옌','',0,0),(68,'프레이 포 더 데블','2022','미국','장편','개봉예정','다니엘 스탬','',0,0),(69,'루팡의 딸 극장판','2021','일본','장편','개봉예정','타케우치 히데키','',0,0),(70,'사랑은 지금부터 시작이야','1990','한국','장편','개봉','이미례','동방영화사',0,0),(71,'미인','1975','한국','장편','개봉','이형표','신프로덕션',0,0),(72,'자백','2020','한국','장편','개봉','윤종석','리얼라이즈픽쳐스(주)',0,0),(73,'만인의 연인','2021','한국','장편','개봉준비','한인미','(주)시네마달',0,0),(74,'모자산책','2022','한국','장편','개봉예정','조성규','(주)와우',0,0),(75,'리멤버','2020','한국','장편','개봉','이일형','(주)영화사 월광',0,0),(76,'동감','2022','한국','장편','개봉예정','서은영','(주)고고스튜디오',0,0),(77,'포프란: 사라진 X를 찾아서','2022','일본','장편','개봉','우에다 신이치로','',0,0),(78,'죽어도 자이언츠','2022','한국','장편','개봉','이동윤','',0,0),(79,'스타게이저: 아스트로스코프','2022','한국','장편','개봉','도하','(주)위즈온센',0,0),(80,'바커스: 고양이를 조심해!','2020','러시아','장편','개봉','','',0,0),(81,'낮에는 덥고 밤에는 춥고','2021','한국','장편','개봉','박송열','',0,0),(82,'극장판 유루캠△','2022','일본','장편','개봉','','',0,0),(83,'압꾸정','2022','한국','장편','개봉예정','임진순','주식회사 빅펀치픽쳐스,(주)홍필름,(주)비에이엔터테인먼트',0,0),(84,'본즈 앤 올','2022','미국','장편','개봉예정','루카 구아다니노','',0,0),(85,'리틀 포레스트','2018','한국','장편','개봉','임순례','(주)영화사수박',0,0),(86,'로드 어헤드','2021','캐나다','장편','기타','','',0,0),(87,'영화사 2부','1998','프랑스','장편','기타','장 뤽 고다르','',0,0),(88,'영화사 1부','1998','프랑스','장편','기타','장 뤽 고다르','',0,0),(89,'노 맨즈 랜드','2020','미국','장편','기타','코너 알린','',2,0),(90,'같은 속옷을 입는 두 여자','2021','한국','장편','개봉예정','김세인','한국영화아카데미',0,0),(91,'양성인간','2021','대만','장편','개봉예정','','',0,0),(92,'영웅','2020','한국','장편','개봉준비','윤제균','(주)제이케이필름,(주)씨제이이엔엠',0,0),(93,'깐부(코로나방학소동)','2022','한국','장편','기타','김문옥','스마일픽쳐스',0,0),(94,'탄생','2021','한국','장편','개봉예정','박흥식','민영화사',0,0),(95,'첫번째 아이','2021','한국','장편','개봉예정','허정재','화원',0,0),(96,'밤이 되었습니다','2021','한국','단편','기타','이형구','',0,0),(97,'취급주의','2021','한국','단편','기타','이형구','',0,0),(98,'씨 유 프라이데이, 로빈슨','2022','프랑스,스위스,이란','장편','기타','','',0,0),(99,'오! 슬프도다','1993','프랑스,스위스','장편','기타','장 뤽 고다르','',0,0),(100,'누벨바그','1990','스위스','장편','기타','장 뤽 고다르','',0,0),(101,'오른쪽에 주의하라','1987','프랑스,스위스','장편','기타','장 뤽 고다르','',0,0),(102,'리어왕','1987','미국,프랑스,스위스','장편','기타','장 뤽 고다르','',0,0),(103,'마리아에게 경배를','1985','프랑스','장편','기타','장 뤽 고다르','',0,0),(104,'열정','1982','스위스,프랑스','장편','기타','장 뤽 고다르','',0,0),(105,'할 수 있는 자가 구하라: 인생','1979','프랑스','장편','기타','장 뤽 고다르','',0,0),(106,'썬더버드','2021','한국','장편','개봉','이재원','한국영화아카데미',0,0),(107,'아인보: 아마존의 전설','2021','페루,네덜란드,미국','장편','개봉','리처드 클라우스,호세 젤라다','',0,0),(108,'도그','2022','미국','장편','개봉','채닝 테이텀','',0,0),(109,'낭만닥터 이영만의 모정','2022','한국','장편','기타','김문옥','스마일픽쳐스',0,0),(110,'레드 씨','2021','이집트','장편','기타','','',0,0),(111,'배드랜드','2019','미국','장편','기타','저스틴 리','',0,0),(112,'제자리 비행','2022','한국','단편','기타','차재민','',0,0),(113,'엘리의 눈','2020','한국','단편','기타','차재민','',0,0),(114,'워킹 온 더 체어스','2020','한국','단편','기타','차재민','',0,0),(115,'1보다 크거나 작거나','2018','한국','단편','기타','차재민','',0,0),(116,'히스테릭스','2014','한국','단편','기타','차재민','',0,0),(117,'프리 데드 오어 얼라이브','2022','미국','장편','기타','','',0,0),(118,'독학자','2014','한국','단편','기타','차재민','',0,0),(119,'심장과 숨','2010','한국','단편','기타','차재민','',0,0),(120,'광적인 이야기꾼들에 관한 연대기','2010','한국','단편','기타','차재민','',0,0),(121,'시간이 얼마 남지 않았음을 알린다. 탕!탕!탕!','2009','한국','단편','기타','차재민','',0,0),(122,'존 덴버 죽이기','2019','필리핀','장편','개봉예정','아덴 로즈 콘데즈','',0,0),(123,'명탐정 코난: 할로윈의 신부','2022','일본','장편','개봉','미츠나카 스스무','',2,0),(124,'관계의 일변','2022','한국','장편','기타','','주식회사 씨엠닉스',0,0),(125,'더 게임','2022','헝가리','장편','개봉예정','페테르 퍼자카스','',0,0),(126,'원피스 필름 레드','2022','일본','장편','개봉예정','타니구치 고로','',0,0),(127,'놈이 우리 안에 있다','2021','미국','장편','개봉예정','조쉬 루벤','',0,0),(128,'내 친한 친구의 아침식사','2022','대만','장편','개봉예정','두정철','',0,0),(129,'요정','2022','한국','장편','기타','신택수','한국예술종합학교 산학협력단',0,0),(130,'심야카페: 미씽 허니','2021','한국','장편','개봉예정','정윤수','(주)케이드래곤',0,0),(131,'마음 속에 남는 사람','2022','한국','단편','기타','박세암','',0,0),(132,'몬스터 신부: 101번째 프로포즈','2022','헝가리,러시아','장편','개봉예정','','',0,0),(133,'컴백홈','2022','한국','장편','개봉','이연우','(주)슬기로운늑대,(유)조이앤시네마',0,0),(134,'낮과 달','2021','한국','장편','개봉','이영아','한국영화아카데미',0,0),(135,'가재가 노래하는 곳','2021','미국','장편','개봉예정','올리비아 뉴먼','',0,0),(136,'백두산','2019','한국','장편','개봉','이해준,김병서','주식회사 덱스터 픽쳐스,(주)퍼펙트스톰필름,(주)씨제이이엔엠',0,0),(137,'고속도로 가족','2022','한국','장편','개봉예정','이상문','(주)영화사 설렘,(주)고고스튜디오',0,0),(138,'동백정원','2020','일본','장편','기타','','',0,0),(139,'우리는 같은 무대에 있다','2022','한국','장편','기타','','',0,0),(140,'장애로운 자립생활','2021','한국','단편','기타','','',0,0),(141,'누구나','2021','한국','단편','기타','','',0,0),(142,'마도로스','2022','한국','단편','기타','','',0,0),(143,'마음의 강물','2022','한국','단편','기타','','',0,0),(144,'생일선물','2021','한국','단편','기타','정재익,서태수','',0,0),(145,'블루','2021','한국','단편','기타','장건희','',0,0),(146,'주문진에서 주윤발을 만난다면','2021','한국','단편','기타','이새윤','버드커뮤니케이션',0,0),(147,'영미 사진관','2021','한국','단편','기타','','',0,0),(148,'윤슬','2022','한국','단편','기타','','',0,0),(149,'느린 걸음','2022','한국','단편','기타','','',0,0),(150,'들을 수 없어도','2022','한국','단편','기타','','',0,0),(151,'꿈의나라','2022','한국','단편','기타','','',0,0),(152,'킹 VS 몬스터','2021','미국','장편','기타','다니엘 러스코','',0,0),(153,'괴인','2022','한국','장편','기타','','',1,1),(154,'바다로 간 물고기','2022','한국','단편','기타','윤다영','',0,0),(155,'하이라이트','2019','한국','단편','기타','김영석','',0,0),(156,'당신이 내리는 밤','2021','한국','단편','기타','양경희','',0,0),(157,'부탄가스','2022','한국','단편','기타','','',0,0),(158,'일기를 말하다','2022','한국','단편','기타','','',0,0),(159,'알카라스의 여름','2022','스페인','장편','개봉예정','카를라 시몬','',0,0),(160,'에브리띵 윌 체인지','2021','독일','장편','개봉예정','','',0,0),(161,'시간을 꿈꾸는 소녀','2022','한국','장편','개봉준비','박혁지','(주)하이하버픽쳐스',0,0),(162,'맨 온 엣지','2022','홍콩,중국','장편','개봉예정','황명승','',0,0),(163,'아마겟돈 타임','2022','미국','장편','개봉예정','제임스 그레이','',0,0),(164,'동행: 10년의 발걸음','2022','한국','장편','개봉예정','','닻 프로덕션,(주)디오시네마',0,0),(165,'암스테르담','2022','미국','장편','기타','데이빗 O. 러셀','',0,0),(166,'통영에서의 하루','2022','한국','장편','개봉예정','한경탁','투영필름',0,0),(167,'리벤지 오브 파이어','2021','남아프리카공화국','장편','기타','','',0,0),(168,'블랙 사이트','2020','호주','장편','개봉예정','','',0,0),(169,'판타스틱 씨네클래스 - 잇다','2022','한국','옴니버스','기타','','',0,0),(170,'지루박','2022','한국','단편','기타','서시온','',0,0),(171,'코끼리 뒷다리 더듬기','2022','한국','단편','기타','','',0,0),(172,'선물','2022','한국','단편','기타','전찬우','',0,0),(173,'수화통역사','2021','한국','단편','기타','정서원','',0,0),(174,'윌 빈튼의 클레이드림','2020','미국','장편','기타','마크 에반스','',0,0),(175,'섬.망(望)','2022','한국','장편','기타','박순리','순리필름',0,0),(176,'트랜스-컨티넨탈-레일웨이','2021','한국','단편','기타','정재훈','',0,0),(177,'환몽','2021','한국','단편','기타','','',0,0),(178,'메가 샤크2','2021','중국','장편','기타','','',0,0),(179,'짜장면 고맙습니다','2022','한국','장편','기타','','',0,0),(180,'인디플렉스 데이: 가을날의 단편영화관 2. 여기, 바깥의 우리','2022','한국','옴니버스','기타','','',0,0),(181,'인디플렉스 데이: 가을날의 단편영화관 1. 영향 아래의 우리','2022','한국','옴니버스','기타','','',0,0),(182,'기적을 믿는 소녀','2021','미국','장편','개봉예정','리처드 코렐','',0,0),(183,'플레이 온','2019','한국','단편','기타','고동환','',0,0),(184,'제9회 부산가치봄영화제 묶음상영','2022','한국','옴니버스','기타','','',0,0),(185,'A Better Tomorrow','2022','한국','단편','기타','','',0,0),(186,'우수','2021','한국','장편','개봉예정','오세현','(주)률필름',0,0),(187,'파리로 가는 길','2016','미국','장편','개봉','엘레노어 코폴라','',0,0),(188,'코다','2021','프랑스','장편','개봉','션 헤이더','',0,0),(189,'오즈의 마법사','1939','미국','장편','개봉','빅터 플레밍','',0,0),(190,'말임씨를 부탁해','2021','한국','장편','개봉','박경목','(주)파란오이,안목',0,0),(191,'니얼굴','2020','한국','장편','개봉','서동일','두물머리픽쳐스',0,0),(192,'창밖은 겨울','2020','한국','장편','개봉예정','이상진','끼리끼리 필름',0,0),(193,'블랙 아담','2022','미국','장편','개봉','자움 콜렛 세라','',0,0),(194,'달짝지근해','2022','한국','장편','후반작업','이한','(주)무비락',0,0),(195,'물방울을 그리는 남자','2021','한국','장편','개봉','김오안,브리짓 부이요','(주)미루픽처스',0,0),(196,'분노의 추격자','2022','미국','장편','개봉예정','브라이언 굿맨','',0,0),(197,'프로메어','2019','일본','장편','개봉','이마이시 히로유키','',0,0),(198,'더 요트','2022','미국','장편','개봉','','',0,0),(199,'브로커','2022','한국','장편','개봉','고레에다 히로카즈','영화사 집',0,0),(200,'헤어질 결심','2022','한국','장편','개봉','박찬욱','(주)모호필름',2,0);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `festival_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `comment_cnt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_id`),
  KEY `FK_POST_USER_idx` (`user_id`),
  KEY `FK_POST_FESTIVAL_idx` (`festival_id`),
  CONSTRAINT `FK_POST_FESTIVAL` FOREIGN KEY (`festival_id`) REFERENCES `festival` (`festival_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_POST_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,4,32,'17일에 같이 가실 분 구해요!','10시에 얼리버드 입장하실 분 구합니다~','2022-11-16 09:23:30','2022-11-16 09:23:30',0),(2,4,80,'16일에 같이 가실 여성 분 구해요!','같이 가서 영화제 즐기고 옵시당','2022-11-16 09:24:50','2022-11-16 09:24:50',2),(3,4,79,'18일에 같이 가실 20대 구해요!','제가 20대라서 20대로 구해봅니다ㅎㅎ같이 영화 얘기해요!','2022-11-16 09:25:47','2022-11-16 09:25:47',0),(4,5,32,'17일에 같이 가실 분? 표 2장 생겨서 구해요~','무료 입장하고 싶으신 분 연락주세요! ','2022-11-16 09:27:01','2022-11-16 09:27:01',0),(5,5,27,'17일에 같이 가실 분??','영화제 처음인데 같이 즐기고 오실 분 구해욥!','2022-11-16 09:27:50','2022-11-16 09:27:50',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bio` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `FK_PROFILE_USER_idx` (`user_id`),
  CONSTRAINT `FK_PROFILE_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,1,'Hello'),(2,2,'Hello'),(3,3,'Hello'),(4,4,'Hello'),(5,5,'Hello'),(6,6,'Hello');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `FK_USER_idx` (`user_id`),
  KEY `FK_MOVIE_idx` (`movie_id`),
  CONSTRAINT `FK_REVIEW_MOVIE` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,22,'정말 재미있게 봤습니다! 최고에요 :)',5,'2022-11-16 19:11:57','2022-11-16 19:11:57'),(2,1,8,'마블 영화는 언제나 성공적인거같아요! 너무 재미있습니다',4,'2022-11-16 19:12:21','2022-11-16 19:12:21'),(3,1,1,'어릴적 추억이 샘솟는 애니메이션이었어요! 나중에 동생하고 같이 오고싶어요',4,'2022-11-16 19:12:50','2022-11-16 19:12:50'),(4,1,58,'결말이 심오해서 해석하는 즐거움이 있었어요',5,'2022-11-16 19:13:21','2022-11-16 19:13:21'),(5,2,22,'라미란 배우님이 출연하신 영화는 언제나 최고인거같아요! 코미디 영화 보고싶은 분들께 추천드립니다 :)',4,'2022-11-16 19:14:24','2022-11-16 19:14:24'),(6,2,8,'친구들이랑 보러갔는데 너무 즐거웠어요! 마블영화 좋아하시면 추천드립니다',5,'2022-11-16 19:14:50','2022-11-16 19:14:50'),(7,2,89,'감정이입하게 되는 슬픈 영화였어요',3,'2022-11-16 19:15:13','2022-11-16 19:15:13'),(8,3,8,'역시 마블은 재미는 보장하고 가는거같아요 😊',4,'2022-11-16 19:16:40','2022-11-16 19:16:40'),(9,3,1,'기영이가 바나나를 먹고 눈물 흘리는 모습이 감동적이었어요 😥',4,'2022-11-16 19:17:48','2022-11-16 19:17:48'),(10,3,89,'흔한 신파극이었습니다... 비추천드려요!',1,'2022-11-16 19:18:09','2022-11-16 19:18:09'),(11,3,123,'명탐정 코난 팬이시라면 꼭 챙겨보세요! 너무 재밌어요! 🔥',5,'2022-11-16 19:18:43','2022-11-16 19:18:43'),(12,3,58,'내용이 너무 암울해서 기분이 안좋아졌어요 :(',2,'2022-11-16 19:19:09','2022-11-16 19:19:09'),(13,3,200,'박찬욱 감독님 영화는 다 챙겨봤어요! 이번 영화도 정말 명작입니다❤️',5,'2022-11-16 19:19:47','2022-11-16 19:19:47');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dev.siyeon@gmail.com','$2y$10$eCIywz7MlL7t6MTStUvfy.piq17dBxNP7xOqBLQ1qzTt/TnrymEIi','시연'),(2,'fubies@naver.com','$2y$10$tcaBHzh9IUXdY7b8vfOZoeoxAdGE1jygXVTzXmHStZ5qC0Crg1wde','퍼비'),(3,'team01@ewhain.net','$2y$10$JX.sYKGIkeCWJu/wKORyF.DpVRXF0rwctI.a5/XLwWsuvJepJHX9C','빅데응'),(4,'nitro1886@gmail.com','$2y$10$E24rm2Q4VluEWQyRCkAr.OaofGYHmhwjBIyip//yrmETJ2i5q5yam','니트'),(5,'fubies1886@gmail.com','$2y$10$KKsEMk7B/lJE9mePMAk63OhiTLW610.D4I5sSg7qTN1BoPudtViFe','퍼비비'),(6,'nitro@gmail.com','$2y$10$LV2pykfJbJFmn/D6A5IwWOGFnWz4suRYJrDMZ7v7gyxBtbLr7dd2G','밍지');
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

-- Dump completed on 2022-11-17  3:31:21
