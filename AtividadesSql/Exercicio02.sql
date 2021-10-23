create database db_Comercio;
use db_Comercio;

create table tb_Produtos(
	id_produto bigint(20),
    nome varchar(80),
    cor varchar(20),
    fabricante varchar(80),
    preco decimal(10,2),
    primary key (id_produto)
);

insert into tb_Produtos(nome, cor, fabricante, preco)
values("Celular iClone", "Branco", "Banana", 9999.99),
("Mesa digitalizadora", "Preto", "DrawMast", 299.99),
("Abajur do capitão planeta", "Azul", "Cartoon Web", 49.99),
("Jogo de panelas", "Preto", "Big'ol'tina", 199.99),
("Mesa home-office", "Ecru", "Saw & Chop", 539.99),
("Controle Gamer", "Vermelho", "GameCompany", 399.99),
("Notebook", "Ciano", "SkyPuter", 1299.99),
("Televisão O-led", "Preto", "ElGee", 8999.99);
#Seleciona produtos acima de 500
select * from db_Comercio.tb_Produtos where (`preco` >= 500.00);
#Seleciona produtos abaixo de 500
select * from db_Comercio.tb_Produtos where (`preco` < 500.00);
#faz um update no produto com o id 6
update `db_Comercio`.`tb_Produtos` set `cor`="Preto" where (id_produto = 6);
