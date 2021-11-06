DROP DATABASE IF EXISTS REDE_social_para_bixos;

CREATE DATABASE REDE_social_para_bixos;
USE rede_social_para_bixos;	

DROP TABLE IF EXISTS anuncio_loja_online;
DROP TABLE IF EXISTS anuncio_espaco_local;
DROP TABLE IF EXISTS duracao;
DROP TABLE IF EXISTS publicacao_paga;
DROP TABLE IF EXISTS publicacao_gratuita;
DROP TABLE IF EXISTS grupo_tem_publicacao;
DROP TABLE IF EXISTS perfil_tem_publicacao;
DROP TABLE IF EXISTS publicacao;
DROP TABLE IF EXISTS esta_em;
DROP TABLE IF EXISTS gerencia;
DROP TABLE IF EXISTS grupo;
DROP TABLE IF EXISTS fanpage_do_pet;
DROP TABLE IF EXISTS relacionamento;
DROP TABLE IF EXISTS perfil;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario(
	email VARCHAR(30),
    senha VARCHAR(10),
    telefone CHAR(9),
    
	PRIMARY KEY(email),
    link_perfil VARCHAR(40)
);

CREATE TABLE perfil(
	nome CHAR(20),
    trabalha_em CHAR(30),
	mora_em CHAR(30),
	estudou_em CHAR(30),
    estado_civil CHAR(8),
    link VARCHAR(40),
    
    PRIMARY KEY(link),
    
	email_usuario VARCHAR(40),
    FOREIGN KEY(email_usuario) REFERENCES usuario(email) on delete cascade
);

CREATE TABLE relacionamento(
    pagina VARCHAR(40),
    pagina1 VARCHAR(40),
    primary key (pagina, pagina1),
    foreign key (pagina) references perfil(link) on delete cascade,
    foreign key (pagina1) references perfil(link) on delete cascade
);
CREATE TABLE fanpage_do_pet(
	descricao CHAR(100),
    tipo_de_mascote CHAR(40),
    nome_do_mascote VARCHAR(40),
	link VARCHAR(40),
    
    primary key(link, nome_do_mascote),
    foreign key (link) references perfil(link) on delete cascade
);

CREATE TABLE grupo(
	n_de_membros CHAR(100),
    criado_desde CHAR(40),
    descricao VARCHAR(40),
    id_grupo VARCHAR(40),
    primary key (id_grupo)
);

CREATE TABLE esta_em(

    link_perfil VARCHAR(40),
    id_grupo VARCHAR(40),
    desde CHAR(10),
    
    primary key (link_perfil, id_grupo),
    foreign key (link_perfil) references perfil(link) on delete cascade,
    foreign key (id_grupo) references grupo(id_grupo) on delete cascade
);
CREATE TABLE gerencia(


    link_de_gerencia VARCHAR(40),
    id_grupo_de_gerencia VARCHAR(40),
    
    primary key (link_de_gerencia, id_grupo_de_gerencia),
    foreign key (link_de_gerencia) references perfil(link) on delete cascade,
    foreign key (id_grupo_de_gerencia) references grupo(id_grupo) on delete cascade
);

CREATE TABLE publicacao(
	criado_desde CHAR(10),
    descricao VARCHAR(100),
    id CHAR(10),
    
    primary key (id)
);

CREATE TABLE perfil_tem_publicacao(
 
    link_perfil VARCHAR(40),
	id_publicacao CHAR(10),

    primary key (link_perfil, id_publicacao),
    foreign key (link_perfil) references perfil(link) on delete cascade,
    foreign key (id_publicacao) references publicacao(id) on delete cascade
);
CREATE TABLE grupo_tem_publicacao(

    id_publicacao CHAR(10),
	id_grupo VARCHAR(40),

    primary key (id_publicacao, id_grupo),
    foreign key (id_publicacao) references publicacao(id) on delete cascade,
    foreign key (id_grupo) references grupo(id_grupo) on delete cascade

);

CREATE TABLE publicacao_gratuita(
	n_de_curtidas CHAR(100),
    comentar CHAR(200),
    tipo_de_publico_animal CHAR(10),
    visibilidade CHAR(10),
    url_video VARCHAR(40),

	id_publicacao CHAR(10),
	primary key (id_publicacao),
    foreign key (id_publicacao) references publicacao(id) on delete cascade
);

CREATE TABLE publicacao_paga(
	n_de_curtidas CHAR(100),
    n_de_visualizacoes CHAR(100),
    comentar CHAR(200),
    tipo_de_publico_animal CHAR(10),
    link_site VARCHAR(40),

	id_publicacao CHAR(10),
	primary key (id_publicacao),
    foreign key (id_publicacao) references publicacao(id) on delete cascade
);

CREATE TABLE anuncio_espaco_local(
	horario CHAR(5),
    bairro VARCHAR(20),
    endereco VARCHAR(20),
    cidade VARCHAR(20),
    
    id CHAR(10),
    primary key (id),
    foreign key (id) references publicacao_paga(id_publicacao) on delete cascade
);

CREATE TABLE anuncio_loja_online(
	url VARCHAR (40),
	nome_da_loja CHAR(20),
	horario_de_atendimento CHAR(5),

    id CHAR(10),
    primary key (id),
    foreign key (id) references publicacao_paga(id_publicacao) on delete cascade
);


ALTER TABLE usuario ADD CONSTRAINT link_perfil FOREIGN KEY ( link_perfil ) REFERENCES perfil(link) on delete cascade;