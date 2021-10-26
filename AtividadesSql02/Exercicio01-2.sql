create database db_generation_game_online;
use db_generation_game_online;

create table tb_Classes(
	id_classe bigint(20) auto_increment,
    nome_classe varchar(40) not null unique,
    habilidade varchar(40) not null,
    fraqueza varchar(40) not null,
    primary key (id_classe)
);
select * from tb_Classes;
insert into tb_Classes(nome_classe, habilidade, fraqueza)
values("Mago sombrio", "Sombras", "Luz"),
("Mago iluminado", "Luz", "Físico"),
("Guerreiro", "Físico", "Sombras"),
("Feiticeiro", "Conhecimento", "Sombras/Luz"),
("Bárbaro", "Sombras/Físico", "Conhecimento");

create table tb_Personagens(
	id_personagem bigint(20) auto_increment,
    nome varchar(80) not null,
    poder_atk int(20) not null,
    poder_def int(20) not null,
    classe_perso bigint(20) not null,
    primary key (id_personagem),
    constraint foreign key(classe_perso) references tb_Classes(id_classe)
);
insert into tb_Personagens(nome, poder_atk, poder_def, classe_perso)
values("MoonSpear", 5000, 200, 1),
("PurpleWrath", 3000, 2000, 5),
("SunSaber", 4800, 400, 2),
("GrayWalker", 1000, 4200, 3),
("OddKnown", 3300, 1900, 4),
("PedroC", 200, 5000, 3),
("CurseWise", 3200, 2000, 4),
("NightCross", 4900, 300, 1);


select * from tb_Personagens where (`poder_atk` > 2000);
select * from tb_Personagens where (`poder_def` between 1000 and 2000);

select * from tb_Personagens where nome like "C%"; -- se começa com C
select * from tb_Personagens where nome like "%r"; -- se termina com r
select * from tb_Personagens where nome like "%a%"; -- se tem a no meio

select tb_Personagens.nome, tb_Personagens.poder_atk, tb_Personagens.poder_def, 
tb_Classes.nome_classe from tb_Personagens inner join tb_Classes on 
tb_Classes.id_classe = tb_Personagens.classe_perso;

select tb_Personagens.nome, tb_Personagens.poder_atk, tb_Personagens.poder_def, 
tb_Classes.nome_classe from tb_Personagens inner join tb_Classes on 
tb_Classes.id_classe = tb_Personagens.classe_perso where(`id_classe` = 4);