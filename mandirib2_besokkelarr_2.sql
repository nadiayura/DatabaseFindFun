-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mandirib2_besokkelarr_2
CREATE DATABASE IF NOT EXISTS `mandirib2_besokkelarr_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mandirib2_besokkelarr_2`;

-- Dumping structure for table mandirib2_besokkelarr_2.album
CREATE TABLE IF NOT EXISTS `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_year` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.album: ~1 rows (approximately)
INSERT INTO `album` (`album_id`, `artist_id`, `title`, `release_year`) VALUES
	(1, 1, 'Speak Now', 2023);

-- Dumping structure for table mandirib2_besokkelarr_2.artists
CREATE TABLE IF NOT EXISTS `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`artist_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.artists: ~1 rows (approximately)
INSERT INTO `artists` (`artist_id`, `name`, `genre_id`) VALUES
	(1, 'Taylor Swift', 1);

-- Dumping structure for table mandirib2_besokkelarr_2.event
CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `event_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.event: ~1 rows (approximately)
INSERT INTO `event` (`event_id`, `artist_id`, `event_name`, `location`, `event_status`) VALUES
	(1, 1, 'Eras Tour', 'BC Place, Vancouver, Kanada', 'No Available');

-- Dumping structure for table mandirib2_besokkelarr_2.genres
CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.genres: ~1 rows (approximately)
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
	(1, 'musik rock');

-- Dumping structure for table mandirib2_besokkelarr_2.music
CREATE TABLE IF NOT EXISTS `music` (
  `music_id` int NOT NULL AUTO_INCREMENT,
  `album_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `lyric` text,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`music_id`),
  KEY `album_id` (`album_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `music_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.music: ~1 rows (approximately)
INSERT INTO `music` (`music_id`, `album_id`, `title`, `duration`, `lyric`, `genre_id`) VALUES
	(1, 1, 'Anti Hero', 3, 'I have this thing where I get older, but just never wiser\r\nMidnights become my afternoons\r\nWhen my depression works the graveyard shift, all of the people\r\nI\'ve ghosted stand there in the room\r\nI should not be left to my own devices\r\nThey come with prices and vices\r\nI end up in crisis\r\n(Tale as old as time)\r\nI wake up screaming from dreaming\r\nOne day, I\'ll watch as you\'re leaving\r\n\'Cause you got tired of my scheming\r\n(For the last time)\r\nIt\'s me, hi, I\'m the problem, it\'s me\r\nAt teatime, everybody agrees\r\nI\'ll stare directly at the sun, but never in the mirror\r\nIt must be exhausting always rooting for the anti-hero\r\nSometimes, I feel like everybody is a sexy baby\r\nAnd I\'m a monster on the hill\r\nToo big to hang out, slowly lurching toward your favorite city\r\nPierced through the heart, but never killed\r\nDid you hear my covert narcissism\r\nI disguise as altruism\r\nLike some kind of congressman?\r\n(A tale as old as time)\r\nI wake up screaming from dreaming\r\nOne day, I\'ll watch as you\'re leaving\r\nAnd life will lose all its meaning\r\n(For the last time)\r\nIt\'s me, hi, I\'m the problem, it\'s me (I\'m the problem, it\'s me)\r\nAt teatime, everybody agrees\r\nI\'ll stare directly at the sun, but never in the mirror\r\nIt must be exhausting always rooting for the anti-hero\r\n', 1);

-- Dumping structure for table mandirib2_besokkelarr_2.music_ratings
CREATE TABLE IF NOT EXISTS `music_ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `music_id` int DEFAULT NULL,
  `review` text,
  PRIMARY KEY (`rating_id`),
  KEY `user_id` (`user_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `music_ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `music_ratings_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.music_ratings: ~1 rows (approximately)
INSERT INTO `music_ratings` (`rating_id`, `user_id`, `music_id`, `review`) VALUES
	(1, 1, 1, 'ngena banget di hati');

-- Dumping structure for table mandirib2_besokkelarr_2.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mandirib2_besokkelarr_2.users: ~1 rows (approximately)
INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
	(1, 'jono', 'jonoeak@gmail.com', 'abcdefgh');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
