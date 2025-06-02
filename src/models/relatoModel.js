var database = require("../database/config");

function listar() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucaoSql = `
        SELECT 
            r.idRelato AS idRelato,
            r.titulo,
            r.descricao,
            r.cidade,
            r.estado,
            r.fkAtividade,
            a.tipo,
            r.fkUrgencia,
            ur.nivel,
            r.fkUsuario,
            u.idUsuario AS idUsuario,
            u.email,
            u.nome,
            u.senha
        FROM relato r
            INNER JOIN usuario u
                ON r.fkUsuario = u.idUsuario
                    INNER JOIN urgencia ur
                        ON r.fkUrgencia = ur.idUrgencia
                            INNER JOIN atividade_paranormal a
                                ON r.fkAtividade = a.idAtividade;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function pesquisarDescricao(texto) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function pesquisarDescricao()");
    var instrucaoSql = `
        SELECT 
            r.idRelato AS idRelato,
            r.titulo,
            r.descricao,
            r.cidade,
            r.estado
            r.fkUsuario,
            u.idUsuario AS idUsuario,
            u.nome,
            u.email,
            u.senha
        FROM relato r
            INNER JOIN usuario u
                ON r.fkUsuario = u.idUsuario
        WHERE r.descricao LIKE '${texto}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarPorUsuario(idUsuario) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPorUsuario()");
    var instrucaoSql = `
        SSELECT 
            r.idRelato AS idRelato,
            r.titulo,
            r.descricao,
            r.cidade,
            r.estado
            r.fkUsuario,
            u.idUsuario AS idUsuario,
            u.nome,
            u.email,
            u.senha
        FROM relato r
            INNER JOIN usuario u
                ON r.fkUsuario = u.idUsuario
        WHERE u.idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function publicar(titulo, descricao, cidade, estado, idUsuario, atividade, urgencia) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function publicar(): ", titulo, descricao, cidade, estado, idUsuario, atividade, urgencia);
    var instrucaoSql = `
        INSERT INTO relato (titulo, descricao, cidade, estado, fkUsuario, fkAtividade, fkUrgencia) VALUES ('${titulo}', '${descricao}', '${cidade}', '${estado}', ${idUsuario}, ${atividade}, ${urgencia});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function editar(novaDescricao, idRelato) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function editar(): ", novaDescricao, idRelato);
    var instrucaoSql = `
        UPDATE relato SET descricao = '${novaDescricao}' WHERE idRelato = ${idRelato};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function deletar(idRelato) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function deletar():", idRelato);
    var instrucaoSql = `
        DELETE FROM relato WHERE idRelato = ${idRelato};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listar,
    listarPorUsuario,
    pesquisarDescricao,
    publicar,
    editar,
    deletar
}
