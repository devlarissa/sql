create database db_generation_game_online;
use db_generation_game_online;

create table tb_classe(
id bigint auto_increment unique,
tipo varchar(255) not null,
quantidade int,
equipamento varchar(255),
primary key ( id )
);

create table tb_personagem(
id bigint auto_increment unique,
nome varchar(255),
poderAtaque bigint not null,
poderDefesa bigint not null,
pontosVida bigint,
classe_id bigint,
primary key ( id ),
foreign key (classe_id) references tb_classe (id)
);

insert into tb_classe(tipo, quantidade, equipamento) values ("Arqueiro", 55, "arco e flexa");
insert into tb_classe(tipo, quantidade, equipamento) values ("Tanque", 23, "escudo e clava");
insert into tb_classe(tipo, quantidade, equipamento) values ("Mago", 34, "cajado");
select * from tb_classe;

insert into tb_personagem (nome, poderAtaque, poderDefesa, pontosVida, classe_id) values ("Robin Hood", 1000, 500, 6000, 1);
insert into tb_personagem (nome, poderAtaque, poderDefesa, pontosVida, classe_id) values ("Dumbledor", 8000, 100, 3000, 3);
insert into tb_personagem (nome, poderAtaque, poderDefesa, pontosVida, classe_id) values ("Orch", 500, 1000, 10000, 2);
insert into tb_personagem (nome, poderAtaque, poderDefesa, pontosVida, classe_id) values ("Troll", 300, 1100, 11000, 2);
insert into tb_personagem (nome, poderAtaque, poderDefesa, pontosVida, classe_id) values ("Arqueiro verde", 1100, 400, 7000, 1);
insert into tb_personagem (nome, poderAtaque, poderDefesa, pontosVida, classe_id) values ("Mestre dos magos", 6000, 150, 7000, 3);
select * from tb_personagem;

select * from tb_personagem where poderAtaque > 2000;
select * from tb_personagem where poderDefesa between 1000 and 2000;

select * from tb_personagem where nome like "%c%";

select tb_personagem.nome, tb_classe.tipo, tb_classe.equipamento
from tb_personagem inner join tb_classe
on tb_classe.id = tb_personagem.classe_id;

select * from tb_personagem order by classe_id;
select * from tb_personagem where classe_id = 2;