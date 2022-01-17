create database db_construindo_a_nossa_vida;
use db_construindo_a_nossa_vida;

create table tb_categorias(
id bigint auto_increment unique,
tipo varchar(255) not null,
quantidade int,
disponivel boolean,
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

insert into tb_categorias(tipo, quantidade, disponivel) values ("hidraulica", 21, true);
insert into tb_categorias(tipo, quantidade, disponivel) values ("eletrica", 12, true);
insert into tb_categorias(tipo, quantidade, disponivel) values ("construcao", 29, true);

select * from tb_categorias;

insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("eletroduto", 10.99, 3, false, 2);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("torneira", 35.31, 2, false, 1);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("cano", 8.99, 1, false, 1);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("tijolo", 50.99, 10, false, 3);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("interruptor", 5.99, 1, false, 2);
insert into tb_produtos(nome, valor, quantidade, desconto, categoria_id) values ("cimento", 88.99, 2, false, 3);

select * from tb_produtos;

select * from tb_produtos where valor > 50;
select * from tb_produtos where valor between 3 and 60;
select * from tb_produtos where nome like "%c%";

select tb_produtos.nome, tb_produtos.valor, tb_categorias.tipo 
from tb_produtos inner join tb_categorias on tb_categorias.id = tb_produtos.categoria_id;

select * from tb_produtos where categoria_id = 3;