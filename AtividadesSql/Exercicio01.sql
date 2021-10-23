#criação da database
create database db_servicoRh;
use db_servicoRH;

create table tb_Funcionarie(
	cpf varchar(11),
    nome varchar(255),
    email varchar(255),
    funcao varchar(30),
    salario decimal(10,2),
    primary key (cpf)
    
);

insert into tb_Funcionarie(cpf, nome, email, funcao, salario)
values("12387538712", "Marcos Alberto Silva", "marcossilva12@fictionmail.com", "Administração dos projetos", 2450.25),
("19824871248", "Marilei dos Santos Rocha", "marilemarilei23@fictionmail.com", "Scrum master", 8440.10),
("93284702834", "Pedro Pedroso Gomes", "pepedro25@fictionmail.com", "Desenvolvedore Web", 2645.85),
("12873873943", "Francisca Pereira Souza", "fransos09@fictionmail.com", "Desenvolvedore Júnior", 1450.25),
("17234987234", "Neo Estephans", "neophan93@fictionmail.com", "Secretarie", 1234.85);
#seleciona funcionaries com salarios acima de 2000
select * from db_servicoRH.tb_Funcionarie where (`salario` >= 2000); 
#seleciona funcionaries com salarios abaixo de 2000
select * from db_servicoRH.tb_Funcionarie where (`salario` < 2000);
#faz um update no salário de funcionarie com CPF 12873873943
update `db_servicoRH`.`tb_Funcionarie` set `salario`=1500.00 where (`cpf` = 12873873943);