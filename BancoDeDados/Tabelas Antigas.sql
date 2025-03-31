Create DATABASE sprint1; -- criar banco de dados

USE sprint1; -- ativar o banco de dados "sprint 1"

Create table cadastro -- tabela da tela de cadasro
(idUsuario INT PRIMARY KEY auto_increment,
nomeEmpresa varchar(35) NOT NULL, -- NOME EMPRESA
email varchar(35) NOT NULL, -- EMAIL DO CLIENTE
senha varchar(15) NOT NULL, -- SENHA DO CLIENTE
NumTelefone varchar(20) NOT NULL, -- NUMERO DE TELEFONE DO CLIENTE
cnpj char(14) NOT NULL); -- CNPJ DA EMPRESA

-- ------------------------------------------------------------------
CREATE table sensor -- tabela do sensor
(idSensor INT PRIMARY KEY auto_increment,
Nome varchar(10), -- nome do sensor
Tipo varchar (10), -- Se é digital ou analógico
tempMIN float, -- temperatura minima durante a viagem
tempMAX float); -- temperatura máxima durante a viagem



-- ----------------------------------------------------------------------

create table metrica -- tabela das métricas
(idMetrica INT PRIMARY KEY auto_increment,
dtHoraMedicao datetime, 
duracaoViagem time);


INSERT INTO cadastro (nomeEmpresa, email, senha, NumTelefone, cnpj) VALUES
('West Cargo', 'WestCargoA@gmail.com', 'west123', '11969594929', '12345678000199'),
('Express Cargas', 'ExpressCargas@gmail.com', 'express123', '119988753828', '98765432000188'),
('Bio transportes', 'BioTransportes@gmail.com', 'bio123', '1197776723457', '56789012000177');
 
INSERT INTO sensor (Nome, Tipo, tempMIN, tempMAX) VALUES
('LM35', 'Analógico', 2, 7),
('LM35', 'Analógico', 1, 5),
('LM35', 'Analógico', 4, 9);

INSERT INTO metrica (dtHoraMedicao, duracaoViagem) 
VALUES 
('2025-03-15 08:30:00', '01:45:00'),
('2025-03-15 09:15:00', '02:10:00');

Select nomeEmpresa AS NOME, email as EMAIL, 
senha AS SENHA, NumTelefone as TELEFONE, cnpj as CNPJ from cadastro;

Select Nome as NOME, tipo as TipoSensor, tempMIN as Temperatura_Mínima, tempMAX as TemperaturaMáxima from sensor;

Select dtHoraMedicao as DataDeMedição, duracaoViagem as DuraçãoDaViagem from metrica;




