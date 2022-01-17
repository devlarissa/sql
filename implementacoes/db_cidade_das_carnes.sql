create database db_cidade_das_carnes;

use db_cidade_das_carnes;

-- tem que criar a categoria primeiro para ser a chave estrangeira da tabela produtos
create table tb_categoria(
id bigint auto_increment,
descricao varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert into tb_categoria (descricao, ativo) values ("Bovino",true);
insert into tb_categoria (descricao, ativo) values ("Suino",true);
insert into tb_categoria (descricao, ativo) values ("Aves",true);
insert into tb_categoria (descricao, ativo) values ("pertence feijoada",true);
insert into tb_categoria (descricao, ativo) values ("imbutidos",true);
insert into tb_categoria (descricao, ativo) values ("soja",true);
insert into tb_categoria (descricao, ativo) values ("outros",true);

select * from tb_categoria;

create table tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
preco decimal(6,2) not null,
qtproduto int not null,
dtvalidade date,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("ASA",40.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Picanha",20.00,30, "2021-11-08", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("coxa de frango",20.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Bacon",30.00,30, "2021-11-09", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("hamburguer",60.00,30, "2021-09-07", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Cupim",20.00,30, "2021-11-10", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Peito de frango",25.00,30, "2021-11-09", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Orelha de porco",20.00,30, "2021-11-07", 4);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Salame",18.00,30, "2021-11-21", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("medalhao",50.00,30, "2021-11-15", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("mocoto",20.00,30, "2021-10-05", 2);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("chuleta",20.00,30, "2021-10-07", 1);
insert into tb_produtos (nome, preco, qtProduto) values ("acendedor de churrasqueira",20.00,30);
insert into tb_produtos (nome, preco, qtProduto) values ("soprador de churrasqueira",35.00,30);

select * from tb_produtos;
select * from tb_produtos order by nome; -- A a Z
select * from tb_produtos order by nome DESC; -- Z a A
select nome, preco from tb_produtos order by preco;

-- and
select * from tb_produtos where preco > 20.00 and preco < 50.00; -- maior que vinte e menor que cinquenta
-- or
select * from tb_produtos where preco > 20.00 or preco < 50.00;
select * from tb_produtos where preco > 20.00 or categoria_id = 3;

-- not
select * from tb_produtos where not categoria_id = 3;

-- % = qualquer texto
-- ha% = iniciar com ha e o resto qualquer coisa
select * from tb_produtos where nome like "ha%";

-- %ha = começar com qualquer coisa mas terminar com ha
select * from tb_produtos where nome like "%ha";

-- %ha% = não importa onde, mas precisa tem ha (comeco, meio ou fim)
select * from tb_produtos where nome like "%ha%";

-- if
select descricao, if(ativo, "Verdadeiro", "Falso") as teste_ativo from tb_categoria;

-- in (seleciona os valores que voce quer)
select * from tb_produtos where preco in (30, 40, 50);

-- between (intervalo)
select *from tb_produtos where preco between 30 and 50;
select *from tb_produtos where dtvalidade between '2021-11-07' and '2021-11-15';

-- count (contar)
select count(*) from tb_produtos;
select count(categoria_id) from tb_produtos; -- quantidade de produtos com a categoria informada

-- sum (soma)
select sum(preco) from tb_produtos; -- somou todos os precos

-- avg (media)
select avg(preco) from tb_produtos;

-- group by (faz a operacao e agrupa do modo que voce escolher)
select categoria_id, avg(preco) as media_preco from tb_produtos group by categoria_id;
select avg(preco) from tb_produtos where categoria_id in (1, 5, 7) group by categoria_id;

-- max e min
select max(preco) from tb_produtos; -- tras só o preco
select max(preco) from tb_produtos;
select * from tb_produtos where preco = (select max(preco) from tb_produtos); -- uma consulta dentro de outra
-- ele busca o maior preco, depois ve os produtos com esse preco

-- join (para tabelas remacionadas, trazer informacoes das 2)

-- tipo 1 inner join (a interseccao da relacao, (só retorna o meio))
select tb_produtos.nome, tb_produtos.preco, tb_produtos.qtProduto, tb_categoria.descricao -- fala os atributos que quer apresentar
from tb_produtos inner join tb_categoria -- quais tabelas voce está juntando
 on tb_categoria.id = tb_produtos.categoria_id; -- junta a chave primaria de um com a estrangeira de outra

-- ordenado
select tb_produtos.nome, tb_produtos.preco, tb_produtos.qtProduto, tb_categoria.descricao -- fala os atributos que quer apresentar
from tb_produtos inner join tb_categoria -- quais tabelas voce está juntando
 on tb_categoria.id = tb_produtos.categoria_id -- junta a chave primaria de um com a estrangeira de outra
order by tb_categoria.descricao; -- ordenando pelo nome da descricao

select tb_categoria.descricao, avg(tb_produtos.preco) as preco_medio -- faz a media dos elementos de preco e pega o nome da descricao
from tb_produtos inner join tb_categoria -- quais tabelas voce está juntando
 on tb_categoria.id = tb_produtos.categoria_id -- junta a chave primaria de um com a estrangeira de outra
group by tb_produtos.categoria_id -- agrupando pelo tipo de categoria
order by tb_categoria.descricao; -- ordena pelo nome da categoria


-- tipo 1 left join (a interseccao da relacao + os produtos a esquerda (retorna todas as categorias a esquerda e as o meio))
select tb_produtos.nome, tb_produtos.preco, tb_produtos.qtProduto, tb_categoria.descricao -- fala os atributos que quer apresentar
from tb_produtos left join tb_categoria -- quais tabelas voce está juntando
 on tb_categoria.id = tb_produtos.categoria_id; -- junta a chave primaria de um com a estrangeira de outra

-- tipo 1 right join (a interseccao da relacao + os produtos a direita (retorna todas as categorias a direita e as o meio))
select tb_produtos.nome, tb_produtos.preco, tb_produtos.qtProduto, tb_categoria.descricao -- fala os atributos que quer apresentar
from tb_produtos right join tb_categoria -- quais tabelas voce está juntando
 on tb_categoria.id = tb_produtos.categoria_id; -- junta a chave primaria de um com a estrangeira de outra


-- formatar data pro brasil
select nome, date_format(dtValidade, "%d/%m/%Y") as data_validade
from tb_produtos;
