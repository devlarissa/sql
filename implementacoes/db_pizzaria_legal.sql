create database db_pizzaria_legal;
use db_pizzaria_legal;

create table tb_categoria(
id bigint auto_increment unique,
tipo varchar(255),
avaliacao decimal(2, 1),
quantidade int,
primary key ( id )
);

create table tb_pizza(
id bigint auto_increment unique,
nome varchar(255),
valor decimal(5, 2),
quantidade int,
categoria_id bigint,
primary key ( id ),
foreign key (categoria_id) references tb_categoria (id) 
);

insert into tb_categoria(tipo, avaliacao, quantidade) values ("doce", 4.5, 12);
insert into tb_categoria(tipo, avaliacao, quantidade) values ("salgada", 3.9, 22);
insert into tb_categoria(tipo, avaliacao, quantidade) values ("vegetariana", 5.0, 6);

insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("pepperoni", 32.99, 1, 2);
insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("mussarela", 25.99, 3, 2);
insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("brigadeiro", 37.90, 1, 1);
insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("couve", 28.5, 5, 3);
insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("coco", 36.0, 1, 1);
insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("rucula", 28.4, 3, 3);
insert into tb_pizza(nome, valor, quantidade, categoria_id) values ("aliche", 47.9, 1, 2);

select * from tb_pizza where valor > 45;
select * from tb_pizza where valor between 29 and 60;
select * from tb_pizza where nome like "%c%";

select tb_pizza.nome, tb_pizza.valor, tb_categoria.tipo
from tb_pizza inner join tb_categoria
on tb_categoria.id = tb_pizza.categoria_id;

select * from tb_pizza where categoria_id = 1;
