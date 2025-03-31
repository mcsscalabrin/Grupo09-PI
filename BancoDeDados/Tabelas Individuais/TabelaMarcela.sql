CREATE DATABASE Sensify;
USE Sensify;

CREATE TABLE CadastroCliente(
idCliente INT PRIMARY KEY auto_increment,
Nome_Fantasia VARCHAR(45),
CNPJ CHAR (14),
Senha VARCHAR(30)
);

INSERT INTO CadastroCliente (Nome_Fantasia, CNPJ, Email, Telefone, Senha) VALUES
('EMPRESA A', '12345678000100', 'contato@empresaA.com', '1198765432', 'senhaA2024'),
('EMPRESA B', '23456789000111', 'contato@empresaB.com', '2191234567', 'senhaB2024'),
('EMPRESA C', '34567890000122', 'contato@empresaC.com', '3199876543', 'senhaC2024'),
('EMPRESA D', '45678901000133', 'contato@empresaD.com', '4197654321', 'senhaD2024');


SELECT * FROM CadastroCliente;

SELECT * FROM CadastroCliente WHERE idCliente <= 3;

CREATE TABLE SensorTemperatura(
idSensor INT PRIMARY KEY auto_increment,
nomeSensor VARCHAR(45),
Temperatura DECIMAL(5,2),
dTLeitura DATETIME,
UnidadeMedida VARCHAR(5)
);

INSERT INTO SensorTemperatura (nomeSensor, Temperatura, dTLeitura, UnidadeMedida) VALUES 
    ('Sensor B', 3.2, '2025-03-12 14:30:00', '°C'),
    ('Sensor B', 3.4, '2025-03-12 15:00:00', '°C'),
    ('Sensor B', 8.5, '2025-03-12 19:00:00', '°C');
   
SELECT * FROM SensorTemperatura;

SELECT * FROM SensorTemperatura WHERE Temperatura > 8;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY auto_increment,
NomeEmpresa VARCHAR(50),
NomeResponsavel VARCHAR(50),
Endereco VARCHAR(50),
Email VARCHAR(50),
telefone CHAR(11),
qtdSensor INT,
CNPJ CHAR (14),
NotaFiscal INT
);

INSERT INTO Cliente (NomeEmpresa, NomeResponsavel, Endereco, Email, telefone, qtdSensor, CNPJ, NotaFiscal) VALUES 
    ('EMPRESA A', 'João Silva', 'Rua Alfa, 123', 'joao@empresaA.com', '11987654321', 4, '12345678000195', 987654321),
    ('EMPRESA B', 'Maria Santos', 'Av. Beta, 456', 'maria@empresaB.com', '21998765432', 6, '23456789000188', 123456789),
    ('EMPRESA C', 'Carlos Oliveira', 'Rua Gama, 789', 'carlos@empresaC.com', '31991234567', 3, '34567890000177', 456789123),
    ('EMPRESA D', 'Fernanda Costa', 'Av. Delta, 101', 'fernanda@empresaD.com', '41999887766', 7, '45678900000166', 789123456);
    
SELECT * FROM Cliente;

SELECT * FROM Cliente WHERE qtdSensor >=5;


    
    




