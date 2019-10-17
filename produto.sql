-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2019 às 23:59
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


-- !!!EXECUTAR SEPARADAMENTE!!!
--
-- Banco de dados: projeto
--
CREATE SCHEMA IF NOT EXISTS Projeto;
-- --------------------------------------------------------

--
-- Estrutura da tabela produto
--
CREATE TABLE IF NOT EXISTS Projeto.Produto (
  idProduto INT NOT NULL,
  Nome VARCHAR(50) NOT NULL,
  Preco DECIMAL(4,2) NOT NULL,
  Descricao VARCHAR(100) NULL,
  Imagem VARCHAR(50) NULL,
  Estoque INT  NULL,
  PRIMARY KEY (idProduto))
ENGINE = InnoDB;

--
-- Estrutura da tabela Usuario
--
CREATE TABLE IF NOT EXISTS Projeto.Usuario (
  UserID INT NOT NULL,
  Nome VARCHAR(50) NOT NULL,
  CPF INT NOT NULL,
  IsADM TINYINT NOT NULL,
  Cidade VARCHAR(50) NULL,
  Endereco VARCHAR(50) NOT NULL,
  NFuncionario INT NULL AUTO_INCREMENT,
  PRIMARY KEY (UserID),
  UNIQUE INDEX CPF_UNIQUE (CPF ASC) ,
  UNIQUE INDEX NFuncionario_UNIQUE (NFuncionario ASC) ,
  INDEX Cidade_idx (Cidade ASC) ,
  CONSTRAINT Cidade
    FOREIGN KEY (Cidade)
    REFERENCES Projeto.Frete (Cidade)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--
-- Estrutura da tabela Frete
--
CREATE TABLE IF NOT EXISTS Projeto.Frete (
  Cidade VARCHAR(50) NOT NULL,
  Valor DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (Cidade))
ENGINE = InnoDB;

--
-- Estrutura da tabela Favoritos
--
CREATE TABLE IF NOT EXISTS Projeto.Favoritos (
  UserID INT NOT NULL,
  idProduto INT NOT NULL,
  PRIMARY KEY (UserID, idProduto),
  INDEX Produto_idx (idProduto ASC) ,
  INDEX Usuario_idx (UserID ASC) ,
  CONSTRAINT Produto
    FOREIGN KEY (idProduto)
    REFERENCES Projeto.Produto (idProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT Usuario
    FOREIGN KEY (UserID)
    REFERENCES Projeto.Usuario (UserID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

--
-- Estrutura da tabela Avaliacoes
--
CREATE TABLE IF NOT EXISTS Projeto.Avaliacoes (
  UserID INT NOT NULL,
  idProduto INT NOT NULL,
  Nota INT NOT NULL,
  PRIMARY KEY (UserID, idProduto),
  INDEX Produto_idx (idProduto ASC),
  INDEX Usuario_idx (UserID ASC),
  CONSTRAINT UsuarioAvalia
    FOREIGN KEY (UserID)
    REFERENCES Projeto.Usuario (UserID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT ProdutoAvalia
    FOREIGN KEY (idProduto)
    REFERENCES Projeto.Produto (idProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB

--
-- Extraindo dados da tabela produto
--

INSERT INTO produto (idProduto, nome, preco, descricao, imagem, estoque) VALUES
(1, 'E o vento levou', 10, 'filme muito top', NULL, NULL),
(2, 'tinta fresca', 2, 'filme um pouco menos top', NULL, NULL),
(3, 'hellraiser', 7, 'um filme meio bunda', NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela produto
--
--ALTER TABLE produto
--  ADD PRIMARY KEY (ID);
--COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
