--Consulta 1: CRIA��O DE TABELA E INSER��O DE DADOS

CREATE TABLE DimProdutos(
	id_produto int,
	nome_produto varchar(30),
	id_subcategoria int)

INSERT INTO DimProdutos(id_produto, nome_produto, id_subcategoria)
VALUES
	(1, 'Fone Bluetooth JBL', 5),
	(2, 'PS4', 6),
	(3, 'Notebook Samsung i3', 2),
	(4, 'iPhone 11', 1),
	(5, 'Moto G9', 1)

--Consulta 2: CRIA��O DE TABELA E INSER��O DE DADOS

CREATE TABLE DimSubcategoria(
	id_subcategoria int,
	nome_subcategoria varchar(30))

INSERT INTO DimSubcategoria(id_subcategoria, nome_subcategoria)
VALUES
	(1, 'Celular'),
	(2, 'Notebook'),
	(3, 'C�mera Digital'),
	(4, 'Televis�o'),
	(5, 'Fone de Ouvido')

/* -------------------------------------------------------------------------------------------------*/
--LEFT JOIN
SELECT
	*
FROM
	DimProdutos

SELECT
	*
FROM
	DimSubcategoria

SELECT
	DimProdutos.id_produto,
	DimProdutos.nome_produto,
	DimProdutos.id_subcategoria,
	DimSubcategoria.nome_subcategoria
FROM
	DimProdutos
LEFT JOIN
	DimSubcategoria
ON	
	DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria

/* -------------------------------------------------------------------------------------------------*/
--RIGHT JOIN
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	DimSubcategoria.nome_subcategoria
FROM
	DimProdutos
RIGHT JOIN
	DimSubcategoria
ON	
	DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria
/* -------------------------------------------------------------------------------------------------*/
--INNER JOIN
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimProdutos
INNER JOIN
	DimSubcategoria
	ON
		DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria


/* -------------------------------------------------------------------------------------------------*/
--FULL JOIN
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimProdutos
FULL JOIN
	DimSubcategoria
	ON
		DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria

/* -------------------------------------------------------------------------------------------------*/
--LEFT (ANTI) JOIN
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimProdutos
LEFT JOIN
	DimSubcategoria
	ON
		DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria
WHERE
	nome_subcategoria IS NULL
/* -------------------------------------------------------------------------------------------------*/
--RIGHT (ANTI) JOIN
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimProdutos
RIGHT JOIN
	DimSubcategoria
	ON
		DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria
WHERE
	nome_produto IS NULL
/* -------------------------------------------------------------------------------------------------*/
--FULL (ANTI) JOIN
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimProdutos
FULL JOIN
	DimSubcategoria
	ON
		DimProdutos.id_subcategoria = DimSubcategoria.id_subcategoria
WHERE
	DimProdutos.id_produto IS NULL OR 
	DimSubcategoria.nome_subcategoria IS NULL
/* -------------------------------------------------------------------------------------------------*/
--EXERC�CIOS COM INNER JOIN, LEFT JOIN AND RIGHT JOIN
SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryKey
FROM
	DimProduct

SELECT
	ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProductSubcategory

SELECT												-- 2.517 Registros - dados que coexistem em ambas tabelas
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProduct 
	INNER JOIN 
	DimProductSubcategory
	ON
		DimProduct.ProductSubcategoryKey =
		DimProductSubcategory.ProductSubcategoryKey

SELECT												-- 2.517 Registros - Nenhum dado na tabela esquerda que n�o exista na direita
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
FROM
	DimProduct 
	LEFT JOIN 
	DimProductSubcategory
	ON
		DimProduct.ProductSubcategoryKey =
		DimProductSubcategory.ProductSubcategoryKey

SELECT												-- 2.529 Registros - V�rios dados na tabela da direita que n�o existem na tabela da esquerda, basta ir at� o final da tabela
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
FROM
	DimProduct 
	RIGHT JOIN 
	DimProductSubcategory
	ON
		DimProduct.ProductSubcategoryKey =
		DimProductSubcategory.ProductSubcategoryKey
	
/* -------------------------------------------------------------------------------------------------*/
--COMO DIZER QUEM � A TABELA DA DIREITA E QUEM � A TABELA DA ESQUERDA ?

-- 1 LEFT JOIN para complementar informa��es da tabela de produtos (LEFT) de acordo com a tabela de categoria (RIGHT)
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimProdutos
	LEFT JOIN
	DimSubcategoria
	ON
		DimProdutos.id_subcategoria =
		DimSubcategoria.id_subcategoria

-- 2 Obtendo o LEFT JOIN do caso 1 isando o RIGHT join E INVERTENDO AS TABELAS DE LADO
SELECT
	id_produto,
	nome_produto,
	DimProdutos.id_subcategoria,
	nome_subcategoria
FROM
	DimSubcategoria								-- � no JOIN que fica a identifica��o das tabelas da esquerda ...
	RIGHT JOIN
	DimProdutos									-- ... e direita 
	ON
		DimProdutos.id_subcategoria =
		DimSubcategoria.id_subcategoria

/* -------------------------------------------------------------------------------------------------*/
--LEFT ou INNER JOIN: Qual usar?

--O LEFT JOIN trat� as todas as informa��es da tabela da esquerda e as complementar� com a informa��es
	--	da tabela da direita, mesmo que algum item n�o esteja presente na tabela da direita
--O INNER JOIN trar� todas as informa��es contidas nas duas tabelas, que participam da intersec��o, todas
	-- as informa��es n�o contidas em uma das tabelas n�o ser�o exibidas.
