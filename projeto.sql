-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Out-2019 às 02:36
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `UserID` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `Nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `UserID` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `frete`
--

CREATE TABLE `frete` (
  `Cidade` varchar(50) NOT NULL,
  `Valor` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Preco` decimal(4,2) NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Imagem` varchar(50) DEFAULT NULL,
  `Estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `Nome`, `Preco`, `Descricao`, `Imagem`, `Estoque`) VALUES
(1, 'E o vento levou', '10.00', 'filme muito top', NULL, NULL),
(2, 'Im here... now', '2.00', 'filme um pouco menos top', NULL, 0),
(3, 'hellraiser', '7.00', 'um filme meio bunda', NULL, NULL),
(4, 'Fateful Findings', '2.00', 'filme um pouco menos top', NULL, 0),
(5, 'Fateful Findings', '2.00', 'filme um pouco menos top', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `UserID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `CPF` int(11) NOT NULL,
  `IsADM` tinyint(4) NOT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Endereco` varchar(50) NOT NULL,
  `NFuncionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`UserID`,`idProduto`),
  ADD KEY `Produto_idx` (`idProduto`),
  ADD KEY `Usuario_idx` (`UserID`);

--
-- Índices para tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`UserID`,`idProduto`),
  ADD KEY `Produto_idx` (`idProduto`),
  ADD KEY `Usuario_idx` (`UserID`);

--
-- Índices para tabela `frete`
--
ALTER TABLE `frete`
  ADD PRIMARY KEY (`Cidade`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  ADD UNIQUE KEY `NFuncionario_UNIQUE` (`NFuncionario`),
  ADD KEY `Cidade_idx` (`Cidade`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `ProdutoAvalia` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `UsuarioAvalia` FOREIGN KEY (`UserID`) REFERENCES `usuario` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `Produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Usuario` FOREIGN KEY (`UserID`) REFERENCES `usuario` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Cidade` FOREIGN KEY (`Cidade`) REFERENCES `frete` (`Cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
