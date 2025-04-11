Create DATABASE SensiVacc; 

USE SensiVacc;

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
nomeUsuario varchar(45) NOT NULL,
cargo varchar(45) NOT NULL,
email varchar(45) NOT NULL,
senha varchar(45) NOT NULL,
empresa int NOT NULL,
constraint fkUsuarioEmpresa
	foreign key (empresa) references cadastroEmpresa(idEmpresa)
);

-- ------------------------------------------------------------------
create table transporte(
idTransporte INT PRIMARY KEY auto_increment,
nome varchar(45) NOT NULL,
placa char(7) NOT NULL,
empresa int NOT NULL,
constraint fkTransporteEmpresa
	foreign key (empresa) references cadastroEmpresa(idEmpresa)
);

-- ------------------------------------------------------------------
create table sensor(
idSensor INT PRIMARY KEY auto_increment,
nomeSensor varchar(45), 
tipo varchar(45) NOT NULL, 
statusSensor varchar (10) NOT NULL, 
empresa int NOT NULL,
localizacao int NOT NULL,
constraint fkSensorTransporte
	foreign key (localizacao) references Transporte(idTransporte),
constraint chkstatusSensor 
	check(statusSensor in ('Ativo', 'Inativo')),
constraint fkSensorEmpresa 
	foreign key (empresa) references cadastroEmpresa(idEmpresa)
); 

-- ------------------------------------------------------------------
create table registro(
idRegistro INT PRIMARY KEY auto_increment,
temperatura float,
dtHoraMedicao datetime default current_timestamp,
sensor int NOT NULL,
constraint fkRegistroSensor 
	foreign key (sensor) references Sensor(idSensor)
);

insert into cadastroEmpresa  values
(default, 'Techvac Solutions', 'admin@techvac.com', 'senha123', '11987654321', '12345678000195', '01001000', '100', 'Sala 10'),
(default, 'Inovafarma', 'root@inovafarma.com', 'inova2024', '21912345678', '98765432000158', '20250330', '200', 'Andar 5'),
(default, 'Ecomed', 'admin@ecomed.com', 'eco2024!', '31987651234', '13579246000185', '30130123', '50', NULL),
(default, 'MegaCorp', 'root@megacorp.com', 'mega123', '41955551234', '24680135000167', '80520300', '250', 'Bloco B'),
(default, 'StartUpX', 'admin@startupx.com', 'startx2024', '51999998888', '11223344000122', '90020340', '300', 'Sala 22');

insert into usuario values
(default, 'Carlos Silva', 'gerente', 'carlos@techvac.com', 'pass321', 1),
(default, 'Marcos Almeida', 'analista', 'marcos@techvac.com', 'marco123', 1),
(default, 'Mariana Souza', 'técnico de temperatura', 'mariana@inovafarma.com', 'inova457', 2),
(default, 'Roberto Lima', 'farmacêutico', 'roberto@ecomed.com', 'eco780', 3),
(default, 'Fernanda Costa', 'pesquisador', 'fernanda@megacorp.com', 'mega102', 4),
(default, 'Lucas Almeida', 'analista', 'lucas@startupx.com', 'start2025', 5);

insert into transporte values 
(default, 'caminhão1', 'QJT2032', 1),
(default, 'van1', 'FBA5621', 2),
(default, 'caminhão2A', 'IUA9234', 3),
(default, 'van1C', 'IOK1F31', 4),
(default, 'caminhão2', 'AFD9V23', 5);


insert into sensor values 
(default, 'Sensor Vacinas Covid', 'LM35', 'Ativo', 1, 1),
(default, 'Sensor Vacinas H1N1', 'LM35', 'Ativo', 2, 2),
(default, 'Sensor Vacinas em geral', 'LM35', 'Ativo', 3, 3),
(default, 'Sensor Vacinas Pólio', 'LM35', 'Inativo', 3, 4),
(default, 'Sensor Vacinas em geral', 'LM35','Ativo', 4, 5),
(default, 'Sensor 2A1', 'LM35', 'Inativo', 5, 5);

insert into registro values
(default, 3.5, default, 1),
(default, 8.0, default, 2),
(default, 0.2, default, 3),
(default, 0.0, default, 3),
(default, 10, default, 3),
(default, 6, default, 5);

select nomeEmpresa, email, telefone from cadastroEmpresa where idEmpresa in (1, 2);

select e.nomeEmpresa as Empresa, u.nomeUsuario as Colaborador, u.cargo Cargo, e.cep as CEP, e.numero as Número, ifnull(e.complemento, 'Não consta') as Complemento 
from cadastroEmpresa as e join usuario as u
	on e.idEmpresa = u.empresa;
    
select e.nomeEmpresa as Empresa, s.nomeSensor as Sensor, s.tipo as Tipo, s.statusSensor as Status, t.nome as 'Localização do Sensor',
case
	when d.temperatura <= -1 or d.temperatura >= 7.35 then 'Temperatura Alta'
    else concat(temperatura, '°C')
    end as Temperatura,
d.dtHoraMedicao as 'Horário da Medição'
from cadastroEmpresa as e join sensor as s
	on idEmpresa = empresa
join registro as d
	on idSensor = sensor
join transporte as t
	on t.idTransporte = s.localizacao
    where idEmpresa = 1;
    











