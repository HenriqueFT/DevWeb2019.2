-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Out-2019 às 13:30
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
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `Nome`, `Preco`, `Descricao`, `Imagem`, `Estoque`) VALUES
(1, 'Coringa', '35.00', 'Coringa é uma história original do vilão nunca antes vista no cinema. Arthur Fleck (Joaquin Phoenix) trabalha como palhaço para uma agência de talentos e, toda semana, precisa comparecer a uma agente social, devido aos seus conhecidos problemas mentais. Após ser demitido, Fleck reage mal A  gozação de três homens em pleno metrô e os mata. Os assassinatos iniciam um movimento popular contra a elite de Gotham City, da qual Thomas Wayne (Brett Cullen) é seu maior representante. A versão de Phillips sobre Arthur Fleck, um homem desprezado pela sociedade, não é só uma visão realista do personagem, mas também uma lição de vida.', '1.jpg', 2),
(2, 'Homem-Aranha: Longe de Casa', '63.00', 'Peter Parker (Tom Holland) está em uma viagem de duas semanas pela Europa, ao lado de seus amigos de colégio, quando é surpreendido pela visita de Nick Fury (Samuel L. Jackson).\r\nPrecisando de ajuda para enfrentar monstros nomeados como Elementais, Fury o convoca para lutar ao lado de Mysterio (Jake Gyllenhaal), um novo herói que afirma ter vindo de uma Terra paralela.\r\nAlém da nova ameaça, Peter precisa lidar com a lacuna deixada por Tony Stark, que deixou para si seu óculos pessoal, com acesso a um sistema de inteligência artificial associado A  Stark Industries.', '2.jpg', 1),
(3, 'Toy Story 4', '32.00', 'Woody, Buzz, Jesse e toda a turma vivem felizes, agora como brinquedos da pequena Bonnie.\r\nEntretanto, a chegada de um garfo transformado em brinquedo, Forky, faz com que a calmaria reinante chegue ao fim, justamente porque ele não se aceita como brinquedo.', '3.jpg', 5),
(4, 'It: CapA­tulo Dois', '11.00', '27 anos depois dos eventos de \"It - A Coisa\", Mike (Isaiah Mustafa) percebe que o palhaço Pennywise (Bill Skarsgard) está de volta A  cidade de Derry.\r\nEle convoca os antigos amigos do Clube dos Otários para honrar a promessa de infância e acabar com o inimigo de uma vez por todas.\r\nMas quando Bill (James McAvoy), Beverly (Jessica Chastain), Ritchie (Bill Hader), Ben (Jay Ryan) e Eddie (James Ransone) retornam A s suas origens, eles precisam se confrontar a traumas nunca resolvidos de suas infâncias, e que repercutem até hoje na vida adulta.', '4.jpg', 34),
(5, 'O Grande Mestre 4 - A Batalha Final', '32.00', 'Ip Man 4 é um próximo filme biográfico de artes marciais de Hong Kong dirigido por Wilson Yip e produzido por Raymond Wong.\r\nA‰ o quarto da série de filmes Ip Man baseado na vida do grande mestre Wing Chun de mesmo nome e apresenta Donnie Yen reprisando o papel.', '5.jpg', 1),
(6, 'John Wick 3: Parabellum', '90.00', 'Após assassinar o chefe da máfia Santino DrAntonio no Hotel Continental, John Wick (Keanu Reeves) passa a ser perseguido pelos membros da Alta Cúpula sob a recompensa de US$ 14 milhAµes.\r\nAgora, ele precisa unir forças com antigos parceiros que o ajudaram no passado enquanto luta por sua sobrevivência.', '6.jpg', 7),
(7, 'Harry Potter e a Pedra Filosofal', '65.00', 'Harry Potter (Daniel Radcliffe) é um garoto órfão de 10 anos que vive infeliz com seus tios, os Dursley.\r\nAté que, repentinamente, ele recebe uma carta contendo um convite para ingressar em Hogwarts, uma famosa escola especializada em formar jovens bruxos.\r\nInicialmente Harry é impedido de ler a carta por seu tio Válter (Richard Griffiths), mas logo ele recebe a visita de Hagrid (Robbie Coltrane), o guarda-caça de Hogwarts, que chega em sua casa para levá-lo até a escola.\r\nA partir de então Harry passa a conhecer um mundo mágico que jamais imaginara, vivendo as mais diversas aventuras com seus mais novos amigos, Rony Weasley (Rupert Grint) e Hermione Granger (Emma Watson).', '7.jpg', 22),
(8, 'Brilho Eterno de uma Mente sem Lembranças', '99.99', 'Joel (Jim Carrey) e Clementine (Kate Winslet) formavam um casal que, durante anos, tentaram fazer com que o relacionamento desse certo.\r\nDesiludida com o fracasso, Clementine decide esquecer Joel para sempre e, para tanto, aceita se submeter a um tratamento experimental, que retira de sua memória os momentos vividos com ele.\r\nApós saber de sua atitude, Joel entra em depressão, frustrado por ainda estar apaixonado por alguém que quer esquecê-lo.\r\nDecidido a superar a questão, Joel também se submete ao tratamento experimental.\r\nPorém ele acaba desistindo de tentar esquecê-la e começa a encaixar Clementine em momentos de sua memória os quais ela não participa.', '8.jpg', 11),
(9, 'Homem-Aranha no Aranhaverso', '56.89', 'Miles Morales é um jovem negro do Brooklyn que se tornou o Homem-Aranha inspirado no legado de Peter Parker, já falecido.\r\nEntretanto, ao visitar o túmulo de seu A­dolo em uma noite chuvosa, ele é surpreendido com a presença do próprio Peter, vestindo o traje do herói aracnA­deo sob um sobretudo.\r\nA surpresa fica ainda maior quando Miles descobre que ele veio de uma dimensão paralela, assim como outras variaçAµes do Homem-Aranha.', '9.jpg', 32),
(10, 'Interestelar', '24.99', 'Após ver a Terra consumindo boa parte de suas reservas naturais, um grupo de astronautas recebe a missão de verificar possA­veis planetas para receberem a população mundial, possibilitando a continuação da espécie.\r\nCooper (Matthew McConaughey) é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos.\r\nAo lado de Brand (Anne Hathaway), Jenkins (Marlon Sanders) e Doyle (Wes Bentley), ele seguirá em busca de uma nova casa.\r\nCom o passar dos anos, sua filha Murph (Mackenzie Foy e Jessica Chastain) investirá numa própria jornada para também tentar salvar a população do planeta.', '10.jpg', 77),
(11, 'X-Men: Fênix Negra', '0.00', 'Ambientado em 1992, Charles Xavier (James McAvoy) está lidando com o fato dos mutantes serem considerados heróis nacionais.\r\nCom o orgulho a flor da pele, ele envia sua equipe para perigosas missAµes, mas a primeira tarefa dos X-Men no espaço gera uma explosão solar, que acende uma força malévola e faminta por poder dentro de Jean Grey (Sophie Turner).', '11.jpg', 0),
(12, 'Vingadores: Guerra Infinita', '60.00', 'Enquanto os Vingadores e seus aliados continuaram a proteger o mundo de ameaças grandes demais para qualquer herói, uma nova ameaça emergiu das sombras cósmicas: Thanos.\r\nUm déspota de infâmia intergalática, tem o objetivo de coletar todas as seis Joias do Infinito, artefatos de poder inimaginável, e usá-las para infligir sua vontade distorcida em toda a realidade.\r\nTudo pelo que os Vingadores lutaram levou até este momento - o destino da Terra e da própria existência nunca foi tão incerto.', '12.jpg', 4),
(13, 'Batman: O Cavaleiro das Trevas', '55.55', 'Após dois anos desde o surgimento do Batman (Christian Bale), os criminosos de Gotham City têm muito o que temer.\r\nCom a ajuda do tenente James Gordon (Gary Oldman) e do promotor público Harvey Dent (Aaron Eckhart), Batman luta contra o crime organizado.\r\nAcuados com o combate, os chefes do crime aceitam a proposta feita pelo Coringa (Heath Ledger) e o contratam para combater o Homem-Morcego.', '13.jpg', 65),
(14, 'O Senhor dos Anéis: A Sociedade do Anel', '7.00', 'Numa terra fantástica e única, chamada Terra-Média, um hobbit (seres de estatura entre 80 cm e 1,20 m, com pés peludos e bochechas um pouco avermelhadas) recebe de presente de seu tio o Um Anel, um anel mágico e maligno que precisa ser destruA­do antes que caia nas mãos do mal.\r\nPara isso o hobbit Frodo (Elijah Woods) terá um caminho árduo pela frente, onde encontrará perigo, medo e personagens bizarros.\r\nAo seu lado para o cumprimento desta jornada aos poucos ele poderá contar com outros hobbits, um elfo, um anão, dois humanos e um mago, totalizando 9 pessoas que formarão a Sociedade do Anel.', '14.jpg', 10),
(15, 'A Origem', '88.00', 'Em um mundo onde é possA­vel entrar na mente humana, Cobb (Leonardo DiCaprio) está entre os melhores na arte de roubar segredos valiosos do inconsciente, durante o estado de sono.\r\nAlém disto ele é um fugitivo, pois está impedido de retornar aos Estados Unidos devido A  morte de Mal (Marion Cotillard).\r\nDesesperado para rever seus filhos, Cobb aceita a ousada missão proposta por Saito (Ken Watanabe), um empresário japonês: entrar na mente de Richard Fischer (Cillian Murphy), o herdeiro de um império econômico, e plantar a ideia de desmembrá-lo.\r\nPara realizar este feito ele conta com a ajuda do parceiro Arthur (Joseph Gordon-Levitt), a inexperiente arquiteta de sonhos Ariadne (Ellen Page) e Eames (Tom Hardy), que consegue se disfarçar de forma precisa no mundo dos sonhos.', '15.jpg', 53),
(16, 'Divertida Mente', '25.00', 'Crescer pode ser uma jornada turbulenta, e com Riley não é diferente.\r\nEla é retirada de sua vida no meio-oeste americano quando seu pai arruma um novo emprego em São Francisco.\r\nComo todos nós, Riley é guiada pelas emoçAµes Alegria (Amy Poehler), Medo (Bill Hader), Raiva (Lewis Black), Nojinho (Mindy Kaling) e Tristeza (Phyllis Smith).\r\nAs emoçAµes vivem no centro de controle dentro da mente de Riley, onde a ajudam com conselhos em sua vida cotidiana.\r\nConforme Riley e suas emoçAµes se esforçam para se adaptar A  nova vida em São Francisco, começa uma agitação no centro de controle.\r\nEmbora Alegria, a principal e mais importante emoção de Riley, tente se manter positiva, as emoçAµes entram em conflito sobre qual a melhor maneira de viver em uma nova cidade, casa e escola.', '16.jpg', 66),
(17, 'Guerra nas Estrelas', '30.00', 'Luke Skywalker (Mark Hammil) sonha ir para a Academia como seus amigos, mas se vê envolvido em uma guerra intergalática quando seu tio compra dois robôs e com eles encontra uma mensagem da princesa Leia Organa (Carrie Fisher) para o jedi Obi-Wan Kenobi (Alec Guiness) sobre os planos da construção da Estrela da Morte, uma gigantesca estação espacial com capacidade para destruir um planeta.\r\nLuke então se junta ao cavaleiro jedi e a Han Solo (Harrison Ford), um mercenário, para tentar destruir esta terrA­vel ameaça ao lado dos membros da resistência.', '17.jpg', 69),
(18, 'MIIB - Homens de Preto 2', '35.00', 'Com a Terra sendo ameaçada pela presença de Serleena (Lara Flynn Boyle), uma Kylothian cruel e monstruosa que está disfarçada como uma modelo terráquea, o agente J (Will Smith) resolve por pedir ajuda ao seu antigo companheiro K (Tommy Lee Jones), que teve sua memória apagada e agora trabalha nos Correios sob o nome de Kevin Brown.\r\nJ precisa então restaurar a memória de K, para que possam combater juntos a ameaça.', '18.jpg', 34),
(19, 'O Quinto Elemento', '45.00', 'No século XXIII, um motorista de taxi (Bruce Willis) de Nova York se envolve em uma aventura na qual tem de deter um ser demonA­aco que percorre a galáxia a cada 5000 anos.\r\nSe nada for feito a Terra será destruA­da, mas para isto ele precisa encontrar 4 pedras antigas, que representam os elementos, e colocá-las em volta de uma bela mulher (Milla Jovovich), que é o quinto elemento.', '19.jpg', 23),
(20, 'Piratas do Caribe: A Maldição do Pérola Negra', '60.00', 'Em pleno século XVII, o pirata Jack Sparrow (Johnny Depp) tem seu navio saqueado e roubado pelo capitão Barbossa (Geoffrey Rush) e sua tripulação.\r\nCom o navio de Sparrow, Barbossa invade e saqueia a cidade de Port Royal, levando consigo Elizabeth Swann (Keira Knightley), a filha do governador (Jonathan Pryce).\r\nDecidido a recuperar sua embarcação, Sparrow recebe a ajuda de Will Turner (Orlando Bloom), um grande amigo de Elizabeth que parte em seu encalço.\r\nPorém, o que ambos não sabem é que o Pérola Negra, navio de Barbossa, foi atingido por uma terrA­vel maldição que faz com que eles naveguem eternamente pelos oceanos e se transformem em esqueletos A  noite.', '20.jpg', 11),
(21, 'Zootopia: Essa Cidade é o Bicho', '19.00', 'Judy Hopps é a pequena coelha de uma fazenda isolada, filha de agricultores que plantam cenouras há décadas.\r\nMas ela tem sonhos maiores: pretende se mudar para a cidade grande, Zootopia, onde todas as espécies de animais convivem em harmonia, na intenção de se tornar a primeira coelha policial.\r\nJudy enfrenta o preconceito e as manipulaçAµes dos outros animais, mas conta com a ajuda inesperada da raposa Nick Wilde, conhecida por sua malA­cia e suas infraçAµes.\r\nA inesperada dupla se dedica A  busca de um animal desaparecido, descobrindo uma conspiração que afeta toda a cidade.', '21.jpg', 88),
(22, 'O Máskara', '24.00', 'Em Edge City vive Stanley Ipkiss (Jim Carrey), um cara decente que trabalha em um banco mas é socialmente desajeitado e sem muito sucesso com as mulheres.\r\nApós um dos piores dias da sua vida, ele acha no mar a estranha máscara de Loki, um deus escandinavo.\r\nQuando Stanley coloca a máscara, se transforma em O Máskara, um ser com o rosto verde que possui a coragem para fazer as coisas mais arriscadas e divertidas que Stanley receia fazer, inclusive flertar com Tina Carlyle (Cameron Diaz), a bela e sensual cantora que se apresenta no Coco Bongo, a discoteca do momento.\r\nO Máskara tem velocidade sobre-humana e um humor não-convencional e, enquanto isto, o gângster Dorian Tyrrell (Peter Greene), que namora Tina, se esforça para destruir o Máskara e se apoderar da máscara para usar seus poderes para o mal.', '22.jpg', 1),
(23, 'O Guia do Mochileiro das Galáxias', '42.00', 'Arthur Dent (Martin Freeman) é um homem normal, que está tendo um péssimo dia.\r\nApós saber que sua casa está prestes a ser demolida, Arthur descobre que Ford Prefect (Mos Def), seu melhor amigo, é um extra-terrestre e, para completar, fica sabendo que a Terra está prestes a ser destruA­da para que se possa construir uma nova auto-estrada hiperespacial.\r\nSem ter o que fazer para evitar a destruição de seu planeta, Arthur só tem uma saA­da: pegar carona em uma nave espacial que está de passagem.\r\nEle passa então a conhecer o universo, sendo que tudo o que precisa saber sobre sua nova vida está contido em um valioso livro: o Guia do Mochileiro das Galáxias.', '23.jpg', 42),
(24, 'O Diabo Veste Prada', '34.00', 'Andrea Sachs (Anne Hathaway) é uma jovem que conseguiu um emprego na Runaway Magazine, a mais importante revista de moda de Nova York.\r\nEla passa a trabalhar como assistente de Miranda Priestly (Meryl Streep), principal executiva da revista.\r\nApesar da chance que muitos sonhariam em conseguir, logo Andrea nota que trabalhar com Miranda não é tão simples assim.', '24.jpg', 44),
(25, 'Carros', '69.00', 'Sensação da temporada da Copa do Pistão, o estreante Relâmpago McQueen aproveita a fama e as glórias de suas vitórias.\r\nAté o dia em que, no caminho para a corrida mais importante de sua vida, perde-se no meio da estrada.\r\nEm Radiator Springs, uma esquecida cidadezinha da velha Rota 66, que o ajudam a descobrir que há coisas mais importantes na vida do que troféus e fama.\r\nCom uma trilha sonora sensacional e bônus alucinantes, incluindo um exclusivo curta animado Mate e a Luz Fantasma, Carros é garantia de diversão a toda velocidade.', '25.jpg', 69);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `UserID` int(11) NOT NULL,
  `Nome` varchar(500) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(200) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `IsADM` tinyint(4) NOT NULL,
  `Endereco` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`UserID`, `Nome`, `Email`, `Senha`, `CPF`, `IsADM`, `Endereco`) VALUES
(1, 'HenriqueFT', 'asdf@gmail.com', 'ðäÂ÷lX‘nÂXòF…ê Ô$z/Ãá†”Fá;', '12345678900', 1, 'Rio de janeiro'),
(2, 'vitu', 'vitu@gmail.com', 'ëŸHûÓ$áÒYqjÀŽRn\\Îué!v¿þhqÕ[ôÖæ˜', '12131344122', 0, 'rua do teste 22'),
(3, 'b', 'b', '>#è\09YJ3‰Oedá±4‹½z\0ˆÔ,JËsî®Õœ\0', 'b', 0, 'b'),
(4, 'k', 'q', 'Ž5ÂÍ;ödÛ P·i2Ë²æJ\rÚÌ›ê‚¦ºW÷Ï', '11111111111', 0, 'q'),
(5, 'teste', 'teste@gmail.com', '·éKåénŒEÍ#Ñb\'^ZëÞ‘\0¤%ÄëÍ×úMÍ‰|', '12312667435', 0, 'rua desembargador isidro, 175, tijuca');

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
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
