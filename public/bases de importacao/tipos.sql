-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Dez 12, 2011 as 08:12 AM
-- Versão do Servidor: 5.1.49
-- Versão do PHP: 5.3.3-1ubuntu9.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `biblioteca_development`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos`
--

CREATE TABLE IF NOT EXISTS `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `tipos`
--

INSERT INTO `tipos` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'CAIC', '2010-10-19 14:41:34', '2010-10-19 14:41:34'),
(2, 'CASA DA CRIANCA', '2010-10-19 14:41:38', '2010-10-19 14:41:38'),
(3, 'CENTRO DE INCLUSAO', '2010-10-19 14:41:43', '2010-10-19 14:41:43'),
(4, 'CIEP', '2010-10-19 14:41:50', '2010-10-19 14:41:50'),
(5, 'CRECHE', '2010-10-19 14:41:56', '2010-10-19 14:41:56'),
(7, 'EMEF', '2010-10-19 14:42:17', '2010-10-19 14:42:17'),
(8, 'EMEI', '2010-10-19 14:42:23', '2010-10-19 14:42:23'),
(9, 'SEDUC', '2010-10-22 09:47:14', '2010-10-22 09:47:14'),
(10, 'ITINERANCIA', '2010-10-25 10:12:20', '2010-10-25 10:12:20'),
(11, 'PREFEITURA MUNICIPAL DE AMERICANA', '2010-10-28 10:06:02', '2010-10-28 10:06:02'),
(12, 'CASA DO CONTO', '2010-11-26 12:51:37', '2010-11-26 12:51:37');
