CREATE DATABASE  db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(255),
    tipo INT,
    
    PRIMARY KEY(id)
);

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
	corte VARCHAR(255), 
	kg DECIMAL,
    valor INT, 
    acompanhamento boolean,
    
    
    -- campo dentro da tabela de pizzas que vai receber a chave estrangeira que virá da tabela de categorias
    categoria_id BIGINT,
    
    PRIMARY KEY(id),
    
    -- criação da chave estrangeira refenciando a coluna de categoria_id da tabela de pizzas, com a coluna de id da tabela de categorias 
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
);


-- inserção dos valores da tabela de categoria 
INSERT INTO tb_categoria(nome_categoria,tipo)
VALUES("carne","1");

INSERT INTO tb_categoria(nome_categoria,tipo)
VALUES("carne","2");

INSERT INTO tb_categoria(nome_categoria,tipo)
VALUES("linguica","3");

INSERT INTO tb_categoria(nome_categoria,tipo)
VALUES("frango","4");

INSERT INTO tb_categoria(nome_categoria,tipo)
VALUES("porco","5");


-- consulta de todos os dados da tabela de categoria
SELECT * FROM tb_categoria;

-- inserção dos dados da tabela de pizzas
INSERT INTO  tb_produtos(corte,kg,valor,acompanhamento, categoria_id)
VALUES("picanha",1,120,true,1);

INSERT INTO  tb_produtos(corte,kg,valor,acompanhamento, categoria_id)
VALUES("alcatra",1,80,true,2);

INSERT INTO  tb_produtos( corte,kg,valor,acompanhamento,categoria_id)
VALUES("toscana",1,30,true,3);

INSERT INTO  tb_produtos(corte,kg,valor,acompanhamento, categoria_id)
VALUES("peito",1,18,false,4);

INSERT INTO  tb_produtos(corte,kg,valor,acompanhamento, categoria_id)
VALUES("lombo",1,20,true,5);

SELECT * FROM tb_produtos

-- consulta dos dados da tabela de pizza onde o valor da pizza for maior que 45 reais
 WHERE valor > 50;

-- maneira 1
-- consulte todos os dados da tabela de pizzas onde os valores estejam entre 50 e 100 reais
SELECT * FROM tb_produtos WHERE valor > 50 AND valor < 150;

-- maneira 2
SELECT *
FROM tb_produtos 
WHERE valor BETWEEN 50 AND 150;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_produtos
WHERE corte LIKE "%M%";

-- faça um select usando INNER JOIN para trazer todos os dados da tabela de pizzas e de categorias, onde na tabela de pizzas no campo de categoria_id for igual aos dados na tabela de categorias no campo de id
-- SELECT * FROM tb pizzas significa a nossa consulta 
SELECT * FROM tb_produtos 

-- INNER JOIN tb_categoria significa que além de trazer os dados da tabela de pizzas vamos unir os dados da tabela de categorias também
INNER JOIN tb_categoria

-- ON significa que eu vou trazer somente os dados que estiverem relacionados, onde na coluna de categoria_id tiver um id igual a coluna id da tabela de categoria
ON tb_categoria.id = tb_produtos.categoria_id;

SELECT * FROM tb_produtos 
INNER JOIN tb_categoria
ON tb_categoria.id = tb_produtos.categoria_id

-- além do join aqui faremos uma CONDIÇÃO, para trazer os dados da tabela pizza, junto com os dados da tabela de categoria SOMENTE onde o nome da categoria for igual a doce
WHERE nome_categoria LIKE "%doce%";


-- CONSULTA BONUS
SELECT * FROM tb_produtos 
INNER JOIN tb_categoria
ON tb_produtos.categoria_id = tb_categoria.id

-- aqui a condição diz para trazer somente os dados da tabela de pizza com os dados da tabela de categoria se o ID da categoria for igual ao numero indicado
WHERE tb_categoria.id = 3;