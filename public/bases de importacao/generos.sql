-- phpMyAdmin SQL Dump
-- version 3.3.7deb3build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Jan 26, 2012 as 10:23 AM
-- Versão do Servidor: 5.1.49
-- Versão do PHP: 5.3.3-1ubuntu9.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `biblioteca_production`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `generos`
--

CREATE TABLE IF NOT EXISTS `generos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `generos`
--

INSERT INTO `generos` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'DOCUMENTÁRIO', '2011-09-26 11:35:10', '2011-09-26 11:35:10'),
(2, 'AÇÃO', '2011-09-26 11:35:19', '2011-09-26 11:35:19'),
(3, 'COMÉDIA', '2011-09-26 11:40:09', '2011-09-26 11:40:09'),
(4, 'ANIMAÇÃO', '2011-09-26 11:41:07', '2011-09-26 11:41:07'),
(5, 'AVENTURA', '2011-09-26 11:41:26', '2011-09-26 11:41:26'),
(6, 'DRAMA ', '2011-09-26 11:41:31', '2011-09-26 11:41:31'),
(7, 'TERROR', '2011-09-26 11:41:35', '2011-09-26 11:41:35'),
(8, 'FICÇÃO', '2011-09-26 11:41:57', '2011-09-26 11:41:57'),
(9, 'EDUCAÇÃO', '2011-09-26 11:48:43', '2011-09-26 11:48:43'),
(10, 'FANTASIA', '2011-09-26 11:51:41', '2011-09-26 11:51:41'),
(11, 'GUERRA', '2011-09-26 11:52:04', '2011-09-26 11:52:04'),
(12, 'BIOGRAFIA', '2011-09-26 11:53:12', '2011-09-26 11:53:12'),
(13, 'MUSICAL', '2011-09-26 11:53:37', '2011-09-26 11:53:37'),
(14, 'TEATRAL', '2011-09-26 11:53:52', '2011-09-26 11:53:52'),
(15, 'PALESTRA', '2011-09-26 12:15:38', '2011-09-26 12:15:38'),
(16, 'ARTES ', '2011-10-04 12:04:12', '2011-10-04 12:04:12'),
(17, 'MUSICA', '2011-12-14 11:29:37', '2011-12-14 11:29:41');
