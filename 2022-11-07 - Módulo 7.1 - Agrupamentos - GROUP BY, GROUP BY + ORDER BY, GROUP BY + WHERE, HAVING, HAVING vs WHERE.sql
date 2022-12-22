/* -------------------------------------------------------------------------------------------------
FUN��ES DE AGREGA��O e CRIA��O DE AGRUPAMENTOS

GROUP BY
GROUP BY + ORDER BY
GROUP BY + WHERE
HAVING
HAVING vs WHERE
*/
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP (5)*
FROM
	DimProduct


SELECT
	BrandName AS 'Marca',
	COUNT(*) AS 'Qtd. Total'
FROM	
	DimProduct
GROUP BY BrandName
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(5)*
FROM
	DimStore


SELECT
	SUM(EmployeeCount)	
FROM	
	DimStore
GROUP BY 
	StoreType
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(5)*
FROM
	DimProduct


SELECT
	BrandName AS 'Marca',	
	AVG(UnitCost) AS 'Custo Unit�rio'
FROM	
	DimProduct
GROUP BY
	BrandName
ORDER BY
	BrandName

/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(5)*
FROM
	DimProduct


SELECT
	ClassName AS 'Classe',
	MAX(UnitPrice) AS 'Maior Pre�o Unit�rio'
FROM	
	DimProduct
GROUP BY 
	ClassName
ORDER BY
	'Maior Pre�o Unit�rio'
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(5)*
FROM
	DimStore


SELECT
	StoreType AS 'Tipo de Loja',
	SUM(EmployeeCount) AS 'Qtd. Funcion�rios'
FROM	
	DimStore
GROUP BY 
	StoreType
ORDER BY
	'Qtd. Funcion�rios'
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(5)*
FROM
	DimProduct


SELECT
	ColorName AS 'Cor do Produto',
	COUNT(*) AS 'Total de Produtos'
FROM	
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY 
	ColorName
ORDER BY
	'Cor do Produto'
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(5)*
FROM
	DimProduct


SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Qtd. Produtos',
	COUNT(*) AS 'Check Qtd. Produtos'
FROM	
	DimProduct
GROUP BY 
	BrandName
HAVING										-- FILTRO APLICADO DEPOIS DO AGRUPAMENTO, enquanto WHERE usamos apenas antes do agrupamento.
	COUNT(BrandName)  >=200
ORDER BY
	'Qtd. Produtos' DESC
/* -------------------------------------------------------------------------------------------------*/
SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total de Produtos'
FROM
	DimProduct
WHERE										-- Filtra a tabela original antes do agrupamento
	ClassName = 'Economy'
GROUP BY 
	BrandName
HAVING										-- Filtra a tabela depois do agrupamento
	COUNT(BrandName) >=200
/* -------------------------------------------------------------------------------------------------*/