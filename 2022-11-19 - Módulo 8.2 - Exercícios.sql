-- VERIFICANDO A QUANTIDADE DE REGISTROS NAS TABELAS

SELECT 
	FirstName,
	LastName
FROM 
	DimCustomer

SELECT									--  Registros
	COUNT(DISTINCT SalesKey) AS 'Qtd. Registros'
FROM
	FactSales

SELECT									--  Registros
	COUNT(DISTINCT OnlineSalesKey) AS 'Qtd. Registros'
FROM
	FactOnlineSales


/* -------------------------------------------------------------------------------------------------
Os Joins têm como principal objetivo deixar as tabelas mais informativas, permitindo buscar
dados de uma tabela para outra, de acordo com uma coluna em comum que permita essa
relação.
Dito isso, faça os seguintes exercícios:

1 - Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct.
*/

SELECT									--  Registros
	TOP(5)*
FROM
	DimProduct

SELECT									--  Registros
	*
FROM
	DimProductSubcategory


SELECT									--  Registros
	ProductKey AS 'Id do Produto',
	ProductName AS 'Nome do Produto',
	ProductSubcategoryName AS 'Subcategoria',
	BrandName
FROM
	DimProduct
INNER JOIN
	DimProductSubcategory
		ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
ORDER BY
	BrandName

/* -------------------------------------------------------------------------------------------------

2 - Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
DimProductCategory. Utilize essa coluna para complementar informações na tabela
DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
*/

SELECT									--  Registros
	*
FROM
	DimProductCategory

SELECT									--  Registros
	*
FROM
	DimProductSubcategory


SELECT									--  Registros
	ProductSubcategoryName,
	ProductCategoryName
FROM
	DimProductCategory
LEFT JOIN DimProductSubcategory
		ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey

	-- INNER = 44 registros, LEFT = 44 registros, RIGHT = 44 registros - não há dados nulos na correlação das duas tabelas 

/* -------------------------------------------------------------------------------------------------

3 - Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados
(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
JOIN neste exercício.
*/

SELECT									--  Registros
	*
FROM
	DimStore

SELECT
	*
FROM
	DimGeography

SELECT
	StoreKey,
	StoreName,
	EmployeeCount,
	ContinentName,
	RegionCountryName
FROM
	DimStore
LEFT JOIN DimGeography
	ON 	DimStore.GeographyKey = DimGeography.GeographyKey
WHERE
	EmployeeCount IS NOT NULL -- 306 registros sem este filtro, 305 com
ORDER BY
	ContinentName

/* -------------------------------------------------------------------------------------------------

4 - Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize
o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
*/

SELECT									--  Registros
	*
FROM
	DimProduct

SELECT
	*
FROM
	DimProductCategory

SELECT
	*
FROM
	DimProductSubcategory



SELECT									--  Registros
	ProductName,
	BrandName,
	ProductCategoryDescription,
	ClassName,
	ColorName
FROM
	DimProduct
LEFT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	LEFT JOIN DimProductCategory
		ON 	DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

/* -------------------------------------------------------------------------------------------------

5 - A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha
representa um montante destinado a uma determinada AccountKey.
a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount
*/
SELECT									--  Registros
	COUNT(DISTINCT StrategyPlanKey) AS 'Qtd. Registros'
FROM
	FactStrategyPlan

SELECT									--  Registros
	TOP (100) *
FROM
	FactStrategyPlan

SELECT									--  Registros
	TOP (100) *
FROM
	DimAccount

SELECT
	StrategyPlanKey, 
	DateKey, 
	AccountName, 
	Amount
FROM
	FactStrategyPlan INNER JOIN DimAccount
	ON FactStrategyPlan.AccountKey = DimAccount.AccountKey

SELECT									--  Registros
	DISTINCT AccountName AS 'Conta',
	SUM (Amount) AS 'Orçamento planejado'
FROM
	FactStrategyPlan
LEFT JOIN DimAccount
	ON FactStrategyPlan.AccountKey = DimAccount.AccountKey
WHERE
	AccountType = 'Expense'
GROUP BY
	AccountName
ORDER BY
	AccountName
/* -------------------------------------------------------------------------------------------------

6 - Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que
identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna
possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.

Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey
da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount
*/
SELECT									--  Registros
	TOP (100) *
FROM
	FactStrategyPlan

SELECT									--  Registros
	TOP (100) *
FROM
	DimScenario

SELECT STRATEGYPLANKEY FROM FactStrategyPlan

SELECT									--  Registros
	StrategyPlanKey AS 'Código de Estratégia',
	DateKey AS 'Data',
	ScenarioName AS 'Centro de Custo',
	SUM(Amount) AS 'Orçamento'
FROM
	FactStrategyPlan
LEFT JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
WHERE
	ScenarioName = 'Budget'
GROUP BY
	StrategyPlanKey, DateKey, ScenarioName
ORDER BY
	StrategyPlanKey

/* -------------------------------------------------------------------------------------------------

7 - Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que
subcategorias são essas.
*/

SELECT									--  Registros
	*
FROM
	DimSubcategoria

SELECT
	*
FROM
	DimProdutos


SELECT									--  Registros
	nome_subcategoria AS 'Subcategoria',
	nome_produto AS 'Produto'
FROM
	DimSubcategoria
LEFT JOIN DimProdutos
	ON DimSubcategoria.id_subcategoria = DimProdutos.id_subcategoria
WHERE
	nome_produto IS NULL

SELECT									--  Registros
	ProductSubcategoryName AS 'Subcategoria',
	ProductName AS 'Produto'	
FROM
	DimProduct
RIGHT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE
	ProductName IS NULL

/* -------------------------------------------------------------------------------------------------

8 - A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para as marcas Contoso,
Fabrikam e Litware. Crie um código SQL para chegar no mesmo resultado.

		BrandName			ChannelName
		Contoso				Catalog
		Contoso				Online
		Contoso				Reeseller
		Contoso				Store
		Fabrikam			Catalog
		Fabrikam			Online
		Fabrikam			Reeseler
		Fabrikam			Store
		Litware				Catalog
		Litware				Online
		Litware				Reeseler
		Litware				Store
*/
SELECT
	*
FROM
	DimStore

SELECT									--  Registros
	*	
FROM
	DimChannel

SELECT
	TOP(5)*
FROM
	FactSales
	
SELECT
	*
FROM
	DimProduct

SELECT
	BrandName AS 'Marca',
	StoreType AS 'Tipo de Loja'	
FROM
	DimStore
CROSS JOIN
	FactSales
	ON DimStore.StoreKey = FactSales.ChannelKey
	INNER JOIN
		DimChannel
		ON DimChannel.channelKey = FactSales.ChannelKey
		INNER JOIN
			DimProduct
			ON DimProduct.ProductKey = FactSales.ProductKey
WHERE
	BrandName IN ('Contoso', 'Litware', 'Fabrikam')
ORDER BY
	BrandName
	
	
	-- me confundí na cachola
	--TEACHER' SOLUTION


	SELECT
		DISTINCT BrandName,
		ChannelName
	FROM
		DimProduct CROSS JOIN DimChannel
	WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')


/* -------------------------------------------------------------------------------------------------

9 - Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion.
Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse
relacionamento.
Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount
A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com
desconto (PromotionName <> ‘No Discount’). Além disso, você deverá ordenar essa tabela de
acordo com a coluna DateKey, em ordem crescente.
*/

SELECT 
	* 
FROM 
	DimPromotion

SELECT									--  Registros
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
FROM
	FactOnlineSales 
	INNER JOIN
	DimPromotion
	ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE PromotionName NOT LIKE 'No Discount'
ORDER BY DateKey ASC

/* -------------------------------------------------------------------------------------------------

10 - A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel,
DimStore e DimProduct.
Recrie esta consulta e classifique em ordem crescente de acordo com SalesAmount.

SalesKey		ChannelName		StoreName					ProductName								SalesAmmount
145071			Catalog			Contoso Catalog Store		NT Washer and Dryer 27in L2700 Silver	408016.02
...

*/
SELECT	TOP (100)							--  Registros
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
FROM
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
ORDER BY SalesAmount DESC			
				
/* -------------------------------------------------------------------------------------------------

11 - 
*/

SELECT									--  Registros
	
FROM




SELECT									--  Registros
	
FROM
	
WHERE

GROUP BY

HAVING

ORDER BY 


/* -------------------------------------------------------------------------------------------------

12 - 
*/

SELECT									--  Registros
	
FROM




SELECT									--  Registros
	
FROM
	
WHERE

GROUP BY

HAVING

ORDER BY 


/* -------------------------------------------------------------------------------------------------