-- Criando banco de dados
Create database ProjetoPi;
-- Utilizando/Usando o banco de dados
Use ProjetoPi;
-- Criando tabela Cadastro
Create Table Cadastro
(
IdCadastro INT PRIMARY KEY auto_increment,
nome varchar(45),
email varchar(45),
telefone char(9),
CNPJ char(12),
Senha varchar(45)
);
-- Criando tabela sensor
Create Table Sensor
(
IdSensor INT PRIMARY KEY auto_increment,
NomeSensor varchar(45),
TemperaturaMax float,
TemperaturaMin float
);
-- Criando tabela metricas
Create Table Metrica
(
IdMetrica INT PRIMARY KEY auto_increment,
TemperaturaMedia float,
TemperaturaReal float,
DataMedicao date,
TipoVacina varchar(45),
NomeVacina varchar(45),
TemperaturaIdeal float
);


Insert into Sensor (NomeSensor, TemperaturaMax, TemperaturaMin) values
('Sensor LM35', 15, -5),
('Sensor LM35', 21, -6);

Insert into Metrica (TemperaturaMedia, TemperaturaReal, DataMedicao, TipoVacina, NomeVacina, TemperaturaIdeal)values
(9,14,'2025-10-12', 'Termolabel','Covid-19', 9),
(4,14,'2025-06-29', 'Termolabel','Sars-19', 5);

Select * from Sensor where TemperaturaMax >= 21;
Select * from Metrica where TemperaturaIdeal = 5;