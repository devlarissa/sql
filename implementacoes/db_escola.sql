create database db_escola;
use db_escola;

create table tb_estudantes(
id bigint auto_increment unique,
nome varchar(255) not null,
idade int,
serie int,
nota decimal(8, 2) not null,
nomeResponsavel varchar(255)
);

insert into tb_estudantes(nome, idade, serie, nota, nomeResponsavel) values ("Enzo", 12, 5, 7.5, "Maria");
insert into tb_estudantes(nome, idade, serie, nota, nomeResponsavel) values ("Valentina", 9, 2, 9.2, "Rodrigo");
insert into tb_estudantes(nome, idade, serie, nota, nomeResponsavel) values ("Edu", 14, 7, 5.5, "Coralina");
insert into tb_estudantes(nome, idade, serie, nota) values ("Luiza", 8, 2, 9.7);

select * from tb_estudantes;

select * from tb_estudantes where nota > 7;
select * from tb_estudantes where nota < 7;

update tb_estudantes set nomeResponsavel = "Icaro" where id = 4; 