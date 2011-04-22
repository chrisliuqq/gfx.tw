-- phpMyAdmin SQL Dump
-- version 3.3.7deb5
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2011 at 12:06 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.3-7+squeeze1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `gfx-stage`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `name` varchar(200) NOT NULL,
  `ready` enum('Y','N') NOT NULL DEFAULT 'N',
  `shown` enum('Y','N') NOT NULL DEFAULT 'Y',
  `admin` enum('Y','N') NOT NULL DEFAULT 'N',
  `title` text NOT NULL,
  `avatar` varchar(45) CHARACTER SET ascii NOT NULL,
  `email` varchar(200) NOT NULL,
  `bio` text NOT NULL,
  `web` varchar(1024) NOT NULL,
  `blog` varchar(1024) NOT NULL,
  `blog_rss` varchar(1024) NOT NULL,
  `recommendation` text NOT NULL,
  `forum_id` bigint(20) NOT NULL,
  `forum_username` varchar(48) NOT NULL,
  `feature_0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `feature_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `feature_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `custom_features1_title` varchar(64) NOT NULL,
  `custom_features1_description` text NOT NULL,
  `custom_features2_title` varchar(64) NOT NULL,
  `custom_features2_description` text NOT NULL,
  `custom_features3_title` varchar(64) NOT NULL,
  `custom_features3_description` text NOT NULL,
  `features_victor` bigint(20) NOT NULL DEFAULT '0',
  `count` bigint(20) unsigned NOT NULL DEFAULT '1',
  `visited` bigint(20) unsigned NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

