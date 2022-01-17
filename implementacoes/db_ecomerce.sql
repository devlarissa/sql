create database db_ecomerce;
use db_ecomerce;

create table tb_produtos (
id int auto_increment unique,
nome varchar(255) not null,
preco decimal(8 , 2) not null,
quantidade int,
validade varchar(255),
peso decimal(3 , 2), -- peso decimal(3 , 2), - 0.00 - 2 casas depois da virgula e uma antes
primary key (id)
);

insert into tb_produtos(nome, preco, quantidade, validade, peso) values ("Whey", 100.00, 1, "25/11/2022", 1.0);
insert into tb_produtos(nome, preco, quantidade, peso) values ("cadeira", 143.99, 6, 62.5);
alter table tb_produtos modify peso decimal(8,2);

select * from tb_produtos;

insert into tb_produtos(nome, preco, quantidade, peso) values ("cadeira", 143.99, 6, 62.5);
insert into tb_produtos(nome, preco, quantidade, validade, peso) values ("pneu", 300.09, 4, "05/01/2024", 28.6);
insert into tb_produtos(nome, preco, quantidade, peso) values ("vassoura", 5.99, 1, 0.01);
insert into tb_produtos(nome, preco, quantidade, validade, peso) values ("Agua", 3.40, 3, "20/04/2023", 1.5);
insert into tb_produtos(nome, preco, quantidade, peso) values ("carro", 13437.16, 1, 1240);

select * from tb_produtos where preco > 500;
select * from tb_produtos where preco < 500;

update tb_produtos set nome = "abajur" where id = 7;
update tb_produtos set preco = 32.40 where id = 7;
update tb_produtos set quantidade = 2 where id = 7;
update tb_produtos set peso = 12 where id = 7;