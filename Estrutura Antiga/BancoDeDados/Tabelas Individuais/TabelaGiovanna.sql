CREATE DATABASE monitoriamento;
USE monitoriamento;

CREATE TABLE cadastro (
idCadastro int primary key auto_increment,
nomeEmpresa varchar(45),
nomeFantasia varchar(45),
email varchar(45),
telefone varchar(45),
cnpj varchar(45));

CREATE TABLE sensor (
idSensor int primary key auto_increment,
nomeSensor varchar(45),
tipoSensor varchar(45),
tempIdeal float);

CREATE TABLE metrica (
idMetrica int primary key auto_increment,
dataMedicacao datetime);

-- Inserindo dados na tabela cadastro
INSERT INTO cadastro (nomeEmpresa, nomeFantasia, email, telefone, cnpj) VALUES
('Empresa A', 'Fantasia A', 'empresaA@email.com', '(11) 98765-4321', '12.345.678/0001-90'),
('Empresa B', 'Fantasia B', 'empresaB@email.com', '(21) 99876-5432', '98.765.432/0001-12'),
('Empresa C', 'Fantasia C', 'empresaC@email.com', '(31) 91234-5678', '56.789.012/0001-34');

-- Inserindo dados na tabela sensor
INSERT INTO sensor (nomeSensor, tipoSensor, tempIdeal) VALUES
('Sensor 1', 'Temperatura', 4.5),
('Sensor 2', 'Temperatura', 5.0),
('Sensor 3', 'Temperatura', 3.25);

-- Inserindo dados na tabela metrica
INSERT INTO metrica (dataMedicacao) VALUES
('2025-03-10 14:30:00'),
('2025-03-10 15:00:00'),
('2025-03-10 15:30:00');

SELECT * from cadastro;

SELECT * from sensor;

SELECT * from metrica;


