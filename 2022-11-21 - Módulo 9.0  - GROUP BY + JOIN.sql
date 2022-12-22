/* -------------------------------------------------------------------------------------------------*/
--GROUP BY E JOINS

/* -------------------------------------------------------------------------------------------------
R E V I S � O

Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados.
Voc� pode utilizar o INNER JOIN para resolver todas as quest�es.

FACT SALES
1. 
	a) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
	de vendas (ChannelName). Voc� deve ordenar a tabela final de acordo com SalesQuantity,
	em ordem decrescente.

	b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
	quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
	(StoreName).

	c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s
	(CalendarMonthLabel) e ano (CalendarYear).
*/
SELECT TOP(100)* FROM FactSales
--SELECT * FROM DimChannel
--SELECT * FROM DimStore
SELECT * FROM DimDate

SELECT
	ChannelName AS 'Canal',
	SUM (SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SalesQuantity) DESC
--
SELECT
	StoreName AS 'Loja',
	SUM (SalesQuantity) AS 'Qtd. Vendida',
	SUM (ReturnQuantity) AS 'Qtd. Devolvida',
	SUM (SalesQuantity) - SUM (ReturnQuantity) AS 'Diferen�a'
FROM
	FactSales
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName
ORDER BY 'Diferen�a' ASC
--
SELECT
	CalendarYear AS 'Ano',
	CalendarMonthLabel AS 'M�s',
	SUM (SalesAmount) AS 'Total Vendida'
FROM
	FactSales
INNER JOIN DimDate
ON FactSales.DateKey = DimDate.Datekey
GROUP BY CalendarYear, CalendarMonthLabel, CalendarMonth
ORDER BY CalendarMonth
/*-------------------------------------------------------------------------------------------------
2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto.
	a) Descubra qual � a cor de produto que mais � vendida (de acordo com SalesQuantity).
	b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000.
*/
SELECT TOP (100) * FROM FactSales
SELECT * FROM DimProduct

SELECT
	ColorName AS 'Cor',
	SUM(SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactSales
INNER JOIN DimProduct
ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
HAVING SUM(SalesQuantity) >=3000000
ORDER BY SUM(SalesQuantity) DESC

/* -------------------------------------------------------------------------------------------------
3. Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto
(ProductCategoryName). Obs: Voc� precisar� fazer mais de 1 INNER JOIN, dado que a rela��o
entre FactSales e DimProductCategory n�o � direta.
						Categoria						Qtd.Venda
						Games and Toys					6040572
						Audio							1353298
						Cel Phones						13459636
						Music, Movies and Audio Books	1523415
						TV and Video					3449196
						Cameras and Camcorders			6551189
						Computers						10563676
						Home Appliances					10379472
*/
SELECT TOP(100)* FROM FactSales
SELECT * FROM DimProduct
SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory

SELECT 
	ProductCategoryName AS 'Categoria',
	SUM(SalesQuantity) AS 'Quantidade'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
	INNER JOIN DimProductSubcategory
		ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY ProductCategoryName
ORDER BY SUM(SalesQuantity) DESC
/* -------------------------------------------------------------------------------------------------
FACTONLINESALES
4. 
	a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o nome completo
	do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
	b) Feito isso, fa�a um agrupamento de produtos e descubra quais foram os top 10 produtos mais
	comprados pelo cliente da letra a, considerando o nome do produto.
*/
SELECT TOP(100)* FROM FactOnlineSales
SELECT TOP(100)* FROM DimCustomer

SELECT
	TOP (10)
	FactOnlineSales.CustomerKey,
	FirstName,
	LastName AS 'Cliente',
	COUNT(onlinesalesKey) AS 'Qtd. Compras'
FROM 
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY  FactOnlineSales.CustomerKey,FirstName, LastName
ORDER BY COUNT(onlinesalesKey) DESC

SELECT
	TOP(10)
	ProductName AS 'Produto',
	SUM(SalesQuantity) AS 'Qtd. Vendida'
FROM 
	FactOnlineSales
INNER JOIN DimProduct
	ON FactOnlineSales.ProductKey = DimProduct.ProductKey
GROUP BY ProductName
ORDER BY SUM(SalesQuantity) DESC
/* -------------------------------------------------------------------------------------------------
5. Fa�a um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o
sexo dos clientes.
*/
SELECT
	Gender AS 'Sexo',
	SUM(SalesQuantity) 'Qtd. Total'
FROM
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactONlineSales.CustomerKey = DimCustomer.customerkey
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY SUM(SalesQuantity)
/* -------------------------------------------------------------------------------------------------
FACTEXCHANGERATE
6. Fa�a uma tabela resumo mostrando a taxa de c�mbio m�dia de acordo com cada
CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100
*/
SELECT
	TOP(100) *
FROM
	FactExchangeRate

SELECT
	TOP (100) *
FROM
	DimCurrency

SELECT
	CurrencyDescription AS 'Descri��o',
	CurrencyName AS	'Moeda',
	AVG(AverageRate) AS 'Tx Cambio M�dia'
FROM
	FactExchangeRate
INNER JOIN
	DimCurrency
ON FactExchangeRate.CurrencyKey = DimCurrency .CurrencyKey
GROUP BY CurrencyName, CurrencyDescription
HAVING AVG(AverageRate) BETWEEN 10 AND 100
ORDER BY CurrencyDescription
/* -------------------------------------------------------------------------------------------------
FACTSTRATEGYPLAN
7. Descubra o valor total na tabela FactStrategyPlan destinado aos cen�rios: Actual e Budget.
*/
SELECT
	TOP(100)*
FROM
	FactStrategyPlan
SELECT
	TOP(100)*
FROM
	DimScenario
SELECT
	ScenarioName AS 'Cenario',
	SUM(Amount) AS 'Total'
FROM
	FactStrategyPlan
	INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
GROUP BY ScenarioName
HAVING ScenarioName IN ('Actual', 'Budget')
ORDER BY ScenarioName
/* -------------------------------------------------------------------------------------------------
8. Fa�a uma tabela resumo mostrando o resultado do planejamento estrat�gico por ano.
*/
SELECT
	TOP (100)*
FROM
	DimDate

SELECT
	TOP(100)*
FROM
	FactStrategyPlan

SELECT
	CalendarYear AS 'Ano:',
	SUM(Amount) AS 'Or�amento planejado:'
FROM
	FactStrategyPlan
INNER JOIN DimDate
	ON FactStrategyPlan.Datekey = DimDate.Datekey
GROUP BY CalendarYear
ORDER BY CalendarYear
/* -------------------------------------------------------------------------------------------------
DIMPRODUCT/DIMPRODUCTSUBCATEGORY
9. Fa�a um agrupamento de quantidade de produtos por ProductSubcategoryName. Leve em
considera��o em sua an�lise apenas a marca Contoso e a cor Silver
*/
SELECT
	TOP (100) *
FROM
	DimProduct

SELECT
	TOP (100) *
FROM
	DimProductSubcategory

SELECT
	ProductSubcategoryName AS 'Categoria:',
	COUNT(*) AS 'Qtd. Produtos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE BrandName = 'Contoso' AND ColorName = 'Silver'
GROUP BY ProductSubcategoryName
ORDER BY COUNT(*) DESC
/* -------------------------------------------------------------------------------------------------
10. Fa�a um agrupamento duplo de quantidade de produtos por BrandName e
ProductSubcategoryName. A tabela final dever� ser ordenada de acordo com a coluna
BrandName.
*/
SELECT
	DISTINCT BrandName,
	ProductSubcategoryName,
	COUNT(*) as 'Qtd. Produtos'
FROM
	DimProduct
CROSS JOIN DimProductSubcategory
GROUP BY BrandName, ProductSubcategoryName
ORDER BY BrandName, ProductSubcategoryName, COUNT(*)
/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/