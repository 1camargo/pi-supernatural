CREATE DATABASE supernatural;

USE supernatural;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45) UNIQUE,
    nome VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE atividade_paranormal (
	idAtividade INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    CONSTRAINT chkTipo
    CHECK (tipo IN ('Aparição', 'Possessão', 'Lobisomem', 'Encontro com anjos', 'Outras coisas bizarras'))
);

CREATE TABLE urgencia (
	idUrgencia INT PRIMARY KEY AUTO_INCREMENT,
    nivel VARCHAR(20),
    CONSTRAINT chkNivel
    CHECK (nivel IN ('Baixo', 'Moderado', 'Alto', 'Crítico'))
);

CREATE TABLE relato (
	idRelato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    descricao TEXT,
    cidade VARCHAR(45),
    estado CHAR(2),
    fkUsuario INT NULL,
    fkAtividade INT NOT NULL,
    fkUrgencia INT NOT NULL,
    CONSTRAINT fkUsuarioRelato FOREIGN KEY (fkUsuario)
    REFERENCES usuario(idUsuario),
    CONSTRAINT fkAtividadeRelato FOREIGN KEY (fkAtividade)
    REFERENCES atividade_paranormal(idAtividade),
    CONSTRAINT fkUrgenciaRelato FOREIGN KEY (fkUrgencia)
    REFERENCES Urgencia(idUrgencia)
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

SELECT * FROM usuario;
SELECT * FROM atividade_paranormal;
SELECT * FROM relato;