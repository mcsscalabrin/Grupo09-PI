var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.post("/veiculos", function (req, res) {
    dashboardController.veiculos(req, res);
});

router.post("/kp1", function (req, res) {
    dashboardController.kp1(req, res);
});

router.post("/kp2", function (req, res) {
    dashboardController.kp2(req, res);
});

router.post("/kp3", function (req, res) {
    dashboardController.kp3(req, res);
});

router.post("/kp3comp", function (req, res) {
    dashboardController.kp3comp(req, res);
});

router.post("/kp4", function (req, res) {
    dashboardController.kp4(req, res);
});

router.post("/kp4comp", function (req, res) {
    dashboardController.kp4comp(req, res);
});

router.post("/pop1", function (req, res) {
    dashboardController.pop1(req, res);
});

router.post("/pop2", function (req, res) {
    dashboardController.pop2(req, res);
});

router.post("/pop3", function (req, res) {
    dashboardController.pop3(req, res);
});

router.post("/pop4", function (req, res) {
    dashboardController.pop4(req, res);
});

router.post("/grafico1", function (req, res) {
    dashboardController.grafico1(req, res);
});

router.post("/grafico2", function (req, res) {
    dashboardController.grafico2(req, res);
});

router.post("/kpsEsp", function (req, res) {
    dashboardController.kpsEsp(req, res);
});

router.post("/popEsp1", function (req, res) {
    dashboardController.popEsp1(req, res);
});

router.post("/popEsp2", function (req, res) {
    dashboardController.popEsp2(req, res);
});

router.post("/popEsp3", function (req, res) {
    dashboardController.popEsp3(req, res);
});

router.post("/popEsp4", function (req, res) {
    dashboardController.popEsp4(req, res);
});

router.post("/graficoEsp1", function (req, res) {
    dashboardController.graficoEsp1(req, res);
});

module.exports = router;
