/*
DELETE DATABASE pessoa IF EXISTS EQUIPA, JOGADOR, TREINADOR , ARBITRO, POSIÇAO;
*/

DROP DATABASE IF EXISTS FUTEBOL;

CREATE DATABASE FUTEBOL;
USE FUTEBOL;

CREATE TABLE
POSIÇÃO
(
  PosId INT UNIQUE NOT NULL,
  Nome  VARCHAR(20) NOT NULL,
  Sigla VARCHAR(3),
  PRIMARY KEY(PosId)
);

INSERT INTO
  POSIÇÃO(PosId, Nome, Sigla)
VALUES
  (1, 'Guarda Redes'    , 'GR'),
  (2, 'Lateral Direito' , 'LD'),
  (3, 'Defesa Central'  , 'DC'),
  (5, 'Lateral Esquerdo', 'LE'),
  (6, 'Medio Defensivo' , 'MD'),
  (7, 'Extremo'         , 'E'),
  (8, 'Medio Centro'    , 'MC'),
  (9, 'Avançado'        , 'AV');

CREATE TABLE
TREINADOR
(
  NumCC INT UNIQUE NOT NULL,
  Nome  VARCHAR(128) NOT NULL,
  PRIMARY KEY(NumCC)
);

INSERT INTO 
  TREINADOR(NumCC, Nome)
VALUES
  (444100, 'Jorge Jesus'),
  (444200, 'Sérgio Conceição'),
  (444300, 'Rúben Amorim');

CREATE TABLE
EQUIPA
(
  EquipaId    INT UNIQUE NOT NULL,
  Nome        VARCHAR(128) NOT NULL,
  CCTreinador INT NOT NULL,
  PRIMARY KEY(EquipaId),
  FOREIGN KEY(CCTreinador) REFERENCES TREINADOR(NumCC) ON DELETE CASCADE
);

INSERT INTO
  EQUIPA(EquipaId, Nome, CCTreinador)
VALUES 
  (99991, 'Benfica' , 444100),
  (99992, 'Porto'   , 444200),
  (99993, 'Sporting', 444300);

CREATE TABLE
JOGADOR
(
  NumCC         INT UNIQUE NOT NULL,
  Nome          VARCHAR(128) NOT NULL,
  DataNasc      DATE NOT NULL,
  Altura        FLOAT NOT NULL,
  Nacionalidade VARCHAR(20) NOT NULL,
  MelhorPé      ENUM('D', 'E') NOT NULL,
  PosId         INT NOT NULL,
  EquipaId      INT NOT NULL,
  PRIMARY KEY(NumCC),
  FOREIGN KEY(PosId) REFERENCES POSIÇÃO(PosId) ON DELETE CASCADE,
  FOREIGN KEY(EquipaId) REFERENCES EQUIPA(EquipaId) ON DELETE CASCADE
);

INSERT INTO
  JOGADOR(NumCC, Nome, DataNasc, Altura, Nacionalidade, MelhorPé, PosId, EquipaId)
VALUES
  (111100, 'Gonçalo Ramos'       , '2001-06-20', 1.85, 'Portugal' , 'D', 9, 99991),
  (111200, 'Odysseas Vlachodimos', '1994-04-26', 1.91, 'Grécia'   , 'D', 1, 99991),
  (111300, 'Alejandro Grimaldo'  , '1995-09-20', 1.71, 'Espanha'  , 'E', 5, 99991),
  (111400, 'Gabriel Pires'       , '1993-09-18', 1.79, 'Portugal' , 'D', 8, 99991),
  (111500, 'Adel Taarabt'        , '1989-05-24', 1.80, 'Portugal' , 'D', 8, 99991),
  (111600, 'Rafa Silva'          , '1993-05-17', 1.70, 'Portugal' , 'D', 7, 99991),
  (111700, 'Julian Weigl'        , '1995-09-08', 1.86, 'Alemanha' , 'D', 8, 99991),
  (111800, 'Haris Seferovic'     , '1992-02-22', 1.89, 'Suiça'    , 'E', 9, 99991),
  (111900, 'Lucas Veríssimo'     , '1995-07-02', 1.88, 'Brasil'   , 'D', 3, 99991),
  (222100, 'Mehdi Taremi'        , '1992-07-18', 1.87, 'Irão'     , 'D', 9, 99992),
  (222200, 'Sergio Oliveira'     , '1992-07-02', 1.80, 'Portugal' , 'D', 8, 99992),
  (222300, 'Otávio Monteiro'     , '1995-02-09', 1.71, 'Brasil'   , 'D', 8, 99992),
  (222400, 'Jesús Corona'        , '1993-01-06', 1.73, 'México'   , 'D', 7, 99992),
  (222500, 'Wilson Manafá'       , '1994-07-23', 1.77, 'Portugal' , 'D', 2, 99992),
  (222600, 'Mateus Uribe'        , '1991-03-21', 1.82, 'ColomBia' , 'D', 8, 99992),
  (222700, 'Agustín Marchesín'   , '1988-03-16', 1.88, 'Argentina', 'D', 1, 99992),
  (333100, 'Pedro Gonçalves'     , '1998-06-28', 1.73, 'Portugal' , 'D', 9, 99993),
  (333200, 'Paulinho Gonçalves'  , '1992-11-09', 1.87, 'Portugal' , 'D', 9, 99993),
  (333300, 'Jovane Gonçalves'    , '1998-06-14', 1.76, 'Portugal' , 'D', 7, 99993),
  (333400, 'Nuno Santos'         , '1995-02-13', 1.79, 'Portugal' , 'E', 9, 99993),
  (333500, 'João Mário'          , '1993-01-19', 1.79, 'Portugal' , 'D', 8, 99993),
  (333600, 'Pedro Porro'         , '1999-09-13', 1.76, 'Espanha'  , 'D', 5, 99993),
  (333700, 'João Palhinha'       , '1995-07-09', 1.89, 'Portugal' , 'D', 6, 99993),
  (333800, 'Nuno Mendes'         , '2002-07-19', 1.84, 'Portugal' , 'E', 2, 99993),
  (333900, 'Sebastián Coates'    , '1990-10-07', 1.96, 'Uruguai'  , 'D', 3, 99993),
  (331000, 'Gonçalo Inácio'      , '2001-08-25', 1.86, 'Portugal' , 'E', 3, 99993);

CREATE TABLE
TELEFONE
(
  NumCC  INT NOT NULL,
  NumTel INT UNIQUE NOT NULL,
  PRIMARY KEY(NumCC, NumTel),
  FOREIGN KEY(NumCC) REFERENCES JOGADOR(NumCC) ON DELETE CASCADE
);

INSERT INTO
  TELEFONE(NumCC, NumTel)
VALUES
  (111100, 915243780),
  (111100, 254243780),
  (111200, 254240080),
  (111300, 254245780),
  (111400, 934567821),
  (111500, 918262328),
  (111600, 968712930),
  (111700, 924243780),
  (111800, 934243780),
  (111900, 910243780),
  (222100, 967341293),
  (222200, 967399293),
  (222300, 967381093),
  (222400, 967312293),
  (222500, 967381293),
  (222600, 912221293),
  (222700, 927381193),
  (333100, 912876301),
  (333100, 258876301),
  (333200, 934563982),
  (333300, 921782632),
  (333400, 934565782),
  (333500, 934746982),
  (333600, 915553982),
  (333200, 968563982),
  (333200, 911563982),
  (333200, 932563982),
  (331000, 928863982);

CREATE TABLE
ARBITRO
(
  NumCC INT UNIQUE NOT NULL,
  Nome  VARCHAR(128) NOT NULL,
  PRIMARY KEY(NumCC)
);

INSERT INTO 
  ARBITRO(NumCC, Nome)
VALUES
  (999100, 'Rui Costa'),
  (999200, 'Nuno Almeida'),
  (999300, 'Artur Dias'),
  (999400, 'Hugo Miguel');

CREATE TABLE
JOGO
(
  JogoId      INT UNIQUE NOT NULL,
  Estádio     VARCHAR(128) NOT NULL,
  Data        DATE NOT NULL,
  HInício     TIME NOT NULL,
  HFim        TIME NOT NULL,
  CCArbitro   INT NOT NULL,
  PRIMARY KEY(JogoId),
  FOREIGN KEY(CCArbitro) REFERENCES ARBITRO(NumCC) ON DELETE CASCADE
);

INSERT INTO
  JOGO(JogoId, Estádio, Data, HInício, HFim, CCArbitro)
VALUES
  (1000, 'Estádio da Luz'       , '2022-06-07', '20:30:00', '23:00:00', 999100),
  (1001, 'Estádio do Dragão'    , '2022-02-14', '14:00:00', '15:30:00', 999100),
  (1002, 'Estádio José Alvalade', '2022-02-16', '20:00:00', '22:00:00', 999300),
  (1003, 'Estádio da Luz'       , '2022-06-07', '18:00:00', '20:00:00', 999200);

CREATE TABLE
PARTICIPA
(
  EquipaId INT NOT NULL,
  JogoId   INT NOT NULL,
  PRIMARY KEY(EquipaId, JogoId),
  FOREIGN KEY(EquipaId) REFERENCES EQUIPA(EquipaId) ON DELETE CASCADE,
  FOREIGN KEY(JogoId) REFERENCES JOGO(JogoId) ON DELETE CASCADE
);

INSERT INTO 
  PARTICIPA(EquipaId, JogoId)
VALUES
  (99991, 1000),
  (99992, 1000),
  (99991, 1001),
  (99992, 1001),
  (99992, 1002),
  (99993, 1002),
  (99991, 1003),
  (99993, 1003);
  
CREATE TABLE
ATRIBUI
(
  CCArbitro INT NOT NULL,
  CCJogador INT NOT NULL,
  CAmarelo  INT DEFAULT NULL,
  CVermelho INT DEFAULT NULL,
  PRIMARY KEY(CCArbitro, CCJogador),
  FOREIGN KEY(CCArbitro) REFERENCES ARBITRO(NumCC) ON DELETE CASCADE,
  FOREIGN KEY(CCJogador) REFERENCES JOGADOR(NumCC) ON DELETE CASCADE
);

INSERT INTO
  ATRIBUI(CCArbitro, CCJogador, CAmarelo, CVermelho)
VALUES
  (999300, 222300, 1   , null),
  (999200, 333700, 4   , 1),
  (999300, 333400, 2   , null),
  (999300, 222100, null, 1),
  (999300, 222700, 6   , null),
  (999200, 333500, 1   , 1);

