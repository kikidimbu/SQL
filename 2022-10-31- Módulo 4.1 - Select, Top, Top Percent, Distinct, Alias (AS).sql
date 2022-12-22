--SQL HASHTAG MODULO 1

SELECT * from DimCustomer

SELECT * from DimStore

SELECT StoreKey, StoreName, StorePhone from DimStore

SELECT * from DimProduct

SELECT ProductName, BrandName,ColorName, UnitPrice from DimProduct

SELECT * from DimStore

SELECT StoreKey, StoreName, StorePhone from DimStore

-- Estrutura��o de c�digo com identa��o para facilitar a visualiza��o

SELECT
	*
from
	DimStore

SELECT 
	StoreKey,
	StoreName,
	StorePhone
from 
	DimStore

-- COMENT�RIOS

-- 1 - Criar uma frase que explica o fumcionamento de um determando c�digo;
-- 2 - Comentar apenas uma parte de um c�digo e executar o restante
-- 3 - Comentar o trecho de um c�digo de maneira r�pida e otimizada

SELECT
	ProductKey,
	Product Name
FROM
	DimProduct

SELECT
	--StoreKey,
	StoreName,
	StorePhone
FROM
	DimStore

SELECT
	*
FROM
	DimProduct

	/*
	Para comentar diversas linhas de coment�rio
	basta utilizar a barra e o aster�stico e
	no final adicionar o mesmo simbolo investido
	aster�stico e barra.
	*/

SELECT
	*
FROM
	DimEmployee

SELECT
	FirstName,
	EmailAddress
FROM
	DimEmployee

/*
COMANDOS SECT TOP(N) E TOP(N) PERCENT:
	retorna as N primeiras linhas
1 - Crie um c�digo que retorna as 10 primeiras  linhas da tabela de Produtos
*/

SELECT TOP (10)
	*
FROM
	DimProduct

-- 2 - Retorna apenas 10% das primeiras linhas da tabela de clientes
SELECT TOP (10) PERCENT
	*
FROM
	DimCustomer

-- muito �til especialmente para tabelas com milh�es de registros commo a tabela FactSales

SELECT TOP (1000)
	* 
FROM
	FactSales

/*
DISTINCT - Retorna os valores distintos de uma tabela.
1 - Retorne todas as linhas da tabela dimProduct
*/
SELECT
	*
FROM
	DimProduct

-- Retorne os valores distintos da coluna ColorName da tabela dimProduct
SELECT DISTINCT
	ColorName
FROM
	DimProduct

-- Retorne todas as linhas da tabela dimEmployee
SELECT
	*
FROM
	DimEmployee

-- Retorne os valores distintos da coluna DepartamentName da tabela dimEmployee 
SELECT DISTINCT
	DepartmentName
FROM
	DimEmployee

--RENOMEANDO COLUNAS (Aliasing)

-- Selecione as 3 coluna da tabela DimProduct: ProductName, BrandName e ColorName.

SELECT
	ProductName AS Produto,
	BrandName AS Marca,
	ColorName AS Cor
FROM
	DimProduct

SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS Marca,
	ColorName AS Cor
FROM
	DimProduct