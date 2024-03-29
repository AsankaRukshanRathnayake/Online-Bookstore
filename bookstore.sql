-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 29, 2023 at 03:46 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `quantity`, `image`) VALUES
(7, 6, 'Madol Duwa', 500, 5, 'MadolDoova.jpg'),
(8, 6, 'Amba Yahaluwo', 450, 2, 'amba yahaluwo.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(2, 2, 'Asanka Rukshan Rathnayake', 'rathnay@gmail.com', '12345', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 6, 'Asanka Rukshan Rathnayake', '0123456789', 'rukshan.j500@gmail.com', 'cash on delivery', 'flat no. 64, main road, gampaha, sri lanka - 11000', ', book2 (1) , book3 (5) ', 1200, '18-Aug-2023', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `new` tinyint(1) NOT NULL DEFAULT '1',
  `discount` int(100) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `author`, `image`, `new`, `discount`) VALUES
(15, 'Madol Duwa', 'novels', 500, 'Martin Wickramasinghe', 'MadolDoova.jpg', 1, 100),
(16, 'Amba Yahaluwo', 'novels', 450, 'T.B. Ilangarathna', 'amba yahaluwo.jpeg', 1, 100),
(17, 'Ali Panchata Padamak', 'children', 320, 'Fernando W.O.T.', 'alipanchatapadamak.jpeg', 1, 100),
(18, 'Harry Potter & the Prisoner of Askaban', 'fiction', 1200, 'Rowling J.K.', 'harrypotter3.jpeg', 1, 100),
(19, 'Harry Potter & the Chamber of Secreats', 'fiction', 1250, 'Rowling J.K.', 'harrypotter2.jpeg', 1, 100),
(20, 'Harry Potter & the Sorcerer\'s Stone', 'fiction', 1200, 'Rowling J.K.', 'harrypotter1.jpg', 1, 100),
(21, 'Golu Deriya', 'shortstories', 450, 'Manawasingha Chandrarathna', 'goluderiya.jpeg', 1, 100),
(22, 'Red Pyramid', 'translation', 550, 'Rick Riordan', 'redpyramid.jpeg', 1, 100),
(23, 'Mahawansa', 'education', 3000, 'Buddhist Cultural Center', 'mahawansa.jpeg', 1, 100),
(24, 'Guru Geethaya', 'translation', 400, 'Chingees Aithmathaw', 'gurugeethaya.jpeg', 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(2, 'asanka', 'rathnay-se19053@stu.kln.ac.lk', '81dc9bdb52d04dc20036dbd8313ed055', 'user'),
(3, 'admin', '1234@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'admin'),
(4, '1', '1@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'user'),
(5, '2', '2@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c', 'user'),
(6, 'Asanka Rukshan Rathnayake', 'rukshan.j500@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
