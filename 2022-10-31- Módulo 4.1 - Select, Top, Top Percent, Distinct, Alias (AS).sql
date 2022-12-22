--SQL HASHTAG MODULO 1

SELECT * from DimCustomer

SELECT * from DimStore

SELECT StoreKey, StoreName, StorePhone from DimStore

SELECT * from DimProduct

SELECT ProductName, BrandName,ColorName, UnitPrice from DimProduct

SELECT * from DimStore

SELECT StoreKey, StoreName, StorePhone from DimStore

-- Estruturação de código com identação para facilitar a visualização

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

-- COMENTÁRIOS

-- 1 - Criar uma frase que explica o fumcionamento de um determando código;
-- 2 - Comentar apenas uma parte de um código e executar o restante
-- 3 - Comentar o trecho de um código de maneira rápida e otimizada

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
	Para comentar diversas linhas de comentário
	basta utilizar a barra e o asterístico e
	no final adicionar o mesmo simbolo investido
	asterístico e barra.
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
1 - Crie um código que retorna as 10 primeiras  linhas da tabela de Produtos
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

-- muito útil especialmente para tabelas com milhões de registros commo a tabela FactSales

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