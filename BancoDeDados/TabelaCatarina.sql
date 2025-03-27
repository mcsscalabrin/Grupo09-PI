create database sprint1;

use sprint1;

create table cadastro	
(idusuario INT primary key auto_increment,
email varchar(45), 
senha varchar(45),
telefone char(11), 
cnpj char(12));

create table sensor
(idsensor INT primary key auto_increment,
nomeSensor varchar(45),
tipoSensor varchar(45));

create table vacina(
idVacina int primary key auto_increment,
nome varchar(45),
temperaturaMAX float,
temperaturaMIN float,
fabricante varchar(45),
lote int);

create table registros
(idDados INT primary key auto_increment, 
temperatura float,
hora datetime);

insert into cadastro (email, senha, telefone, cnpj) values
('Sptech@sptech.school', 'sptech123', '11999999999' , '000000999999'),
('sensify@sptech.school', '123456', '11999900000' , '111222333444');

insert into sensor (nomeSensor, tipoSensor) values
('LM35', 'Temperatura'),
('LM35', 'Temperatura');

insert into vacina (nome, temperaturaMAX, temperaturaMIN, fabricante, lote) values
('Comirnaty', -25.0, -15.0, 'Pfizer', 12345),
('Comirnaty', -25.0, -15.0, 'Pfizer', 12346);

insert into registros (temperatura, hora) values
(-20, '2025-03-13 10:42:53'),
(-21, '2025-03-13 10:43:53'),
(-19, '2025-03-13 10:44:53');

select  email as Email,
		senha as Senha,
        telefone as Telefone,
        cnpj as CNPJ from cadastro;
        
select  nomeSensor as NOME,
		tipoSensor as Tipo from sensor; 
	
select  nome as Vacina,
		temperaturaMAX as Temperatura_Máxima,
        temperaturaMIN as Temperatura_Miníma,
        fabricante as Fabricante,
        lote as Lote from vacina;
        
select  temperatura as Temperatura,
		hora as Hora from registros;