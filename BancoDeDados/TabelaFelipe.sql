CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE cadastro
(idUsuario INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
telefone INT,
cnpj CHAR(14));

INSERT INTO cadastro (email, senha, telefone, cnpj) VALUES
('alice12@gmail.com', 's13578', 11987654321, '12345678000195'),
('caio90@gmail.com', 'h351421', 21987654321, '23456789000106'),
('maria87@gmail.com', 'n467322', 31987654321, '34567890000117'),
('pele98@gmail.com', 'l3510413', 41987654321, '45678901000128'),
('neymar675@gmail.com', 'e31413s5', 51987654321, '56789012000139'),
('rene123@gmail.com', 'hihfH7', 61987654321, '67890123000140');



CREATE TABLE sensor
(idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(45),
tipo VARCHAR(45),
temperatura DECIMAL(10.20));



 INSERT INTO sensor (nomeSensor, tipo, temperatura) VALUES
('LM35', 'Temperatura', 3.25),
('LM35', 'Temperatura', 7.80),
('LM35', 'Temperatura', 10.50),
('LM35', 'Temperatura', 12.95),
('LM35', 'Temperatura', 4.60);


CREATE TABLE dadosS
(idDados INT PRIMARY KEY AUTO_INCREMENT,
mediaT DECIMAL(10.20),
tempoViagem VARCHAR(50),
intervaloLeitura VARCHAR(30),
dataHoraMedicao DATETIME,
CustosSensor INT);
 
 INSERT INTO dadosS (mediaT, tempoViagem, intervaloLeitura, dataHoraMedicao, CustosSensor) VALUES
(3.45, '2 horas e 30 minutos', 'A cada 5 minutos', '2025-03-11 08:30:00', 15),
(7.80, '4 horas', 'A cada 10 minutos', '2025-03-11 12:45:00', 20),
(5.25, '1 hora e 45 minutos', 'A cada 2 minutos', '2025-03-11 10:15:00', 10),
(6.90, '3 horas e 10 minutos', 'A cada 7 minutos', '2025-03-11 15:20:00', 18),
(2.75, '5 horas', 'A cada 15 minutos', '2025-03-11 18:55:00', 25),
(4.60, '6 horas e 30 minutos', 'A cada 3 minutos', '2025-03-11 22:10:00', 12);


 
-- select da tabela 1 
select idUsuario AS Usuario, email AS Email, senha AS Senha, telefone AS Telefone, cnpj AS CNPJ from cadastro;

-- select da tabela 2
select idSensor AS Identificação_Sensor, nomeSensor AS Nome, tipo As Tipo, temperatura AS Temperatura from sensor;

-- select da tabela 3
select idDados AS Dados, mediaT	AS Média_Temperatura, tempoViagem AS Tempo_Viagem, intervaloLeitura AS Intervalo_leitura, dataHoraMedicao AS Data_Hora_Medição, CustosSensor AS Custo_Sensor from dadosS;





