-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 23, 2013 at 01:32 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rambiz_p4_ram15_biz`
--
CREATE DATABASE IF NOT EXISTS `rambiz_p4_ram15_biz` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `rambiz_p4_ram15_biz`;

-- --------------------------------------------------------

--
-- Table structure for table `gscore`
--

CREATE TABLE IF NOT EXISTS `gscore` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to store players game scores' AUTO_INCREMENT=48 ;

--
-- Dumping data for table `gscore`
--

INSERT INTO `gscore` (`score_id`, `user_id`, `level`, `created`, `score`) VALUES
(11, 13, 5, 1387749100, 30),
(12, 13, 5, 1387749183, 40),
(13, 13, 5, 1387749375, 40),
(14, 13, 0, 1387749383, 0),
(15, 13, 5, 1387749469, 40),
(16, 13, 5, 1387749517, 60),
(17, 13, 5, 1387749831, 50),
(18, 13, 5, 1387749887, 30),
(19, 13, 5, 1387749916, 30),
(20, 13, 5, 1387749924, 30),
(21, 13, 5, 1387749978, 30),
(22, 13, 5, 1387750034, 30),
(23, 13, 5, 1387750055, 30),
(24, 13, 5, 1387750073, 20),
(25, 13, 5, 1387750085, 20),
(26, 13, 10, 1387750162, 100),
(27, 13, 5, 1387750200, 40),
(28, 13, 5, 1387750263, 30),
(29, 13, 5, 1387750287, 50),
(30, 13, 10, 1387750390, 100),
(31, 13, 5, 1387750490, 30),
(32, 13, 5, 1387750503, 40),
(33, 13, 5, 1387750529, 50),
(34, 13, 5, 1387750672, 40),
(35, 13, 5, 1387750722, 20),
(36, 13, 5, 1387750743, 30),
(37, 13, 5, 1387750997, 40),
(38, 13, 5, 1387751162, 70),
(39, 13, 5, 1387751187, 30),
(40, 13, 5, 1387751606, 40),
(41, 13, 5, 1387751727, 40),
(42, 13, 10, 1387751740, 80),
(43, 13, 15, 1387751817, 150),
(44, 13, 5, 1387752566, 40),
(45, 13, 5, 1387753817, 40),
(46, 13, 10, 1387755559, 70),
(47, 13, 20, 1387756068, 200);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to collect users posts' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `created`, `modified`, `user_id`, `content`) VALUES
(1, 1383517198, 1383517198, 13, 'this is my first posting here'),
(2, 1383517216, 1383517216, 13, 'this is my second posting'),
(3, 1383518104, 1383518104, 10, 'i have a beautiful sister  '),
(4, 1383518153, 1383518153, 10, 'My sister''s name is Mayukha'),
(5, 1383518171, 1383518171, 10, 'Hi Mom and Dad'),
(6, 1383518280, 1383518280, 11, 'Hi, i got a very nice brother.'),
(7, 1383518293, 1383518293, 11, 'My Brother''s name is Sriram'),
(8, 1383518315, 1383518315, 11, 'I love my Brother. He helps me with everything.'),
(9, 1383518357, 1383518357, 11, 'I am 7 months old. '),
(10, 1383519548, 1383519548, 13, 'Hi this is Ram. Nice to be here. Keep looking for my posts.'),
(11, 1383519639, 1383519639, 12, 'Hi This is Jayasri. I already started liking this.'),
(12, 1383519663, 1383519663, 12, 'Hope everyone enjoys my posting.'),
(13, 1383520796, 1383520796, 14, 'My first test1 post'),
(14, 1383584264, 1383584264, 13, 'this is my 3rd posting'),
(15, 1383584320, 1383584320, 10, 'My test posting on 11/4'),
(16, 1383672457, 1383672457, 13, 'testing a psting'),
(18, 1383755284, 1383755284, 13, 'MiniTwitter is a free online social networking and microblogging service that enables users to send and read "minitweets", which are text messages.\r\n\r\nRegistered users can read their following people''s minitweets and post their own minitweets. Users access minitwitter through the website interface 24/7 for free.\r\n\r\nMinitwitter website was created on Nov. 2013 as part of the second assignment of CSCIE E15 course at Harvard Extension School.'),
(19, 1383755294, 1383755294, 13, 'test'),
(22, 1383757323, 1383757323, 13, 'testting with eror msg'),
(23, 1383757426, 1383757426, 13, 'test'),
(24, 1383757430, 1383757430, 13, 'sfsdf'),
(25, 1383757475, 1383757475, 13, 'tet'),
(26, 1383762771, 1383762771, 13, 'test'),
(27, 1383765401, 1383765401, 13, 'sdf'),
(28, 1387531281, 1387531281, 13, 'My post in the new database'),
(29, 1387744675, 1387744675, 13, 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` int(11) NOT NULL,
  `timezone` varchar(225) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='user table' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `created`, `modified`, `token`, `password`, `last_login`, `timezone`, `first_name`, `last_name`, `sex`, `email`) VALUES
(10, 1383509358, 1383509358, 'a633200adce660881b17ccd85786d51d9fcb464d', '17734b6edc85b67320866c1471b5d2a3c64753c8', 0, '', 'Sriram', 'Kethineni', '', 'sriram@sriram.com'),
(11, 1383516287, 1383516287, 'f364e8347fda120516593061236d1186732545c2', '21e3bce660387d120806b8fec8cce9f16cd47031', 0, '', 'mayukha', 'Kethineni', '', 'mayukha@mayukha.com'),
(12, 1383516330, 1383516330, '91c42faaa24394181ced770e55a09845b1bcfe61', 'd75e768d3d5219223030168a9e1998bf866f26df', 0, '', 'jayasri', 'Kethineni', '', 'jayasri@jayasri.com'),
(13, 1383516375, 1387721777, 'f547b4914133223155494024aeaf430f9e1b14dc', 'd5fb5284a8aae13f3ebceca6d8b6beb24e277c11', 0, '', 'Ram', 'Kethineni', '', 'ram@ram.com'),
(14, 1383520304, 1383520304, 'fb1e2136707dd2a247e28e5f10df26dcf7c523b0', 'df2bcc5699877feaf946eff3e2166ddea1de9cc8', 0, '', 'TestFirst1', 'TestLast2', '', 'test1@test1.com'),
(15, 1383703441, 1383703441, 'fc9b1047222089d3888dd9b06d835db62e1d25d9', '23a87ded277d697043da89b7d793a6bba28a3066', 0, '', 'sam', 'ulch', '', 'sam@sam.com'),
(16, 1383704201, 1383704201, 'ad714d0842b21aace1dfae983238d6b5079dc33c', '5185498f1cd615769687a347c7f1314add05e4c2', 0, '', 'Tom', 'Redmond', '', 'tom@tom.com');

-- --------------------------------------------------------

--
-- Table structure for table `users_users`
--

CREATE TABLE IF NOT EXISTS `users_users` (
  `user_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'FK Followers',
  `user_id_followed` int(11) NOT NULL COMMENT 'followed',
  PRIMARY KEY (`user_user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Link users with their followings' AUTO_INCREMENT=32 ;

--
-- Dumping data for table `users_users`
--

INSERT INTO `users_users` (`user_user_id`, `created`, `user_id`, `user_id_followed`) VALUES
(3, 1383519679, 12, 13),
(4, 1383519681, 12, 10),
(5, 1383520727, 14, 13),
(7, 1383520806, 14, 14),
(9, 1383584303, 10, 10),
(11, 1383584306, 10, 13),
(12, 1383640012, 10, 11),
(14, 1383640020, 10, 12),
(24, 1387718412, 13, 16),
(27, 1387718814, 13, 12),
(28, 1387718815, 13, 13),
(29, 1387718816, 13, 14),
(30, 1387726914, 13, 15),
(31, 1387738996, 13, 10);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_users`
--
ALTER TABLE `users_users`
  ADD CONSTRAINT `users_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
