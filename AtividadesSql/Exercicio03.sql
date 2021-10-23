create database db_Escola;
use db_Escola;

create table tb_Estudantes(
	id_estudante bigint(20) auto_increment,
    nome varchar(80),
    dataNascimento date,
    sala varchar(20),
    nota real,
    primary key  (id_estudante)
);

insert into tb_Estudantes(nome, dataNascimento, sala, nota)
values ("Pedro Henrique",'2004-05-23',"Design 01",8.9),
("Maria Tereza",'2003-08-13',"Programação 03", 9.3),
("Joseph Rodriguez",'2004-03-14',"Administração 04", 4.8),
("Carlos Henrique",'2001-09-03',"Programação",3.2),
("Josias Frederico",'1998-02-27',"Técnico Nutrição 02",9.7),
("Pedro Rocha",'2005-02-13',"Design 01",3.2),
("Natasha Souza",'1999-02-15',"Técnico Nutrição",10.0),
("Ralphe Santos",'2002-05-03',"Administração 04",6.2);
#Seleciona todes Estudantes com notas acima de 7
Select * from db_Escola.tb_Estudantes where (`nota` >= 7);
#Seleciona todes Estudantes com notas abaixo de 7
Select * from db_Escola.tb_Estudantes where (`nota` < 7);

update `db_Escola`.`tb_Estudantes` set `nota`=9.3 where (id_estudante = 8);
