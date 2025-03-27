use sprint1;

-- Criando tabela para cadastro do usuário
create table Cadastro (
idCadastro int primary key auto_increment,
Nome varchar (70) not null,
Contato char (12),
Nome_Fantasia varchar (50) not null,
CNPJ char (14) not null,
Email varchar (70) not null,
Senha varchar (15) not null,
Confirmar_Senha varchar(15) not null
);
-- Inserindo dados na tabela
insert into Cadastro (Nome, Contato, Nome_Fantasia, CNPJ, Email, Senha, Confirmar_Senha) values
	('João da Silva Pessoa', '1196322-9587', 'EMS', '00234561458975', 'joaosilvap@gmail.com', 'joao1234', 'joao1234'),
    ('Maria Aparecida dos Santos', '1196325-8741', 'Neo Quimica', '11478522369855', 'aparecidamariasantos@gmail.com', 'aparecidaS', 'aparecidaS'),
    ('Joaquim Sandero de Jesus', '1198745-1236', 'Butantan', '3698552144774', 'joaquimsandero@outlook.com.br', 'joaquim9876', 'joaquim9876'),
    ('Joana Nascimento Oliveira', '1196985-3214', 'EMS', '32144558779663', 'oliveiranascimento@gmail.com', 'joananasc21', 'joananasc21');
    
-- Exibindo dados da tabela 
select * from Cadastro;
select Nome from Cadastro where Email like '%outlook%';
select * from Cadastro where Nome_Fantasia = 'EMS';


-- Criando tabela para registros do sensor
create table Registro (
idRegistro int primary key auto_increment,
Origem varchar (30),
Destino varchar (30),
Viagem date,
Qtd_caminhões int,
Qtd_registros int,
Temperatura float
);

-- Inserindo dados na tabela
insert into Registro (Origem, Destino, Viagem, Qtd_caminhões, Qtd_registros, Temperatura) values
	('São Paulo', 'São José dos Campos', '2025-02-26', 3, 15, 5.5),
    ('Belo Horizonte', 'Uberlândia', '2025-01-30',5, 25, 7.2),
    ('Osasco', 'Mauá', '2025-03-02', 2, 10, 6.7);
    
-- Exibindo dados da tabela 
select * from Registro;
select * from Registro where Destino = 'Mauá';
select * from Registro where Temperatura > '7';


-- Criando tabela para login do usuário
create table Cliente (
idCliente int primary key auto_increment,
Login varchar (70) not null,
Senha varchar (15) not null,
CNPJ char (14) not null,
NotaFiscal int not null
);

-- Inserindo dados na tabela
insert into Cliente (Login, Senha, CNPJ, NotaFiscal) values
	('joaosilvap@gmail.com', 'joao1234', '00234561458975', 01),
    ('joaquimsandero@outlook.com.br', 'joaquim9876','3698552144774', 02),
    ('oliveiranascimento@gmail.com', 'joananasc21', '32144558779663', 03),
    ('aparecidamariasantos@gmail.com', 'aparecidaS', '11478522369855', 04);

-- Exibindo dados da tabela 
select * from Cliente;
select Login from Cliente where NOtaFiscal = 03;
select * from Cliente where Login like 'j%';
