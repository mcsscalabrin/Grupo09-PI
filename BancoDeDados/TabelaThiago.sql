create database sprint1;
use sprint1;

create table cadastro 
(idusuario INT primary key auto_increment,
email varchar(45) not null, 
senha varchar(45) not null,
telefone varchar(15) not null, 
cnpj char(14) not null);

insert into cadastro (email, senha, telefone, cnpj) values 
('comercial@innovac.com.br','innovac2025','1140028922','12345678000190'),
('sac.brasil@gsk.com','sacGSKbr32','2130039090','98765432000155'),
('adm-sac@zoetis.com','ZoeTISad22','3135582521','56789012000133'),
('sac@takeda.com','TaKaEdAsac21','1137778080','23456789000177'),
('atendimento@merckgroup.com','MERCKgpatt66','2140405050','34567890000122'); 

create table sensor
(idsensor INT primary key auto_increment not null,
nomeSensor varchar(45) not null, 
tipoSensor varchar(45) not null,
consumoenergia int not null,
faixamediçao varchar(45) not null,
temporesposta decimal (10.20) not null);

insert into sensor (nomeSensor, tipoSensor, consumoenergia,faixamediçao,temporesposta) values
('LM35','Analógico','60','-55 a 150','1.5'),
('DS18B20','Digital','1.5','-55 a 125','0.75'),
('BME280','Digital','0.5','-40 a 85','0.5'),
('DHT22','Digital','1.5','-40 a 80','2'); 	


create table regra
(idregra INT primary key auto_increment not null,
mediaAtivo decimal (20.10), 
mediaInativo decimal (20.10),
mediaTemperatura decimal (20.10),
variaçaot decimal (20.10),
temperaturaMax decimal (20.10),
temperaturaMin decimal (20.10));
drop table regra;
insert into regra (mediaAtivo,mediaInativo,mediaTemperatura,variaçaoT,temperaturaMax,temperaturaMin) values
(121.50, 8.30, 5.60, 1.80, 7.00, 3.00),  
(104.20, 7.10, 2.80, 5.50, 8.00, 2.20),  
(159.80, 9.90, 7.40, 2.10, 8.20, 5.10),  
(94.60, 6.80, 5.30, 2.20, 6.80, 3.50),  
(134.70, 8.90, 4.90, 1.90, 7.50, 2.80); 

 select idusuario AS 'ID usuario' , email, senha, telefone, cnpj from cadastro;
 
 select idsensor as 'ID sensor', nomeSensor as 'Nome do sensor', tipoSensor as 'Tipo de sensor', consumoenergia as 'Consumo de energia (MW)' -- É consumo de energia em Mega Watt
 , faixamediçao as 'Faixa de medição em graus', temporesposta as 'Tempo de resposta em segundos' from sensor;
 
 select idregra as 'ID regra', mediaAtivo as 'Media de tempo ativo em minutos', mediaInativo as 'Media de tempo inativo em minutos', mediaTemperatura as 'Media de temperatura em graus'
 ,variaçaot as 'Variação de temperatura em graus', temperaturaMax as 'Temperatura Máxima em graus', temperaturaMin as 'Temperatura Mínima em graus' from regra; 