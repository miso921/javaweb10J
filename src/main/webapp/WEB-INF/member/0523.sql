-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.19-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- javaweb10j 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `javaweb10j` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `javaweb10j`;

-- 테이블 javaweb10j.eventdate 구조 내보내기
CREATE TABLE IF NOT EXISTS `eventdate` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `eventIdx` int(11) NOT NULL,
  `eDate` datetime NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `eventIdx` (`eventIdx`),
  CONSTRAINT `eventdate_ibfk_1` FOREIGN KEY (`eventIdx`) REFERENCES `eventinput` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb10j.eventdate:~0 rows (대략적) 내보내기
DELETE FROM `eventdate`;
/*!40000 ALTER TABLE `eventdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventdate` ENABLE KEYS */;

-- 테이블 javaweb10j.eventinput 구조 내보내기
CREATE TABLE IF NOT EXISTS `eventinput` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `part` char(4) DEFAULT NULL,
  `eventName` varchar(30) NOT NULL,
  `eTime` varchar(20) NOT NULL,
  `people` int(11) NOT NULL,
  `peopleNum` int(11) DEFAULT '0',
  `place` varchar(30) NOT NULL,
  `target` varchar(30) DEFAULT NULL,
  `money` varchar(30) DEFAULT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `unique_name` (`eventName`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb10j.eventinput:~4 rows (대략적) 내보내기
DELETE FROM `eventinput`;
/*!40000 ALTER TABLE `eventinput` DISABLE KEYS */;
INSERT INTO `eventinput` (`idx`, `part`, `eventName`, `eTime`, `people`, `peopleNum`, `place`, `target`, `money`, `photo`) VALUES
	(4, '봉사', '건강도, 환경도 지키는 초록 지구 만들기 플로깅 봉사', '16:00', 5, 0, '안녕산', '모두', '0', '스크린샷 2023-03-28 063929.png'),
	(5, '봉사', '보람과 재미를 함께 느끼는 집수리 봉사 <동두천>', '10:00', 7, 0, '누구사무실', '모두', '50000', '스크린샷 2023-03-28 0639291.png'),
	(6, '체험', '봄맞이 인테리어 도전! 나만의 러그 만들기', '14:00', 10, 0, '안녕공방', '누구나', '30000', '스크린샷 2023-03-28 063905.png'),
	(7, '봉사', '아이들의 외로운 시간을 달래줄 칼림바 DIY 만들기', '15:00', 10, 0, '비대면', '누구나', '10000', '스크린샷 2023-03-28 0639051.png'),
	(8, '봉사', '음식만들기', '16:00', 15, 0, '안녕음식', '누구나', '10000', '스크린샷 2023-03-28 0639052.png'),
	(9, '봉사', '쓰레기줍기', '15:00', 10, 0, '높아산', '누구나', '0', '스크린샷 2023-03-28 0639053.png'),
	(10, '체험', '인형만들기', '14:00', 10, 0, '안녕공방', '누구나', '10000', '3.jpg'),
	(11, '체험', '물컵만들기', '18:00', 10, 0, '컵공방', '누구나', '10000', '31.jpg'),
	(12, '체험', '파우치만들기', '13:00', 10, 0, '멋져공방', '누구나', '10000', '32.jpg'),
	(13, '봉사', '건강', '21:00', 10, 0, '하하', '누구나', '10000', '33.jpg'),
	(16, '봉사', '안녕', '10:00', 10, 0, '안', '녕', '0', '36.jpg');
/*!40000 ALTER TABLE `eventinput` ENABLE KEYS */;

-- 테이블 javaweb10j.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mid` varchar(20) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `salt` char(8) NOT NULL,
  `birthday` datetime DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(5) DEFAULT '미선택',
  `userDel` char(2) DEFAULT 'NO',
  `level` int(11) DEFAULT '1',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb10j.member:~4 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`idx`, `name`, `mid`, `nick`, `pwd`, `salt`, `birthday`, `address`, `tel`, `email`, `gender`, `userDel`, `level`) VALUES
	(4, '관리자', 'admin', '대장', 'b4f31818f9599fbff3a27aad59261aee97c24bb08c8aa2e5eee63222c0707a15', '467b7b28', '2023-05-19 00:00:00', '28686 /충북 청주시 서원구 수곡로 78 / / (수곡동, 한마음1차아파트) /', '010-1234-1234', 'misoo921@naver.com', '여자', 'NO', 0),
	(5, '이회원', 'khw1234', '나는야', '4847c123146654dce621df84d49c7238ae30992a94ced9eeddeba5532412575e', 'df5ecd52', '1996-06-16 00:00:00', '18568 /경기 화성시 우정읍 3.1만세로 1 /2층  / /', '010-1234-1234', 'khw16@naver.com', '여자', 'NO', 1),
	(6, '초코파이', 'pie1234', '정', 'cffd71ec39252259a69e65becf1b9492bfb1634f4ede105d2e5f42c7afa85d2a', 'd4eaad95', '1997-04-12 00:00:00', '06000 /서울 강남구 압구정동 379 /3층 / /', '010-4563-4634', 'pie1234@naver.com', '남자', 'NO', 1),
	(7, '펭귄', 'p1234', '나는펭귄', '4a8d40f9aae5fbd4562b00734939f2ca7d9abf970778e05c1abc48e91e418f39', 'fde9bc5a', '2023-05-22 00:00:00', ' / / / /', '010-6537-3423 ', 'p1234@naver.com', '미선택', 'NO', 1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
