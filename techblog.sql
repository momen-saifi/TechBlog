-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 01:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(2, 'Java Programming', 'Java is a versatile and widely-used programming language, known for its portability and robustness.'),
(3, 'Python Programming', 'Python is a high-level programming language known for its simplicity and readability, widely used in various domains including web development, data science, and artificial intelligence.'),
(4, 'Web Technology', 'Web technology encompasses a range of tools and languages used for building websites and web applications, including HTML, CSS, JavaScript, and various frameworks like React and Angular.'),
(5, 'Database Programming', 'Database programming involves working with databases to store, retrieve, and manage data efficiently, crucial for maintaining structured and organized information in any organization.');

-- --------------------------------------------------------

--
-- Table structure for table `postlike`
--

CREATE TABLE `postlike` (
  `lid` int(11) NOT NULL,
  `pid` int(20) DEFAULT NULL,
  `uid` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `postlike`
--

INSERT INTO `postlike` (`lid`, `pid`, `uid`) VALUES
(177, 5, 9),
(198, 8, 9),
(214, 6, 9),
(217, 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pid` int(11) NOT NULL,
  `ptitle` varchar(150) DEFAULT NULL,
  `pcontent` longtext DEFAULT NULL,
  `pcode` longtext DEFAULT NULL,
  `ppic` varchar(100) DEFAULT NULL,
  `pdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pid`, `ptitle`, `pcontent`, `pcode`, `ppic`, `pdate`, `cid`, `userId`) VALUES
(5, 'What is Java?', 'Java: High-level, robust, object-oriented language & platform. Created by Sun Microsystems in 1995, led by James Gosling. Originally named Oak, it was later renamed Java due to trademark issues.', '', 'java-features.png', '2024-04-20 06:10:15', 2, 9),
(6, 'What is JSP?', 'A JSP page consists of HTML tags and JSP tags. The JSP pages are easier to maintain than Servlet because we can separate designing and development. It provides some additional features such as Expression Language, Custom Tags, etc.', '<html>  \r\n<body>  \r\n<% out.print(2*5); %>  \r\n</body>  \r\n</html> ', 'jsp2.jpg', '2024-04-20 06:13:06', 2, 9),
(7, 'What is Python?', 'Python is a general-purpose, dynamically typed, high-level, compiled and interpreted, garbage-collected, and purely object-oriented programming language that supports procedural, object-oriented, and functional programming.', '# Python code to demonstrate the use of default arguments    \r\n# defining a function    \r\ndef function( n1, n2 = 20 ):    \r\n    print(\"number 1 is: \", n1)    \r\n    print(\"number 2 is: \", n2)    \r\n     \r\n     \r\n# Calling the function and passing only one argument    \r\nprint( \"Passing only one argument\" )    \r\nfunction(30)    \r\n    \r\n# Now giving two arguments to the function    \r\nprint( \"Passing two arguments\" )    \r\nfunction(50,30) ', 'advantages-of-python.png', '2024-04-20 06:18:19', 3, 9),
(8, 'What is a Web Application?', 'A web-application is an application program that is usually stored on a remote server, and users can access it through the use of Software known as web-browser.', '', 'web-application.png', '2024-04-20 06:19:36', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT 'hey ! I am using Tech Blog',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(100) DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `about`, `rdate`, `profile`) VALUES
(9, 'momen', 'momen@gmail.com', '12345', 'Male', '											Hello! I\'m Momen, a passionate MCA student diving into the world of advanced Java for web development. Exploring the intricacies of Java brings me immense joy as I seek to master its tools and techniques. With each line of code, I aim to unlock new possibilities and create innovative solutions. Join me on this exciting journey as I embrace the challenges and opportunities of web development with Java.\r\n											', '2024-04-20 05:50:38', 'momen.jpg'),
(10, 'momen saifi', 'momensaifi@gmail.com', '123', 'Male', '', '2024-04-20 10:12:38', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `postlike`
--
ALTER TABLE `postlike`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `postlike`
--
ALTER TABLE `postlike`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `postlike`
--
ALTER TABLE `postlike`
  ADD CONSTRAINT `postlike_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`),
  ADD CONSTRAINT `postlike_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
