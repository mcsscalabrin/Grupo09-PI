var database = require("../database/config");

function veiculos(idEmpresa) {
    var instrucao = `
    select nome from transporte where empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


function kp1(idEmpresa) {
    var instrucao = `
select count(distinct t.nome) as numVeiculos from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 1 DAY) and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function kp2(idEmpresa) {
    var instrucao = `
select statusVeiculo, count(*) as numVeiculos from transporte where empresa = '${idEmpresa}'
group by statusVeiculo order by statusVeiculo; 
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function kp3(idEmpresa) {
    var instrucao = `
select count(*) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function kp3comp(idEmpresa) {
    var instrucao = `
select
(select count(*) from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.empresa = '${idEmpresa}') as seisAtual,
(select count(*) from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao BETWEEN DATE_SUB(NOW(), INTERVAL 12 MONTH) AND DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.empresa = '${idEmpresa}') as seisAnterior;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function kp4(idEmpresa) {
    var instrucao = `
select count(*) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 7 DAY) and t.empresa = '${idEmpresa}'
order by month(r.dtHoraMedicao);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function kp4comp(idEmpresa) {
    var instrucao = `
select
(select count(*) from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 7 DAY) and t.empresa = '${idEmpresa}') as seteAtual,
(select count(*) from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao BETWEEN DATE_SUB(NOW(), INTERVAL 14 DAY) AND DATE_SUB(NOW(), INTERVAL 7 DAY) and '${idEmpresa}') as seteAnterior;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function pop1(idEmpresa) {
    var instrucao = `
select t.nome, count(t.nome) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 1 DAY) and t.empresa = '${idEmpresa}'
group by t.nome;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function pop2(idEmpresa) {
    var instrucao = `
select nome, 
case 
when statusVeiculo = 1 then 'Ativo'
else 'Inativo'
end as status from transporte 
where empresa = '${idEmpresa}'
order by nome;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function pop3(idEmpresa) {
    var instrucao = `
select t.nome, r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function pop4(idEmpresa) {
    var instrucao = `
select t.nome, r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 7 DAY) and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function grafico1(idEmpresa) {
    var instrucao = `
select t.nome, count(t.nome) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 7 DAY) and t.empresa = '${idEmpresa}'
group by t.nome;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function grafico2(idEmpresa) {
    var instrucao = `
select month(r.dtHoraMedicao) as mes, count(t.nome) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.empresa = '${idEmpresa}'
group by month(r.dtHoraMedicao)
order by month(r.dtHoraMedicao);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function kpsEsp(idEmpresa, veiculo) {
    var instrucao = `
select
(select r.temperatura from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where t.nome = '${veiculo}' and t.empresa = '${idEmpresa}'
order by r.dtHoraMedicao desc limit 1) as temperatura,
(select count(t.nome) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 1 MONTH) and t.nome = '${veiculo}' and t.empresa = '${idEmpresa}') as numAlertas,
(select count(t.nome) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.nome = '${veiculo}' and t.empresa = '${idEmpresa}') as numTempAlta,
(select count(t.nome) as numAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.nome = '${veiculo}' and t.empresa = '${idEmpresa}') as numTempBaixa;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function popEsp1(idEmpresa, veiculo) {
    var instrucao = `
select t.nome, r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataMedicao from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where t.nome = '${veiculo}' and t.empresa = '${idEmpresa}'
order by r.dtHoraMedicao desc
limit 20;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function popEsp2(idEmpresa, veiculo) {
    var instrucao = `
select t.nome, r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 or r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 1 MONTH) and t.nome = '${veiculo}'and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function popEsp3(idEmpresa, veiculo) {
    var instrucao = `
select t.nome, r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura > 8 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.nome = '${veiculo}' and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function popEsp4(idEmpresa, veiculo) {
    var instrucao = `
select t.nome, r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataAlerta from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where (case 
	when r.temperatura < 2 then 'Alerta' 
	else
    concat(r.temperatura, '°C')
end) = 'Alerta' and r.dtHoraMedicao >= DATE_SUB(NOW(), INTERVAL 6 MONTH) and t.nome = '${veiculo}' and t.empresa = '${idEmpresa}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function graficoEsp1(idEmpresa, veiculo) {
    var instrucao = `
select r.temperatura, date_format(r.dtHoraMedicao, '%d/%m/%Y %H:%i:%s') as dataMedicao from transporte t join sensor s
    on t.idTransporte = s.veiculo
join registro as r
    on s.idSensor = r.sensor
where t.nome = '${veiculo}' and t.empresa = '${idEmpresa}'
order by r.dtHoraMedicao desc
limit 4;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    veiculos,
    kp1,
    kp2,
    kp3,
    kp3comp,
    kp4,
    kp4comp,
    pop1,
    pop2,
    pop3,
    pop4,
    grafico1,
    grafico2,
    kpsEsp,
    popEsp1,
    popEsp2,
    popEsp3,
    popEsp4,
    graficoEsp1
}