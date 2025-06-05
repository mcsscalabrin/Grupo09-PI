var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT idEmpresa as id, nomeEmpresa as razao_social, cnpj, token as codigo_ativacao FROM empresa WHERE idEmpresa = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT idEmpresa as id, nomeEmpresa as razao_social, cnpj, token as codigo_ativacao FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT idEmpresa as id, nomeEmpresa as razao_social, cnpj, token as codigo_ativacao FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razaoSocial, cnpj) {
  var instrucaoSql = `INSERT INTO empresa (nomeEmpresa, cnpj) VALUES ('${razaoSocial}', '${cnpj}')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar };
