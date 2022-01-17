create database db_rh_empresa;
use db_rh_empresa;

create table tb_funcionarios(
id bigint auto_increment unique,
nome varchar(255) not null,
cpf bigint not null,
telefone bigint,
endereco varchar(255),
idade int,
primary key (id)
);

insert into tb_funcionarios(nome, cpf, telefone, endereco, idade) values ("Rui", 08814412929, 11996965445, "Rua das flores, 11", 25);
insert into tb_funcionarios(nome, cpf, telefone, endereco, idade) values ("Milena", 06544123923, 13977441122, "Rua das flores, 11", 19);
insert into tb_funcionarios(nome, cpf, telefone, endereco, idade) values ("Edna", 19512785438, 14945698224, "Rua das flores, 11", 51);
insert into tb_funcionarios(nome, cpf, telefone, endereco, idade) values ("Pedro", 85438296721, 11912126574, "Rua das flores, 11", 35);
insert into tb_funcionarios(nome, cpf, telefone, endereco, idade) values ("Rosa", 57482960875, 11937294651, "Rua das flores, 11", 43);

select * from tb_funcionarios;
alter table tb_funcionarios drop idade;

select * from tb_funcionarios;
alter table tb_funcionarios add salario bigint;

select * from tb_funcionarios;
update tb_funcionarios set salario = 1500 where id = 1;
update tb_funcionarios set salario = 2500 where id = 2;
update tb_funcionarios set salario = 1950 where id = 3;
update tb_funcionarios set salario = 3849 where id = 4;
update tb_funcionarios set salario = 5500 where id = 5;

select * from tb_funcionarios;
select * from tb_funcionarios where salario > 2000;
select * from tb_funcionarios where salario < 2000;

update tb_funcionarios set endereco = "Rua doutor estranho, 1" where id = 3;
select * from tb_funcionarios;
