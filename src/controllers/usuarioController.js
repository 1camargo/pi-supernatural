var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
	var email = req.body.emailServer;
	var senha = req.body.senhaServer;

	if (email == undefined) {
		res.status(400).send("Seu email está indefinido!");
	} else if (senha == undefined) {
		res.status(400).send("Sua senha está indefinida!");
	} else {
		usuarioModel
			.autenticar(email, senha)
			.then(function (resultadoAutenticar) {
				console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
				console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

				if (resultadoAutenticar.length == 1) {
					res.json({
						id: resultadoAutenticar[0].idUsuario,
						email: resultadoAutenticar[0].email,
						nome: resultadoAutenticar[0].nome,
					});
				} else if (resultadoAutenticar.length == 0) {
					res.status(403).send("Email e/ou senha inválido(s)");
				} else {
					res.status(403).send("Mais de um usuário com o mesmo login e senha!");
				}
			})
			.catch(function (erro) {
				console.log(erro);
				console.log(
					"\nHouve um erro ao realizar o login! Erro: ",
					erro.sqlMessage
				);
				res.status(500).json(erro.sqlMessage);
			});
	}
}

function cadastrar(req, res) {
	// Crie uma variável que vá recuperar os valores do arquivo cadastro.html
	var nome = req.body.nomeServer;
	var email = req.body.emailServer;
	var senha = req.body.senhaServer;

	// Faça as validações dos valores
	if (nome == undefined) {
		res.status(400).send("Seu nome está indefinido!");
	} else if (email == undefined) {
		res.status(400).send("Seu email está indefinido!");
	} else if (senha == undefined) {
		res.status(400).send("Sua senha está indefinida!");
	} else {
		// Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
		usuarioModel
			.cadastrar(nome, email, senha)
			.then(function (resultado) {
				res.json(resultado);
			})
			.catch(function (erro) {
				console.log(erro);

				if (erro.sqlMessage && erro.sqlMessage.includes("Duplicate entry")) {
					res.status(400).json("Este e-mail já está em uso. Tente outro.");
				} else {
					console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro.sqlMessage);
					res.status(500).json(erro.sql);
				}
			});
	}
}

function relatar(req, res) {
	// Crie uma variável que vá recuperar os valores do arquivo cadastro.html
	var nome = req.body.nomeServer;
	var email = req.body.emailServer;
    var tipo = req.body.tipoServer;
    var descricao = req.body.descricaoServer;
    var cidade = req.body.cidadeServer;
    var estado = req.body.estadoServer;
    var urgencia = req.body.urgenciaServer;
    var fkUsuario = req.body.usuarioServer;

	// Faça as validações dos valores
    if (!nome || !email || !tipo || !descricao || !cidade || !estado || !urgencia) {
		return res.status(400).send("Todos os campos devem ser preenchidos.");
	} else if (nome == undefined) {
		res.status(400).send("Seu nome está indefinido!");
	} else if (email == undefined) {
		res.status(400).send("Seu email está indefinido!");
	} else if (tipo == undefined) {
		res.status(400).send("O tipo está indefinido!");
    } else if (descricao == undefined) {
		res.status(400).send("A descrição está indefinida!");
    } else if (cidade == undefined) {
		res.status(400).send("A cidade está indefinida!");
    } else if (estado == undefined) {
		res.status(400).send("O estado está indefinido!");
    } else if (urgencia == undefined) {
		res.status(400).send("A urgência está indefinida!");
    }

	if (fkUsuario === 'undefined' || fkUsuario === undefined) {
    fkUsuario = null;
	}
		// Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
		usuarioModel
			.relatar(nome, email, tipo, descricao, cidade, estado, urgencia, fkUsuario)
			.then(function (resultado) {
				res.json(resultado);
			})
			.catch(function (erro) {
					console.log("\nHouve um erro ao registrar o relato! Erro: ", erro.sqlMessage || erro);
					res.status(500).json(erro.sqlMessage || erro);
				}
			);
	}


module.exports = {
	autenticar,
	cadastrar,
	relatar
};
