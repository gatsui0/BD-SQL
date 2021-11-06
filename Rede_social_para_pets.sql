

CREATE DATABASE Rede_social_para_pets;
use Rede_social_para_pets;

CREATE TABLE usuario(	
	email VARCHAR(50),
	senha CHAR(10),
	telefone CHAR(9),
    PRIMARY KEY(email)
    );
    
CREATE TABLE perfil(
	estuda VARCHAR(50),
    nome CHAR(30),
    trabalha_em CHAR(40),
    mora_em VARCHAR(50),
    estado_civil CHAR(7),
    link VARCHAR(50),
    PRIMARY KEY (link)
);





