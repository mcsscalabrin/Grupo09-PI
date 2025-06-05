var dashboardModel = require("../models/dashboardModel");

function veiculos(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.veiculos(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kp1(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.kp1(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kp2(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.kp2(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kp3(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.kp3(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kp3comp(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.kp3comp(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kp4(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.kp4(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kp4comp(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.kp4comp(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function pop1(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.pop1(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function pop2(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.pop2(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function pop3(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.pop3(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function pop4(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.pop4(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function grafico1(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.grafico1(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function grafico2(req, res) {
    var idEmpresa = req.body.idEmpresaServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }
    dashboardModel.grafico2(idEmpresa).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function kpsEsp(req, res) {
    var idEmpresa = req.body.idEmpresaServer
    var veiculo = req.body.veiculoServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }

    if (veiculo == undefined) {
        res.status(400).send("Veículo está undefined!");
    }
    dashboardModel.kpsEsp(idEmpresa, veiculo).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function popEsp1(req, res) {
    var idEmpresa = req.body.idEmpresaServer
    var veiculo = req.body.veiculoServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }

    if (veiculo == undefined) {
        res.status(400).send("Veículo está undefined!");
    }
    dashboardModel.popEsp1(idEmpresa, veiculo).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function popEsp2(req, res) {
    var idEmpresa = req.body.idEmpresaServer
    var veiculo = req.body.veiculoServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }

    if (veiculo == undefined) {
        res.status(400).send("Veículo está undefined!");
    }
    dashboardModel.popEsp2(idEmpresa, veiculo).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function popEsp3(req, res) {
    var idEmpresa = req.body.idEmpresaServer
    var veiculo = req.body.veiculoServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }

    if (veiculo == undefined) {
        res.status(400).send("Veículo está undefined!");
    }
    dashboardModel.popEsp3(idEmpresa, veiculo).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function popEsp4(req, res) {
    var idEmpresa = req.body.idEmpresaServer
    var veiculo = req.body.veiculoServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }

    if (veiculo == undefined) {
        res.status(400).send("Veículo está undefined!");
    }
    dashboardModel.popEsp4(idEmpresa, veiculo).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function graficoEsp1(req, res) {
    var idEmpresa = req.body.idEmpresaServer
    var veiculo = req.body.veiculoServer

    if (idEmpresa == undefined) {
        res.status(400).send("idEmpresa está undefined!");
    }

    if (veiculo == undefined) {
        res.status(400).send("Veículo está undefined!");
    }
    dashboardModel.graficoEsp1(idEmpresa, veiculo).then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
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