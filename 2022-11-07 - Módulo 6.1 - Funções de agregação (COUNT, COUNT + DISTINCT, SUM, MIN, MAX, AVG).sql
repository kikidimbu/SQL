/* -------------------------------------------------------------------------------------------------
FUNÇÕES DE AGREGAÇÃO

COUNT
COUNT + DISTINCT
SUM
MIN
MAX
AVG
*/
/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP(100) *
FROM
	FactSales
	
SELECT												-- 1 Registro gerado (TV: 53.320.454, TD: 493.587)
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales


/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP (100) *
FROM
	DimProduct
	

SELECT												-- 1 Registro gerado (TP: 2.517)
	COUNT(*) AS 'Total de Produtos'
FROM
	DimProduct

SELECT												-- 1 Registro gerado (TP: 2.517)
	COUNT(ProductName) AS 'Quantidade de Produtos'
FROM
	DimProduct

SELECT												-- 1 Registro gerado (TP: 1.947 - Dependendo do campo e dos dados armazenados, vamos ter resultados diferentes, por valores Nulos)
	COUNT(Size) AS 'Dimensões de Produtos'
FROM
	DimProduct	

/* -------------------------------------------------------------------------------------------------*/
SELECT
	TOP (100)*
FROM
	DimProduct
	

SELECT												-- 1 Registro gerado: 16 cores
	COUNT (DISTINCT ColorName) AS 'Cores'	
FROM
	DimProduct

SELECT												-- 1 Registro gerado: 11 marcas
	COUNT (DISTINCT BrandName) AS 'Cores'	
FROM
	DimProduct

SELECT												-- 1 Registro gerado: 11 marcas
	DISTINCT BrandName AS 'Marca'
FROM
	DimProduct


/* -------------------------------------------------------------------------------------------------*/
SELECT
	*
FROM
	DimProduct
	

SELECT													-- 1 Registro gerado: 0.95, 356.831, 3199.99 
	MIN (UnitPrice) AS 'Preço Unitário Mínimo',
	AVG (UnitPrice) AS 'Preço Unitário Médio',
	MAX (UnitPrice) AS 'Preço Unitário Máximo'
FROM
	DimProduct
	
SELECT													-- 1 Registro gerado: 0.48, 147.6555, 1060.22
	MIN (UnitCost) AS 'Custo Unitário Mínimo',
	AVG (UnitCost) AS 'Custo Unitário Médio',
	MAX (UnitCost) AS 'Custo Unitário Máximo'
FROM
	DimProduct

/* -------------------------------------------------------------------------------------------------*/
SELECT
	*	
FROM
	DimCustomer
	

SELECT													-- 1 Registro gerado: 260174.89
	AVG(yearlyincome) AS 'Média Anual de Salários'	
FROM
	DimCustomer	

/* -------------------------------------------------------------------------------------------------*/