create database db_cursoDaMinhaVida;
use db_cursoDaMinhaVida;

create table tb_categorias(
id bigint auto_increment unique,
tipo varchar(255) not null,
quantidade int,
ativo boolean,
primary key ( id )
);

create table tb_produtos(
id bigint auto_increment unique,
nome varchar(255) not null,
valor decimal(8, 2) not null,
quantidade int,
desconto boolean,
categoria_id bigint,
foreign key (categoria_id) references tb_categorias( id ),
primary key ( id)
);

insert into tb_categorias(tipo, quantidade, ativo) values ("profissionalizantes", 98, true);
insert into tb_categorias(tipo, quantidade, ativo) values ("hobbies", 97, true);
insert into tb_categorias(tipo, quantidade, ativo) values ("tutoriais", 99, true);

select * from tb_categorias;

insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("secretariado", 32.99, 1, true, 1);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("croche", 25.31, 1, false, 2);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("reparos", 41.99, 1, false, 3);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("pintura", 36.99, 1, false, 2);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("desenho digital", 51.99, 1, true, 1);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("intalacao de pisos", 68.99, 2, false, 3);

select * from tb_produtos;

select * from tb_produtos where valor > 50;
select * from tb_produtos where valor between 3 and 60;
select * from tb_produtos where nome like "%c%";

select tb_produtos.nome, tb_produtos.valor, tb_categorias.tipo 
from tb_produtos inner join tb_categorias on tb_categorias.id = tb_produtos.categoria_id;

select * from tb_produtos where categoria_id = 3;
