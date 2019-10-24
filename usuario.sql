
CREATE TABLE `usuario` (
  `UserID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `IsADM` tinyint(4) DEFAULT 0,
  `Cidade` varchar(50) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `CPF_UNIQUE` (`CPF`);
  
ALTER TABLE `usuario`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;
  
INSERT INTO `usuario`(`UserID`, `Nome`, `Senha`, `CPF`, `IsADM`, `Cidade`, `Endereco`) 
	VALUES (1,'Henrique',1234,'12345678900',1,'Rio','de Janeiro');