Create DATABASE Dados; 

USE Dados; 

create table cadastroEmpresa(
idEmpresa INT PRIMARY KEY auto_increment,
nomeEmpresa varchar(100) NOT NULL, 
email varchar(45) NOT NULL, -- Referente a conta root
senha varchar(45) NOT NULL, -- Referente a conta root
telefone varchar(20) NOT NULL, 
cnpj char(14) NOT NULL,
cep char(8) NOT NULL,
numero varchar(10) NOT NULL,
complemento varchar(20)
);

-- ------------------------------------------------------------------
create table usuario( 
idUsuario INT PRIMARY KEY auto_increment,
nomeUsuario varchar(45),
email varchar(45) NOT NULL,
senha varchar(45) NOT NULL,
empresa int NOT NULL,
constraint fkUsuarioEmpresa
	foreign key (empresa) references cadastroEmpresa(idEmpresa)
);

-- ------------------------------------------------------------------
create table sensor(
idSensor INT PRIMARY KEY auto_increment,
nomeSensor varchar(45), 
tipo varchar(45) NOT NULL, 
localizacao varchar(45) NOT NULL, 
statusSensor varchar (10) NOT NULL, 
empresa int NOT NULL,
constraint chkstatusSensor 
	check(statusSensor in ('Ativo', 'Inativo')),
constraint fkSensorEmpresa 
	foreign key (empresa) references cadastroEmpresa(idEmpresa)
); 

-- ------------------------------------------------------------------
create table dado(
idDado INT PRIMARY KEY auto_increment,
temperatura float,
dtHoraMedicao datetime,
sensor int NOT NULL,
constraint fkDadoSensor 
	foreign key (sensor) references Sensor(idSensor)
);

insert into cadastroEmpresa  values
(default, 'Techvac Solutions', 'admin@techvac.com', 'senha123', '11987654321', '12345678000195', '01001000', '100', 'Sala 10'),
(default, 'Inovafarma', 'root@inovafarma.com', 'inova2024', '21912345678', '98765432000158', '20250330', '200', 'Andar 5'),
(default, 'Ecomed', 'admin@ecomed.com', 'eco2024!', '31987651234', '13579246000185', '30130123', '50', NULL),
(default, 'MegaCorp', 'root@megacorp.com', 'mega123', '41955551234', '24680135000167', '80520300', '250', 'Bloco B'),
(default, 'StartUpX', 'admin@startupx.com', 'startx2024', '51999998888', '11223344000122', '90020340', '300', 'Sala 22');

insert into usuario values
(default, 'Carlos Silva', 'carlos@techvac.com', 'pass321', 1),
(default, 'Marcos Almeida', 'marcos@techvac.com', 'marco123', 1),
(default, 'Mariana Souza', 'mariana@inovafarma.com', 'inova457', 2),
(default, 'Roberto Lima', 'roberto@ecomed.com', 'eco780', 3),
(default, 'Fernanda Costa', 'fernanda@megacorp.com', 'mega102', 4),
(default, 'Lucas Almeida', 'lucas@startupx.com', 'start2025', 5);

insert into sensor values 
(default, 'Sensor Vacinas Covid', 'LM35', 'Van 123', 'Ativo', 1),
(default, 'Sensor Vacinas H1N1', 'LM35', 'Caminhão 132', 'Ativo', 2),
(default, 'Sensor Vacinas em geral', 'LM35', 'Caminhão 345', 'Ativo', 2),
(default, 'Sensor Vacinas Pólio', 'LM35', 'Caminhão 213', 'Inativo', 3),
(default, 'Sensor Vacinas em geral', 'LM35', 'Veículo 134', 'Ativo', 4),
(default, 'Sensor 2A1', 'LM35', 'Van 985', 'Inativo', 5);

insert into dado values
(default, 3.5, '2025-03-30 10:15:00', 1),
(default, 8.0, '2025-03-30 10:16:00', 2),
(default, 0.2, '2025-03-30 10:16:00', 3),
(default, 0.0, '2025-03-30 10:17:00', 3),
(default, 10, '2025-03-30 10:18:00', 5),
(default, 6, '2025-03-30 10:19:00', 5);

select nomeEmpresa, email, telefone from cadastroEmpresa where idEmpresa in (1, 2);

select e.nomeEmpresa as Empresa, u.nomeUsuario as Colaborador, e.cep as CEP, e.numero as Número, ifnull(e.complemento, 'Não consta') as Complemento 
from cadastroEmpresa as e join usuario as u
	on e.idEmpresa = u.empresa;
    
select e.nomeEmpresa as Empresa, s.nomeSensor as Sensor, s.tipo as Tipo, s.statusSensor as Status, 
case
	when d.temperatura <= -1 or d.temperatura >= 7 then 'Temperatura Alta'
    else temperatura
    end as Temperatura,
d.dtHoraMedicao as Data
from cadastroEmpresa as e join sensor as s
	on idEmpresa = empresa
join dado as d
	on idSensor = sensor
where e.idEmpresa = 2;










