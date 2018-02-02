-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 02-Fev-2018 às 14:35
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campeonatov2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `campeonatos`
--

CREATE TABLE `campeonatos` (
  `idcampeonato` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `dataInicio` varchar(45) DEFAULT NULL,
  `dataFim` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `campeonatos`
--

INSERT INTO `campeonatos` (`idcampeonato`, `nome`, `dataInicio`, `dataFim`) VALUES
(1, 'Carioca 2018', '2018-01-01', '2018-05-30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `idcidade` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `estado_idestado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`idcidade`, `nome`, `estado_idestado`) VALUES
(1, 'Rio de Janeiro', 1),
(2, 'Niteroi', 1),
(4, 'Duque de Caxias', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `sigla` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`idestado`, `nome`, `sigla`) VALUES
(1, 'Rio de Janeiro', 'RJ'),
(2, 'São Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `times`
--

CREATE TABLE `times` (
  `idtime` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `bandeira` varchar(45) DEFAULT NULL,
  `cidade_idcidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `times`
--

INSERT INTO `times` (`idtime`, `nome`, `bandeira`, `cidade_idcidade`) VALUES
(1, 'Flamengo', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `times_has_campeonatos`
--

CREATE TABLE `times_has_campeonatos` (
  `times_idtime` int(11) NOT NULL,
  `campeonatos_idcampeonato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `times_has_campeonatos`
--

INSERT INTO `times_has_campeonatos` (`times_idtime`, `campeonatos_idcampeonato`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `torcedores`
--

CREATE TABLE `torcedores` (
  `idtorcedore` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `times_idtime` int(11) NOT NULL,
  `cidade_idcidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `torcedores`
--

INSERT INTO `torcedores` (`idtorcedore`, `nome`, `cpf`, `logradouro`, `numero`, `complemento`, `telefone`, `times_idtime`, `cidade_idcidade`) VALUES
(1, 'Fabiano', '00000000000', 'rua a', 1000, NULL, NULL, 1, 1),
(2, 'a', 'sa', 'aaaa', 1, 'aaaa', '999', 1, 1),
(4, 'tyutuy', 'uytt', 'tyutyu', 0, 'tyutu', 'ertete', 1, 1),
(5, 'tyutuysdfsfsf', 'uyttsdfsfsf', 'tyutyudsfsdf', 4, 'tyutu', 'ertete', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD PRIMARY KEY (`idcampeonato`);

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`idcidade`),
  ADD KEY `fk_cidade_estado1_idx` (`estado_idestado`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`idtime`),
  ADD KEY `fk_times_cidade1_idx` (`cidade_idcidade`);

--
-- Indexes for table `times_has_campeonatos`
--
ALTER TABLE `times_has_campeonatos`
  ADD PRIMARY KEY (`times_idtime`,`campeonatos_idcampeonato`),
  ADD KEY `fk_times_has_campeonatos_campeonatos1_idx` (`campeonatos_idcampeonato`),
  ADD KEY `fk_times_has_campeonatos_times1_idx` (`times_idtime`);

--
-- Indexes for table `torcedores`
--
ALTER TABLE `torcedores`
  ADD PRIMARY KEY (`idtorcedore`),
  ADD KEY `fk_torcedores_times_idx` (`times_idtime`),
  ADD KEY `fk_torcedores_cidade1_idx` (`cidade_idcidade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campeonatos`
--
ALTER TABLE `campeonatos`
  MODIFY `idcampeonato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idcidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `idtime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `torcedores`
--
ALTER TABLE `torcedores`
  MODIFY `idtorcedore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `times`
--
ALTER TABLE `times`
  ADD CONSTRAINT `fk_times_cidade1` FOREIGN KEY (`cidade_idcidade`) REFERENCES `cidade` (`idcidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `times_has_campeonatos`
--
ALTER TABLE `times_has_campeonatos`
  ADD CONSTRAINT `fk_times_has_campeonatos_campeonatos1` FOREIGN KEY (`campeonatos_idcampeonato`) REFERENCES `campeonatos` (`idcampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_times_has_campeonatos_times1` FOREIGN KEY (`times_idtime`) REFERENCES `times` (`idtime`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `torcedores`
--
ALTER TABLE `torcedores`
  ADD CONSTRAINT `fk_torcedores_cidade1` FOREIGN KEY (`cidade_idcidade`) REFERENCES `cidade` (`idcidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_torcedores_times` FOREIGN KEY (`times_idtime`) REFERENCES `times` (`idtime`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
