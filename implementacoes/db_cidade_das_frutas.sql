create database db_cidade_das_frutas;
use db_cidade_das_frutas;

create table tb_categorias(
id bigint auto_increment unique,
tipo varchar(255) not null,
quantidade int,
produtor_independente boolean,
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

insert into tb_categorias(tipo, quantidade, produtor_independente) values ("legumes", 98, false);
insert into tb_categorias(tipo, quantidade, produtor_independente) values ("verduras", 97, true);
insert into tb_categorias(tipo, quantidade, produtor_independente) values ("frutas", 99, false);

select * from tb_categorias;

insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("tomate", 2.99, 5, false, 3);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("abobora", 5.31, 1, false, 1);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("alface", 0.99, 1, false, 2);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("maca", 6.99, 5, false, 3);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("coentro", 1.99, 2, false, 2);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("batata", 8.99, 6, false, 1);

select * from tb_produtos;

select * from tb_produtos where valor > 50;
select * from tb_produtos where valor between 3 and 60;
select * from tb_produtos where nome like "%c%";

select tb_produtos.nome, tb_produtos.valor, tb_categorias.tipo 
from tb_produtos inner join tb_categorias on tb_categorias.id = tb_produtos.categoria_id;

select * from tb_produtos where categoria_id = 3;
