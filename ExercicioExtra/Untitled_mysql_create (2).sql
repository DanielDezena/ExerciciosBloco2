CREATE TABLE `Postagens` (
	`id_postagem` INT NOT NULL AUTO_INCREMENT,
	`Titulo` varchar(80) NOT NULL,
	`data_postagem` TIMESTAMP NOT NULL,
	`texto` varchar(1000) NOT NULL,
	`fk_usuario` BINARY NOT NULL,
	`fk_tema` BINARY NOT NULL,
	PRIMARY KEY (`id_postagem`)
);

CREATE TABLE `Temas` (
	`id_tema` INT NOT NULL AUTO_INCREMENT,
	`descricao` varchar(255) NOT NULL,
	PRIMARY KEY (`id_tema`)
);

CREATE TABLE `Usuarios` (
	`id_usuario` INT NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`usuario` varchar(255) NOT NULL,
	`senha` varchar(255) NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

ALTER TABLE `Postagens` ADD CONSTRAINT `Postagens_fk0` FOREIGN KEY (`fk_usuario`) REFERENCES `Usuarios`(`id_usuario`);

ALTER TABLE `Postagens` ADD CONSTRAINT `Postagens_fk1` FOREIGN KEY (`fk_tema`) REFERENCES `Temas`(`id_tema`);




