#!/bin/bash

mysql -u aluno -p'Sptech#2024' <<EOF

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

INSERT INTO atividade_paranormal (tipo) VALUES
('Aparição'),
('Possessão'),
('Lobisomem'),
('Encontro com anjos'),
('Outras coisas bizarras');

INSERT INTO urgencia (nivel) VALUES
('Baixo'),
('Moderado'),
('Alto'),
('Crítico');

INSERT INTO usuario (email, nome, senha) VALUES
('admin@email.com', 'admin', SHA2('1234', 256));

CREATE USER 'cacador'@'localhost' IDENTIFIED BY 'Portal100@';
GRANT ALL PRIVILEGES ON supernatural.* TO 'cacador'@'localhost';
FLUSH PRIVILEGES;
EOF

mysql -u cacador -p'Portal100@' <<EOF

USE supernatural;

INSERT INTO usuario (email, nome, senha) VALUES
('jose.silva@email.com', 'José Silva', SHA2('Senha@1234', 256)),
('maria.pereira@email.com', 'Maria Pereira', SHA2('M@ria9876', 256)),
('ana.souza@email.com', 'Ana Souza', SHA2('12345Ana#', 256)),
('carla.martins@email.com', 'Carla Martins', SHA2('Carla@3210', 256)),
('luiz.oliveira@email.com', 'Luiz Oliveira', SHA2('LuizOl@4567', 256));

INSERT INTO relato (titulo, descricao, cidade, estado, fkUsuario, fkAtividade, fkUrgencia) VALUES
('Aparição na casa antiga', 'Vi uma figura misteriosa à noite na minha casa antiga.', 'São Paulo', 'SP', 1, 1, 4),
('Luz estranha no céu', 'Observei uma luz intensa no céu durante a madrugada, parecia um OVNI.', 'Rio de Janeiro', 'RJ', 1, 5, 3),
('Sombra no corredor', 'Uma sombra estranha apareceu no meu corredor e desapareceu em segundos.', 'Campinas', 'SP', 1, 1, 2),
('Ruídos durante a noite', 'Ouvi barulhos incomuns durante a noite que não consegui identificar.', 'São Paulo', 'SP', 1, 5, 2),
('Aparição de um homem na janela', 'Um homem apareceu na janela da minha casa, mas não era visível de dia.', 'Curitiba', 'PR', 1, 1, 1),
('Lobisomem em noite de lua cheia', 'Durante a lua cheia, vi uma criatura estranha nos arredores da minha casa.', 'Porto Alegre', 'RS', 1, 3, 4),
('Presença estranha na sala', 'Senti uma presença estranha na sala e a temperatura caiu drasticamente.', 'Florianópolis', 'SC', 1, 2, 3),
('Som de passos na casa vazia', 'Escutei passos na minha casa vazia, mas não havia ninguém lá.', 'Salvador', 'BA', 1, 1, 2),
('Corredor vazio e frio', 'O corredor estava vazio, mas a sensação de frio era insuportável.', 'Fortaleza', 'CE', 1, 5, 1),
('Anjo apareceu no jardim', 'Vi uma figura brilhante no meu jardim, parecia um anjo.', 'Belo Horizonte', 'MG', 1, 4, 3),
('Possessão de um amigo', 'Meu amigo começou a agir de forma estranha, parecia possuído.', 'São Paulo', 'SP', 2, 2, 4),
('Estranhos movimentos no ar', 'Vi algo se movendo de forma errática no ar, não consegui entender.', 'Curitiba', 'PR', 2, 5, 3),
('Aparição em frente ao espelho', 'Vi uma figura esbranquiçada refletida no espelho.', 'Porto Alegre', 'RS', 2, 1, 2),
('Aparecimento de sombras', 'Sombras começaram a se mover na parede sem explicação.', 'Florianópolis', 'SC', 2, 1, 2),
('Gritos no meio da noite', 'Ouvi gritos aterrorizantes no meio da noite, mas não havia ninguém lá.', 'Campinas', 'SP', 2, 5, 1),
('Lobisomem nas montanhas', 'Vi uma criatura peluda com uma grande força nas montanhas próximas.', 'Rio de Janeiro', 'RJ', 2, 3, 4),
('Porta batendo sozinha', 'A porta da minha casa começou a bater sozinha, sem causa aparente.', 'Salvador', 'BA', 2, 5, 3),
('Sombra gigante no quintal', 'Vi uma sombra gigante no meu quintal durante a noite, que desapareceu rapidamente.', 'Belo Horizonte', 'MG', 2, 1, 1),
('Vozes sussurrando no quarto', 'Senti vozes sussurrando no meu quarto, mas ninguém estava lá.', 'São Paulo', 'SP', 2, 2, 2),
('Encontro com anjo', 'Vi uma figura luminosa voando e que parecia ser um anjo.', 'Fortaleza', 'CE', 2, 4, 3),
('Luz estranha no campo', 'Vi uma luz estranha flutuando no campo de trigo.', 'Campinas', 'SP', 3, 5, 3),
('Sombra de uma pessoa no hall', 'Uma sombra se moveu no hall da minha casa e desapareceu.', 'São Paulo', 'SP', 3, 1, 2),
('Aparição no espelho do banheiro', 'Uma figura apareceu no espelho do banheiro e sumiu rapidamente.', 'Porto Alegre', 'RS', 3, 1, 2),
('Rugido assustador na floresta', 'Escutei um rugido que parecia de um animal selvagem na floresta.', 'Curitiba', 'PR', 3, 3, 4),
('Estranhas figuras nas fotos', 'Na foto de família, apareceram figuras estranhas, que não estavam presentes no momento.', 'Belo Horizonte', 'MG', 3, 1, 3),
('Possessão durante o sono', 'Durante a noite, alguém na minha casa ficou com os olhos completamente brancos, parecia possuído.', 'Florianópolis', 'SC', 3, 2, 4),
('Som de passos atrás de mim', 'Eu estava sozinha e senti alguém andando atrás de mim.', 'Salvador', 'BA', 3, 5, 2),
('Luz piscando sozinha', 'As luzes da sala começaram a piscar sozinhas, mesmo quando a chave estava desligada.', 'Rio de Janeiro', 'RJ', 3, 5, 1),
('Sombra flutuante no jardim', 'Uma sombra flutuante apareceu no meu jardim e desapareceu no ar.', 'Fortaleza', 'CE', 3, 1, 3),
('Anjo apareceu na minha janela', 'Vi um anjo pairando na minha janela durante a madrugada.', 'São Paulo', 'SP', 3, 4, 3),
('Lobisomem na estrada', 'Vi uma criatura com aparência de lobisomem na estrada durante a noite.', 'Salvador', 'BA', 4, 3, 4),
('Possessão de um animal', 'Vi um gato que parecia possuído, com olhos completamente brancos.', 'Porto Alegre', 'RS', 4, 2, 3),
('Aparição de criança no porão', 'Vi uma criança chorando no porão da casa, mas ela desapareceu antes que eu pudesse me aproximar.', 'Belo Horizonte', 'MG', 4, 1, 2),
('Vozes na floresta', 'Ouvi vozes vindas da floresta, mas não havia ninguém lá.', 'Curitiba', 'PR', 4, 5, 1),
('Sombra espreitando pela janela', 'Vi uma sombra observando pela minha janela à noite.', 'São Paulo', 'SP', 4, 1, 3),
('Aparição de um espírito em minha casa', 'Um espírito apareceu no meu quarto, parecia uma mulher antiga.', 'Fortaleza', 'CE', 4, 1, 4),
('Luz vermelha no campo', 'Uma luz vermelha apareceu flutuando sobre o campo de arroz à noite.', 'Rio de Janeiro', 'RJ', 4, 5, 2),
('Som de batidas na porta', 'Ouvi batidas na porta, mas ninguém estava lá.', 'Campinas', 'SP', 4, 5, 2),
('Encontro com anjo no jardim', 'Vi uma figura iluminada em meu jardim, parecia um anjo.', 'Florianópolis', 'SC', 4, 4, 3),
('Aparição de um velho na rua', 'Vi um homem idoso parado na rua, mas ninguém mais o viu.', 'Salvador', 'BA', 4, 1, 3),
('Possessão em uma festa', 'Durante uma festa, um amigo começou a agir de maneira estranha, parecia possuído.', 'Campinas', 'SP', 5, 2, 4),
('Lobisomem na floresta', 'Vi uma criatura parecida com um lobisomem correndo pela floresta.', 'São Paulo', 'SP', 5, 3, 3),
('Anjo apareceu no centro da cidade', 'Vi um anjo pairando no centro da cidade durante o dia.', 'Belo Horizonte', 'MG', 5, 4, 2),
('Ruídos estranhos em casa', 'Ouvi ruídos estranhos dentro de casa durante a noite.', 'Rio de Janeiro', 'RJ', 5, 5, 1),
('Sombra nas escadas', 'Uma sombra apareceu nas escadas, mas quando olhei novamente, ela desapareceu.', 'Porto Alegre', 'RS', 5, 1, 3),
('Rugido de uma besta na montanha', 'Escutei um rugido muito forte vindo das montanhas.', 'Florianópolis', 'SC', 5, 3, 4),
('Aparição de uma mulher na varanda', 'Vi uma mulher de branco na varanda de minha casa, mas ela desapareceu.', 'Curitiba', 'PR', 5, 1, 3),
('Som de passos atrás de mim', 'Eu estava andando e escutei passos atrás de mim, mas ninguém estava lá.', 'Salvador', 'BA', 5, 5, 2),
('Fenômenos estranhos no porão', 'No meu porão, coisas começaram a se mover sozinhas.', 'Fortaleza', 'CE', 5, 5, 1),
('Luz verde no campo de milho', 'Vi uma luz verde flutuando sobre o campo de milho.', 'Campinas', 'SP', 5, 5, 2);
EOF
