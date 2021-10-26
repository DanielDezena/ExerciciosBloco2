create database db_pizzaria_legal;
use db_pizzaria_legal;

create table tb_Categoria(
	id_categoria bigint(20) auto_increment,
    tamanho enum("P","M","G","F"),
    assado enum("à lenha", "ao forno"),
    primary key (id_categoria)
);

insert into tb_Categoria(tamanho, assado)
values(1,1),
(2,2),
(3,1),
(4,1),
(3,2);

create table tb_Pizza(
	id_Pizza bigint(20) auto_increment,
    nome varchar(20),
    ingredientes varchar(100),
    preco real,
    fk_categoria bigint(20),
	constraint foreign key (fk_categoria) references tb_Categoria(id_Categoria),
    primary key (id_Pizza)
);

insert into tb_Pizza(nome, ingredientes, preco, fk_categoria)
values("Calabresa", "Calabresa, queijo e cebolas fatiadas", 29.90, 2),
("Frango", "Frango desfiado, catupiry e cheddar", 22.90, 1),
("Pedido do mestre", "Lombo, cogumelo champignon, mussarela e cebolas fatiadas", 60.80, 4),
("Premium", "Peperoni, Pimentão fatiado, cogumelo champignon e mussarela", 49.90, 3),
("Hamburguer", "Hamburguer e mussarela", 32.60, 2),
("Portuguesa", "Presunto, mussarela, ovos cozidos, tomate em rodelas e cebolas fatiadas", 52.80, 5),
("Marguerita", "Mussarela, tomate em rodelas e folhas de manjericão", 48.60, 5),
("Especial", "Escarola fatiado, requeijão e filés de anchova", 93.55, 4);

select tb_Pizza.nome as "Nome", tb_Pizza.ingredientes as "Ingredientes", 
tb_Categoria.tamanho as "Tamanho", tb_Categoria.assado as "Tipo de assado",
tb_Pizza.preco as "Preço" from tb_Pizza inner join tb_Categoria on 
tb_Categoria.id_categoria = tb_Pizza.fk_categoria where tb_Pizza.preco > 45
order by tb_Pizza.nome;

select tb_Pizza.nome as "Nome", tb_Pizza.ingredientes as "Ingredientes", 
tb_Categoria.tamanho as "Tamanho", tb_Categoria.assado as "Tipo de assado",
tb_Pizza.preco as "Preço" from tb_Pizza inner join tb_Categoria on 
tb_Categoria.id_categoria = tb_Pizza.fk_categoria where tb_Pizza.preco between 29 and 60
order by tb_Pizza.nome;

select tb_Pizza.nome as "Nome", tb_Pizza.ingredientes as "Ingredientes", 
tb_Categoria.tamanho as "Tamanho", tb_Categoria.assado as "Tipo de assado",
tb_Pizza.preco as "Preço" from tb_Pizza inner join tb_Categoria on 
tb_Categoria.id_categoria = tb_Pizza.fk_categoria where tb_Pizza.nome like "%C%"
order by tb_Pizza.nome;

select tb_Pizza.nome as "Nome", tb_Pizza.ingredientes as "Ingredientes", 
tb_Categoria.tamanho as "Tamanho", tb_Categoria.assado as "Tipo de assado",
tb_Pizza.preco as "Preço" from tb_Pizza inner join tb_Categoria on 
tb_Categoria.id_categoria = tb_Pizza.fk_categoria where tb_Categoria.assado = 2
order by tb_Pizza.nome;


