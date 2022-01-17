create database db_farmacia_do_bem;
use db_farmacia_do_bem;

create table tb_categoria(
id bigint auto_increment unique,
tipo varchar(255),
observacao varchar(255),
quantidade int,
primary key (id)
);

create table tb_produto(
id bigint auto_increment unique,
nome varchar(255),
codigo bigint,
valor decimal(8, 2) not null,
desconto boolean,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_categoria(tipo, observacao, quantidade) values ("Controlado", "obrigatorio receita especial", 44);
insert into tb_categoria(tipo, observacao, quantidade) values ("manipulado", "necessario composicao", 23);
insert into tb_categoria(tipo, quantidade) values ("comum", 18);

select * from tb_categoria;

insert into tb_produto(nome, codigo, valor, desconto, categoria_id) values ("dipirona", 12, 5.99, true, 3);
insert into tb_produto(nome, codigo, valor, desconto, categoria_id) values ("rivotril", 79, 162.9, true, 1);
insert into tb_produto(nome, codigo, valor, desconto, categoria_id) values ("orlistate", 56, 62.5, false, 2);
insert into tb_produto(nome, codigo, valor, desconto, categoria_id) values ("famotidina", 91, 53.7, false, 2);
insert into tb_produto(nome, codigo, valor, desconto, categoria_id) values ("bupropiona", 20, 129.34, true, 1);
insert into tb_produto(nome, codigo, valor, desconto, categoria_id) values ("fexofenadina", 74, 41.38, false, 3);

select * from tb_produto;

drop table tb_produto; -- deleta a tabela

select * from tb_produto where valor > 50;
select * from tb_produto where valor between 3 and 60;
select * from tb_produto where nome like "%b%";

select tb_produto.nome, tb_produto.valor, tb_categoria.tipo from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;

select * from tb_produto where desconto = true;
