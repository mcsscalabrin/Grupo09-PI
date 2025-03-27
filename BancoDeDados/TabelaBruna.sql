CREATE DATABASE sprint01;
USE sprint01;

CREATE TABLE cadastro
(
idCadastro INT PRIMARY KEY auto_increment,
Nome VARCHAR(30) NOT NULL,
NomeFantasia VARCHAR(30) NOT NULL,
Email VARCHAR(30) NOT NULL,
CNPJ DOUBLE NOT NULL,
Senha CHAR(8) NOT NULL

);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
Temperatura FLOAT,
qntVariação DECIMAL,
qntSensor DECIMAL
);


CREATE TABLE Metrica(
idMetrica INT PRIMARY KEY auto_increment,
temperaturaVariação FLOAT,
temperaturaespecifica FLOAT,
DataRetirada DATE
);

-- Inserindo dados na tabela cadastro
INSERT INTO cadastro (Nome, NomeFantasia, Email, CNPJ, Senha) 
VALUES 
('Fernanda Martins', 'BBB transporte Ltda', 'bbbtransporte@empresaa.com', 12345678000123, 'senha123'),
('Rodrigo Macedo', 'vactrans Ltda', 'vactrans@empresaa.com', 10395678003125, 'senha789'),
('Breno Silva', 'Tupper S/A', 'tupper@empresab.com', 98765432000198, 'senha456');

-- Inserindo dados na tabela sensor
INSERT INTO sensor (Temperatura, qntVariação, qntSensor)
VALUES 
(4, 0, 1),
(4, 2, 6),
(6, 7, 9);

-- Inserindo dados na tabela Metrica
INSERT INTO Metrica (TemperaturaVariação, DataRetirada, temperaturaespecifica ) 
VALUES 
(3.5, '2025-03-11',4),
(5, '2025-03-12', 6),
(6.6, '2025-03-13',5);


SELECT * FROM Metrica;

SELECT * FROM cadastro;

SELECT * FROM sensor;

SELECT * FROM cadastro WHERE nome LIKE 'B%';

