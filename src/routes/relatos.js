var express = require("express");
var router = express.Router();

var relatoController = require("../controllers/relatoController");

router.get("/listar", function (req, res) {
    relatoController.listar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    relatoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    relatoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    relatoController.publicar(req, res);
});

router.put("/editar/:idRelato", function (req, res) {
    relatoController.editar(req, res);
});

router.delete("/deletar/:idRelato", function (req, res) {
    relatoController.deletar(req, res);
});

module.exports = router;