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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `name`, `ready`, `shown`, `admin`, `title`, `avatar`, `email`, `bio`, `web`, `blog`, `blog_rss`, `recommendation`, `forum_id`, `forum_username`, `feature_0`, `feature_1`, `feature_2`, `custom_features1_title`, `custom_features1_description`, `custom_features2_title`, `custom_features2_description`, `custom_features3_title`, `custom_features3_description`, `features_victor`, `count`, `visited`, `modified`) VALUES
(1, 'http://www.moztw.org/', 'foxmosa', 'Y', 'Y', 'N', '狐耳摩莎', '52501aaf2bcbb9c35696b076bd3b11b8.gif', '', '我是伴隨台灣的火狐愛好者遊山玩水、遨遊網際的狐耳摩莎！', 'http://www.moztw.org/events/foxmosa-tour/', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 55, 1, '2009-04-06 12:45:18'),
(13, 'http://timdream.myid.tw/', 'TIMDREAM', 'Y', 'Y', 'Y', '提姆．提拉米蘇', '(gravatar)', 'timdream@gmail.com', '想不開跑來寫 gfx.tw 的 MozTW 工人。\n\n.....', 'http://timc.idv.tw/', 'http://blog.timc.idv.tw/', '', 'dgffdsgfds', 1996, 'timdream', 1, 3, 2, '', '', '', '', '', '', 14, 16, 2, '2011-04-06 17:18:33'),
(52, 'http://tsubasa70.blogspot.com/', 'tsubasa', 'Y', 'Y', 'N', 'Tsubasa', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 14, 1, 0, '2009-04-20 02:25:46'),
(53, 'http://a007son.myid.tw/', '__temp__6490efb27621378335f8711b9fb5e015', 'N', 'Y', 'N', 'a007son', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-04-25 08:01:39'),
(5, 'http://tobbymailbox.myid.tw/', 'tobby', 'Y', 'Y', 'N', 'Tobby', '(gravatar)', 'tobbymailbox@gmail.com', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 2, 0, '2009-04-06 12:45:18'),
(6, 'https://me.yahoo.com/a/P0dMCZ9wpe5tUUXYTJeIMHw2pLUQyQ--', '__temp__6bbcf50938deec4b52a8240ba3b97a3f', 'N', 'Y', 'N', 'https://me.yahoo.com/a/P0dMCZ9wpe5tUUXYTJeIMHw2pLUQyQ--', '', '', '', 'https://me.yahoo.com/a/P0dMCZ9wpe5tUUXYTJeIMHw2pLUQyQ--', 'https://me.yahoo.com/a/P0dMCZ9wpe5tUUXYTJeIMHw2pLUQyQ--', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 2, 0, '2009-04-06 12:45:18'),
(7, 'http://openid.claimid.com/xdite', '__temp__426a94b1dc21457e1f218718768a357b', 'N', 'Y', 'N', 'xdite', '(gravatar)', 'xdite@pixnet.tw', '', 'http://openid.claimid.com/xdite', 'http://openid.claimid.com/xdite', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 2, 0, '2009-04-06 12:45:18'),
(8, 'http://www.flickr.com/photos/ybite', 'littlebtc', 'Y', 'Y', 'N', 'Littlebtc', '', '', '', 'http://www.flickr.com/photos/ybite', 'http://www.flickr.com/photos/ybite', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 2, 0, '2009-04-06 12:45:18'),
(9, 'http://bobchao.myopenid.com/', 'bobchao', 'Y', 'Y', 'Y', '柏強', '(gravatar)', 'bobchao@gmail.com', '我是柏強柏強是我，為您搭起友誼的橋樑。', 'http://gfx.tw/bobchao/', 'http://blog.bobchao.net', '', '', 5, 'BobChao', 7, 3, 9, '', '', '', '', '', '', 648, 4, 0, '2009-07-06 21:09:57'),
(10, 'http://alicekey.wordpress.com/', 'alicekey', 'Y', 'Y', 'Y', 'alicekey', '(gravatar)', 'alicekey@gmail.com', '', 'http://alicekey.wordpress.com/', 'http://alicekey.wordpress.com/', '', '', 1516, 'alicekey', 1, 2, 3, '', '', '', '', '', '', 7, 2, 0, '2009-08-07 12:50:31'),
(17, 'https://www.google.com/accounts/o8/id?id=AItOawnD4tErRjeAS2E8mwlUNsIeMAZ1HLFowPk', 'kiri1', 'Y', 'Y', 'N', 'kiri', '', '', '', 'https://www.google.com/accounts/o8/id?id=AItOawnD4tErRjeAS2E8mwlUNsIeMAZ1HLFowPk', 'https://www.google.com/accounts/o8/id?id=AItOawnD4tErRjeAS2E8mwlUNsIeMAZ1HLFowPk', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(18, 'https://www.google.com/accounts/o8/id?id=AItOawmPEFXDl7tF-gbAfFMiGshNvRip9aLgvgk', 'Christan', 'Y', 'Y', 'N', 'Christan', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(19, 'http://cornguo.blogspot.com/', 'cornguo', 'Y', 'Y', 'N', 'CornGuo', '(gravatar)', 'cornguo@msn.com', '其實我都用 Opera 啦 (飄)', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(20, 'https://www.google.com/accounts/o8/id?id=AItOawmn52xODNxHNhbI48ufDlYR_LH1QhsOoEg', 'irvin', 'Y', 'Y', 'N', 'Irvin', '(gravatar)', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 3, 0, '2009-04-06 12:45:18'),
(22, 'https://www.google.com/accounts/o8/id?id=AItOawmO6ULyiqYyXK8rLikPn8UbaDAfgDxfoY4', '__temp__c2881bec37fb0290f394e168103c8082', 'N', 'Y', 'N', '', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(23, 'https://www.google.com/accounts/o8/id?id=AItOawl6J-GfjbyjBJVnlgwNtEUStzlGCjqdZ4M', 'petercpg', 'Y', 'Y', 'N', 'petercpg', '(gravatar)', 'petercpg@gmail.com', '', '', '', '', '', 801, 'PeterCPG', 1, 2, 3, '', '', '', '', '', '', 7, 2, 0, '2009-04-06 12:45:18'),
(24, 'http://bryanyuan2.myid.tw/', '__temp__fe79779afef638cbfcea899a47aaea8f', 'N', 'Y', 'N', 'bryanyuan2', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(25, 'http://akong.myopenid.com/', 'akong', 'Y', 'Y', 'N', '阿剛', '', 'akong@aspa.idv.tw', '瀏覽器只有IE嗎??不只...試試看最好用的Firefox吧', 'http://pc.aspa.idv.tw', 'http://ak6783.blogspot.com/', '', '', 100117, 'akong', 1, 2, 3, '', '', '', '', '', '', 7, 3, 0, '2009-04-06 12:45:18'),
(26, 'http://chihchun.myopenid.com/', 'chihchun', 'Y', 'Y', 'N', 'Rex Tsai', '(gravatar)', 'rex.cc.tsai@gmail.com', '', 'http://peole.debian.org.tw/~chihchun/', 'http://peole.debian.org.tw/~chihchun/', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(51, 'http://abev66.blogspot.com/', 'abev66', 'Y', 'Y', 'N', 'lRabbit 兔子', '', '', '', '', '', '', '', 0, '', 3, 2, 1, '', '', '', '', '', '', 14, 1, 0, '2009-04-11 02:40:59'),
(39, 'https://www.google.com/accounts/o8/id?id=AItOawkD-eO2uTOtzGL9tZdHVNqItIS6ofnneLs', 'wm', 'Y', 'Y', 'N', 'WM', '', 'wandererm@gmail.com', 'A WM should not know anger, nor hatred, nor love. ', 'http://kidwm.net/', 'http://blog.kidwm.net/', '', '', 107255, 'wandererm', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(30, 'http://irvin.sto.tw/', 'irvinfly', 'Y', 'Y', 'N', 'Irvin 艾小明', '2010/01/5b4c7a7634c7aed09ac7de6f884553e3.gif', 'irvinfly@gmail.com', 'HIHI', '', 'http://irvin.sto.tw', '', '', 1480, 'irvin', 1, 10, 8, '', '', '', '', '', '', 1282, 1, 0, '2010-01-25 00:28:28'),
(31, 'https://www.google.com/accounts/o8/id?id=AItOawnzEf9vwmbdbL1g-ARb0cPj_n-W0epAgio', 'c9s', 'Y', 'Y', 'N', 'cornelius', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(32, 'https://www.google.com/accounts/o8/id?id=AItOawlKU14lypSEfNwygDIgeFhGNupUh_pT5Cs', 'Ijs', 'Y', 'Y', 'N', 'Ijs', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(33, 'https://www.google.com/accounts/o8/id?id=AItOawlfS5YxC98ssoTrt925bgQRrnqSg_ZmhyE', '__temp__c95c739326fd5fc1d1ae2b780bb8906b', 'N', 'Y', 'N', '', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(34, 'https://www.google.com/accounts/o8/id?id=AItOawm8irRFzWKuo-c8f5B6qsfW50vpADqeqGY', 'Jimmy', 'Y', 'Y', 'N', 'Jimmy', '', '', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(37, 'http://othree.net/', 'ie6sucks', 'Y', 'Y', 'N', 'OOO', '(gravatar)', 'othree@gmail.com', '', 'http://blog.othree.net', 'http://blog.othree.net', '', '', 1457, 'othree', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(40, 'http://josesun.myopenid.com/', 'josesun', 'Y', 'Y', 'N', 'Jose Sun', '(gravatar)', 'josesun@gmail.com', '', '', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(41, 'https://www.google.com/accounts/o8/id?id=AItOawlZAOg4Djs1ckTvnlgPH0J_Xx812lv53c0', 'zeroth', 'Y', 'Y', 'N', '余弘兵', '', 'yuid34@gmail.com', '華仁仔', '', '', '', '', 129875, '余弘兵', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2009-04-06 12:45:18'),
(42, 'https://www.google.com/accounts/o8/id?id=AItOawmX32xHtv1mOb4AZGLYvcgIUyBypdWmfqs', 'aminzai', 'Y', 'Y', 'N', 'Aminzai', '2010/01/91f0752ee4507c304d98a31a4c82393c.jpg', 'lagunawang@gmail.com', '', '', 'http://aminzai.net', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2010-01-26 10:07:39'),
(43, 'https://www.google.com/accounts/o8/id?id=AItOawlKtMCf-BcewPFm0uHWZj7aBoiswGMSANk', 'toomore', 'Y', 'Y', 'N', 'Toomore', '(gravatar)', 'toomore0929@gmail.com', 'Toomore', 'http://blog.toomore.net/', 'http://blog.toomore.net/', '', '', 103151, 'toomore', 1, 9, 5, '', '', '', '', '', '', 546, 1, 0, '2009-06-02 13:03:57'),
(45, 'https://www.google.com/accounts/o8/id?id=AItOawl_4qIBVhEDJP2mmsqou8b-mEZix__gDX4', 'tim', 'Y', 'Y', 'N', 'Tim', '(gravatar)', 'timdream@gmail.com', '', 'http://blog.timc.idv.tw/', '', '', '', 0, '', 1, 2, 3, '', '', '', '', '', '', 7, 1, 0, '2010-09-19 11:16:03'),
(46, 'https://me.yahoo.com/a/0.XpyPwesfj8D0zx.3zo_SpcDSx_rA--', 'may', 'Y', 'Y', 'N', 'may', '', 'meichihch@yahoo.com', '', '', '', '', '', 0, '', 2, 3, 6, '', '', '', '', '', '', 38, 1, 0, '2009-04-06 12:45:18'),
(47, 'https://www.google.com/accounts/o8/id?id=AItOawk4hYcGEl6SE49iZHEQE3_j-XMyInbG2SI', 'jolith', 'Y', 'Y', 'N', 'Kiri', '', 'rafm0913@gmail.com', '強度測試員', 'http://kirisolin.blogspot.com', 'http://kirisolin.blogspot.com', '', '', 0, '', 1, 3, 5, '', '', '', '', '', '', 42, 1, 0, '2009-04-16 01:58:52'),
(54, 'http://alicekey.myopenid.com/', '__temp__0e04870f542a197aefb714f335dffe41', 'N', 'Y', 'N', 'Cheng Ren Yong', '(gravatar)', 'alicekey@gmail.com', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-05-17 23:58:35'),
(55, 'https://www.google.com/accounts/o8/id?id=AItOawkH_m54qH00dJmPuuxQS9ZnSV4P8UinRAE', '__temp__2b78aca9945c09734ec94a0d72b79737', 'N', 'Y', 'N', '', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-06-23 03:57:30'),
(56, 'http://kourge.net/', '__temp__022533972e07a0103782ed30fec22b73', 'N', 'Y', 'N', 'kourge', '(gravatar)', 'kourge@gmail.com', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-06-29 21:48:57'),
(57, 'https://www.google.com/accounts/o8/id?id=AItOawkTjHYLZqE355-bz423i1L_Lyn3Z4SWVEg', '__temp__cd53dba96b23d4376fcf8daa78925c98', 'N', 'Y', 'N', '', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-07-06 21:09:19'),
(58, 'https://www.google.com/accounts/o8/id?id=AItOawlgrQt2TdngtB_10FFMb51tQzIwRocHn5M', 'ernest', 'Y', 'Y', 'N', 'Ernest', '', '', '', '', '', '', '', 0, '', 5, 8, 9, '', '', '', '', '', '', 800, 1, 0, '2009-07-06 21:14:10'),
(61, 'https://services.mozilla.com/openid/bobchao', '__temp__96bce5142b0686ee5dcfc9d0fefeddd7', 'N', 'Y', 'N', 'bobchao', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-08-16 03:35:04'),
(62, 'http://openid.pixnet.cc/u/630e71926a769861ea15a187e0160b7c', '__temp__4a9b99574f15cc798406c762e1f23fd6', 'N', 'Y', 'N', '1', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-08-17 21:18:12'),
(63, 'https://www.google.com/accounts/o8/id?id=AItOawnWnf73Zldcd3L4q14Y3uk-ks304wanaE8', 'lrabbit', 'N', 'Y', 'N', '', '', 'abev66@gmail.com', '', '', 'http://abev66.blogspot.com/', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-08-18 00:54:02'),
(64, 'http://bobchao.wordpress.com/', '__temp__c13951b9869051a7ebf882749d8bfd8c', 'N', 'Y', 'N', '', '(gravatar)', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-08-19 00:57:14'),
(65, 'http://openid.pixnet.cc/u/fd2e9f7d7e8762e1cc80f9c58a33cfd9', '__temp__da7264617ca2507bccc6ecad0b4cf966', 'N', 'Y', 'N', '1', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-08-20 05:15:26'),
(75, 'http://blog.bobchao.net/', '__temp__3522b66132df794da3f16cbdc90fd70c', 'N', 'Y', 'N', 'BobChao', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2010-01-24 18:02:16'),
(74, 'https://me.yahoo.com/a/ezM5dGUUrZ4NS8GqO3ryqvtjtEw-', '__temp__7caa772d05c6a49beaf349be117760cb', 'N', 'Y', 'N', '', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2009-11-28 20:08:55'),
(76, 'http://softcup.myopenid.com/', '__temp__819ee8f1ad81500e1c3a49a06ba1d7dd', 'N', 'Y', 'N', '', '', '', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2010-01-26 10:26:53'),
(77, 'http://timc.idv.tw/', '__temp__2aaae5fb2f8879a044076e753411e84c', 'N', 'Y', 'N', 'timdream', '', 'timdream@gmail.com', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2010-09-20 17:21:12'),
(78, 'http://mail.moztw.org/openid?id=108951794746033324472', '__temp__3fc731294b91803e08bde03fbc0ee970', 'N', 'Y', 'N', 'Tim G.T.', '(gravatar)', 'timdream@mail.moztw.org', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2010-10-17 22:14:01'),
(79, 'http://timdream.myid.tw./', '__temp__1f6adcaca097d29daf9aa809e4440ecb', 'N', 'Y', 'N', 'timdream', '(gravatar)', 'timdream@gmail.com', '', '', '', '', '', 0, '', 0, 0, 0, '', '', '', '', '', '', 0, 1, 0, '2010-10-23 19:08:30'),
(80, 'http://chrisliu.net/', 'chrisliu', 'Y', 'Y', 'N', 'Chris Liu', '(gravatar)', 'chrisliuqq@gmail.com', '你好歡迎光臨', '', '', '', '', 0, '', 16, 17, 18, '因為很快', '超快得你都不知道', '因為很穩', '超穩的你都不知道', '火狐可愛', '超可愛的你都不知道', 458752, 1, 0, '2011-04-21 18:37:04');

