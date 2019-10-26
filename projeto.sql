-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2019 às 16:54
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
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `idCarrinho` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`idCarrinho`, `idProduto`, `quantidade`) VALUES
(653434, 1, 1),
(1303868, 1, 4),
(1303868, 2, 2),
(1303868, 3, 2),
(1303868, 4, 1),
(1303868, 5, 1);

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
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `Nome` varchar(500) NOT NULL,
  `Preco` decimal(4,2) NOT NULL,
  `Descricao` varchar(2000) DEFAULT NULL,
  `Imagem` varchar(100) DEFAULT NULL,
  `Estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `UserID` int(11) NOT NULL,
  `Nome` varchar(500) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  `CPF` int(11) NOT NULL,
  `IsADM` tinyint(4) NOT NULL,
  `Endereco` varchar(500) NOT NULL
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
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`idCarrinho`,`idProduto`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices para tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`UserID`,`idProduto`),
  ADD KEY `Produto_idx` (`idProduto`),
  ADD KEY `Usuario_idx` (`UserID`);


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
  ADD UNIQUE KEY `EMAIL` (`Email`);


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
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `Produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Usuario` FOREIGN KEY (`UserID`) REFERENCES `usuario` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
