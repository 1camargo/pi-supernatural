CREATE DATABASE IF NOT EXISTS supernatural;

USE supernatural;

CREATE TABLE IF NOT EXISTS usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45) UNIQUE,
    nome VARCHAR(45),
    senha VARCHAR(260)
);

CREATE TABLE IF NOT EXISTS atividade_paranormal (
	idAtividade INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    CONSTRAINT chkTipo
    CHECK (tipo IN ('Aparição', 'Possessão', 'Lobisomem', 'Encontro com anjos', 'Outras coisas bizarras'))
);

CREATE TABLE IF NOT EXISTS urgencia (
	idUrgencia INT PRIMARY KEY AUTO_INCREMENT,
    nivel VARCHAR(20) NOT NULL,
    CONSTRAINT chkNivel
    CHECK (nivel IN ('Baixo', 'Moderado', 'Alto', 'Crítico'))
);

CREATE TABLE IF NOT EXISTS relato (
	idRelato INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado CHAR(2) NOT NULL,
    fkUsuario INT NOT NULL,
    fkAtividade INT NOT NULL,
    fkUrgencia INT NOT NULL,
    CONSTRAINT fkUsuarioRelato FOREIGN KEY (fkUsuario)
    REFERENCES usuario(idUsuario),
    CONSTRAINT fkAtividadeRelato FOREIGN KEY (fkAtividade)
    REFERENCES atividade_paranormal(idAtividade),
    CONSTRAINT fkUrgenciaRelato FOREIGN KEY (fkUrgencia)
    REFERENCES urgencia(idUrgencia)
);

-- Inserindo os tipos de atividades paranormais
INSERT INTO atividade_paranormal (tipo) VALUES
('Aparição'),
('Possessão'),
('Lobisomem'),
('Encontro com anjos'),
('Outras coisas bizarras');

-- Inserindo os níveis de urgência
INSERT INTO urgencia (nivel) VALUES
('Baixo'),
('Moderado'),
('Alto'),
('Crítico');

INSERT INTO usuario (email, nome, senha) VALUES
	('admin@email.com', 'admin', SHA2('1234', 256));

SELECT * FROM usuario;
SELECT * FROM atividade_paranormal;
SELECT * FROM urgencia;
SELECT * FROM relato;