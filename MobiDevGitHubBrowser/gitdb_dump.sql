-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 27 2014 г., 10:08
-- Версия сервера: 5.6.16
-- Версия PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `gitdb`
--
CREATE DATABASE IF NOT EXISTS `gitdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gitdb`;

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `IdProject` int(6) NOT NULL AUTO_INCREMENT,
  `IdOwner` int(6) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Watchers` int(6) DEFAULT '0',
  `Forks` int(6) DEFAULT '0',
  `OpenIssues` int(6) DEFAULT '0',
  `HomePage` varchar(255) NOT NULL,
  `GitHubRepo` varchar(255) NOT NULL,
  `DateCreation` datetime NOT NULL,
  `IsLiked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IdProject`),
  KEY `IdOwner` (`IdOwner`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- СВЯЗИ ТАБЛИЦЫ `projects`:
--   `IdOwner`
--       `users` -> `IdUser`
--

--
-- Очистить таблицу перед добавлением данных `projects`
--

TRUNCATE TABLE `projects`;
--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`IdProject`, `IdOwner`, `Name`, `Description`, `Watchers`, `Forks`, `OpenIssues`, `HomePage`, `GitHubRepo`, `DateCreation`, `IsLiked`) VALUES
(1, 1, 'yii', 'Yii PHP Framework', 1357, 836, 385, 'http://www.yiiframework.com', 'https://github.com/yiisoft/yii', '2012-02-15 16:26:22', 0),
(2, 5, 'YiiBooster', 'YiiBooster', 144, 365, 86, 'http://yiibooster.com', 'https://github.com/clevertech/YiiBooster', '2014-07-17 14:23:32', 1),
(3, 6, 'yii-eauth', 'EAuth extension allows to authenticate users with accounts on other websites.', 65, 110, 14, 'http://yii-eauth.com', 'https://github.com/Nodge/yii-eauth', '2014-03-11 19:29:38', 0),
(4, 7, 'scala', 'Construct elegant class hierarchies for maximum code reuse and extensibility.', 381, 854, 33, 'http://www.scala-lang.org', 'https://github.com/scala/scala', '2013-07-09 16:24:31', 1),
(5, 8, 'D Programming Language', 'DMD is the formal implementation of the D language. It is actively developed by the D community.', 110, 273, 9, 'http://dlang.org', 'https://github.com/D-Programming-Language/dmd', '2014-02-20 12:19:32', 0),
(6, 9, 'LiveScript', 'LiveScript is a language which compiles to JavaScript.', 116, 72, 120, 'http://livescript.net', 'https://github.com/gkz/LiveScript', '2014-04-28 10:46:17', 1),
(7, 10, 'coffeescript', 'CoffeeScript is a little language that compiles into JavaScript.', 512, 1322, 237, 'http://coffeescript.org/', 'https://github.com/jashkenas/coffeescript', '2010-12-16 12:44:25', 0),
(8, 11, 'amber', 'An implementation of the Smalltalk language that runs on top of the JS runtime', 56, 121, 43, 'http://amber-lang.net', 'https://github.com/amber-smalltalk/amber', '2014-06-05 11:17:42', 1),
(9, 12, 'racket', 'Racket is a full-spectrum programming language.', 91, 202, 17, 'http://racket-lang.org/', 'https://github.com/plt/racket', '2010-05-11 08:45:33', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `projectsusers`
--

CREATE TABLE IF NOT EXISTS `projectsusers` (
  `IdProject` int(6) NOT NULL,
  `IdUser` int(6) NOT NULL,
  KEY `IdProject` (`IdProject`),
  KEY `IdUser` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `projectsusers`:
--   `IdProject`
--       `projects` -> `IdProject`
--   `IdUser`
--       `users` -> `IdUser`
--

--
-- Очистить таблицу перед добавлением данных `projectsusers`
--

TRUNCATE TABLE `projectsusers`;
--
-- Дамп данных таблицы `projectsusers`
--

INSERT INTO `projectsusers` (`IdProject`, `IdUser`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 15),
(2, 14),
(2, 13),
(3, 12),
(3, 11),
(3, 10),
(4, 9),
(4, 8),
(4, 7),
(5, 5),
(5, 6),
(5, 7),
(6, 2),
(6, 11),
(6, 8),
(7, 4),
(7, 2),
(7, 13),
(8, 10),
(8, 1),
(8, 5),
(9, 3),
(9, 12),
(9, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `IdUser` int(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Nickname` varchar(50) NOT NULL,
  `Company` varchar(50) NOT NULL,
  `Blog` varchar(255) NOT NULL,
  `Followers` int(6) DEFAULT '0',
  `IsLiked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Очистить таблицу перед добавлением данных `users`
--

TRUNCATE TABLE `users`;
--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`IdUser`, `Name`, `Surname`, `Nickname`, `Company`, `Blog`, `Followers`, `IsLiked`) VALUES
(1, 'Quiang', 'Xue', 'yiisoft', 'Yii developers team', 'yiiframework.com', 4836, 1),
(2, 'Alexander', 'Makarov', 'samdark', 'RMCreate', 'http://rmcreative.ru/', 135, 0),
(3, 'Mat', 'Brown', 'resurtm', 'GE', 'http://ge.com/', 584, 1),
(4, 'Vinnie', 'Tokarev', 'mdomba', 'NUOS', 'http://nuos.net/', 1792, 1),
(5, 'Robert', 'Doms', 'clevertech', 'AT&T', 'http://blog5.net', 86, 0),
(6, 'Boris', 'Godunov', 'Nodge', 'MosVodokanal', 'http://blog6.ru', 2574, 1),
(7, 'Jason', 'Zaugg', 'retronym', 'FedEX', 'http://retronym.net', 197, 0),
(8, 'Walter', 'Bright', 'WalterBright', 'Digital Mars', 'http://www.walterbright.com', 178, 1),
(9, 'George', 'Zahariev', 'gkz', 'Canada', 'http://georgezahariev.com', 140, 0),
(10, 'Jeremy', 'Ashkenas', 'jashkenas', 'The New York Times', 'http://ashkenas.com', 6300, 1),
(11, 'Herbert', 'Vojčík', 'herby', 'unknown', 'http://blog.herby.sk', 23, 0),
(12, 'Matthew', 'Flatt', 'mflatt', 'PLT, University of Utah', 'http://www.cs.utah.edu/~mflatt/', 105, 0),
(13, 'Amr', 'Bedair', 'amrbedair', 'unknown', 'http://amr.nefya.com', 1, 1),
(14, 'Ruslan', 'Fadeev', 'magefad', 'unknown', 'unknown', 9, 1),
(15, 'Maksim', 'Naumov', 'fromYukki', 'Lazada.vn', 'http://yukki.name/', 6, 0);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`IdOwner`) REFERENCES `users` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `projectsusers`
--
ALTER TABLE `projectsusers`
  ADD CONSTRAINT `projectsusers_ibfk_1` FOREIGN KEY (`IdProject`) REFERENCES `projects` (`IdProject`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projectsusers_ibfk_2` FOREIGN KEY (`IdUser`) REFERENCES `users` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
