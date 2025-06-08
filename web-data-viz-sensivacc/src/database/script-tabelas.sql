Create DATABASE SensiVacc;
USE SensiVacc;

create table empresa(
idEmpresa INT PRIMARY KEY auto_increment,
nomeEmpresa varchar(100) NOT NULL,
cnpj char(14) NOT NULL,
cep char(8) NOT NULL,
numero varchar(10) NOT NULL,
complemento varchar(20),
token char(6) NOT NULL UNIQUE
);

-- ------------------------------------------------------------------
create table usuario(
idUsuario int auto_increment,
empresa int,
constraint pkComposta
	primary key (idUsuario, empresa),
nomeUsuario varchar(45) NOT NULL,
cargo varchar(45),
email varchar(45),
senha varchar(45),
constraint fkUsuarioEmpresa
	foreign key (empresa) references empresa(idEmpresa)
);

-- ------------------------------------------------------------------
create table transporte(
idTransporte int auto_increment,
empresa int,
constraint pkComposta
	primary key (idTransporte, empresa),
nome varchar(45) NOT NULL,
tipo varchar(45) NOT NULL,
identificador varchar(45) NOT NULL,
statusVeiculo tinyint(1) NOT NULL,
constraint chkStatusVeiculo
	check (statusVeiculo in (1, 0)),
constraint fkTransporteEmpresa
	foreign key (empresa) references empresa(idEmpresa)
);

-- ------------------------------------------------------------------
create table sensor(
idSensor INT PRIMARY KEY auto_increment,
nomeSensor varchar(45),
tipo varchar(45) NOT NULL,
statusSensor tinyint(1) NOT NULL,
empresa int NOT NULL,
veiculo int NOT NULL,
constraint fkSensorVeiculo
	foreign key (veiculo) references transporte(idTransporte),
constraint chkStatusSensor
	check (statusSensor in (1, 0)),
constraint fkSensorEmpresa
	foreign key (empresa) references empresa(idEmpresa)
);

-- ------------------------------------------------------------------
create table registro(
idRegistro int auto_increment,
sensor int,
constraint pkComposta
	primary key (idRegistro, sensor),
temperatura float,
dtHoraMedicao datetime default current_timestamp,
constraint fkRegistroSensor
	foreign key (sensor) references sensor(idSensor)
);

insert into empresa  values
(default, 'Sensivacc', '12345678000195', '01414905', '595', 'Sala 4', '1ABCDE'),
(default, 'Inovafarma', '98765432000158', '20250330', '200', 'Andar 5', '2ABCDE'),
(default, 'Ecomed', '13579246000185', '30130123', '50', NULL, '3ABCDE'),
(default, 'MegaCorp', '24680135000167', '80520300', '250', 'Bloco B', '4ABCDE'),
(default, 'StartUpX', '11223344000122', '90020340', '300', 'Sala 22', '5ABCDE');

insert into usuario values
(default, 1, 'Matheus Scalabrin', 'suporte', 'matheus@techvac.com', 'sensi321'),
(default, 1, 'Nathan Barbosa', 'suporte', 'nathan@techvac.com', 'sensi123'),
(default, 2, 'Mariana Souza', 'técnico de temperatura', 'mariana@inovafarma.com', 'inova457'),
(default, 3,'Roberto Lima', 'farmacêutico chefe', 'roberto@ecomed.com', 'eco780'),
(default, 4, 'Fernanda Costa','pesquisador geral', 'fernanda@megacorp.com', 'mega102'),
(default, 5, 'Lucas Almeida', 'analista sênior', 'lucas@startupx.com', 'start2025');

insert into transporte values
(default, 2,'Caminhão1', 'Caminhão', 'FBC5621', 1),
(default, 2,'Caminhão2', 'Caminhão', 'FBI5621', 1),
(default, 2,'Caminhão3', 'Caminhão', 'FQL5621', 0);


insert into sensor values
(default, 'Sensor Vacinas H1N1', 'LM35', 1, 2, 1),
(default, 'Sensor Vacinas Covid', 'LM35', 1, 2, 2),
(default, 'Sensor Vacinas Dengue', 'LM35', 1, 2, 3);

insert into registro values
(default, 1, 8.1, '2024-07-21 12:30:21'),
(default, 1, 8.2, '2024-08-21 12:31:21'),
(default, 1, 8.4, '2024-09-21 12:32:21'),
(default, 1, 3.1, '2025-04-24 12:40:21'),
(default, 1, 7.6, '2025-06-06 12:32:21'),
(default, 1, 8.6, '2025-06-06 12:33:22'),
(default, 2, 1.9, '2025-03-11 12:41:21'),
(default, 2, 8.9, '2025-02-11 12:41:21'),
(default, 2, 1.9, '2025-01-10 12:41:21'),
(default, 2, 8.1, '2024-09-22 12:30:21'),
(default, 2, 8.2, '2024-09-22 12:31:21'),
(default, 2, 8.6, '2024-09-22 12:32:21'),
(default, 2, 1.1, '2025-05-29 12:31:21'),
(default, 2, 1.3, '2025-05-29 12:40:21'),
(default, 2, 1.2, '2025-05-29 12:41:21'),
(default, 2, 1.8, '2025-06-06 12:41:21'),
(default, 3, 8.5, '2024-10-22 12:30:21'),
(default, 3, 8.2, '2024-10-22 12:31:21'),
(default, 3, 8.3, '2024-10-22 12:32:21'),
(default, 3, 1.1, '2025-05-28 12:32:21'),
(default, 3, 1.1, '2025-05-29 12:33:21'),
(default, 3, 1.9, '2025-06-07 12:40:21'),
(default, 3, 1.8, '2025-06-07 12:41:21');

select nomeEmpresa, token from empresa where idEmpresa in (1, 2);

select e.nomeEmpresa as Empresa, u.nomeUsuario as Colaborador, u.cargo Cargo, concat('CEP: ', e.cep, ' N', e.numero, ' ', ifnull(e.complemento, '') ) as Endereço
from empresa as e join usuario as u
	on e.idEmpresa = u.empresa;

select e.nomeEmpresa as Empresa, s.nomeSensor as Sensor, s.tipo as Tipo, s.statusSensor as Status, t.nome as 'Localização do Sensor',
case
	when d.temperatura <= -1 or d.temperatura > 8 then 'Alerta'
    else concat(temperatura, '°C')
    end as Temperatura,
d.dtHoraMedicao as 'Horário da Medição'
from empresa as e join sensor as s
	on idEmpresa = empresa
join registro as d
	on idSensor = sensor
join transporte as t
	on t.idTransporte = s.veiculo
    where idEmpresa = 2;

-- Select principal
select s.nomeSensor as Sensor,
case
	when r.temperatura > 8 then 'Alerta'
	else
    concat(r.temperatura, '°C')
    end as Temperatura, r.dtHoraMedicao as Horário
from sensor as s join registro as r
	on s.idSensor = r.sensor
    where s.idSensor = 1;
    
    
    
    
    
    

    
    


    

    
    














