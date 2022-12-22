/* -------------------------------------------------------------------------------------------------
1 -										FACTSALES 
	a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
	(channelkey).
	b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
	total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).
	c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
	para o ano de 2007.
*/

SELECT									--  Registros
	TOP(5)*
FROM
	FactSales
SELECT									--  Registros
	TOP(5)*
FROM
	DimChannel


SELECT									-- 4 Registros
	ChannelKey AS 'Canal de Vendas',
	SUM(SalesQuantity) AS 'a) Total Vendido'
FROM
	FactSales
GROUP BY 
	channelKey


SELECT									-- 306 Registros
	StoreKey AS 'ID da Loja',
	SUM(SalesQuantity) AS 'b) Total Vendido',
	SUM(ReturnQuantity) AS 'b) Total Devolvido'
FROM
	FactSales
GROUP BY 
	StoreKey


SELECT								-- 4 Registros
	ChannelKey AS 'Canal de Venda',
	SUM(SalesAmount) AS 'c) Faturamento Total'
FROM
	FactSales
WHERE
	DateKey BETWEEN '20070101' AND '20071231'
GROUP BY
	channelKey
HAVING
	SUM(SalesAmount) >= 5000000
ORDER BY
	channelKey
/* -------------------------------------------------------------------------------------------------
										FACTSALES
2 - Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
	total vendido (SalesAmount) por produto (ProductKey).
	a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
	mostrar apenas os produtos que tiveram um resultado final de vendas maior do que $5.000.000.
	b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
	Desconsidere o filtro de $5.000.000 aplicado.
*/

SELECT									--  Registros
	TOP(5)*
FROM
	FactSales



SELECT									-- 824 Registros
	ProductKey AS 'ID do produto',
	SUM(SalesAmount) AS 'Valor Vendido'
FROM
	FactSales
GROUP BY
	ProductKey
HAVING
	SUM(SalesAmount) >= 5000000
ORDER BY
	SUM(SalesAmount) DESC


SELECT									-- 10 Registros
	TOP(10) ProductKey AS 'ID do produto',
	SUM(SalesAmount) AS 'Faturamento Total'
FROM
	FactSales
GROUP BY
	ProductKey
ORDER BY
	SUM(SalesAmount) DESC

/* -------------------------------------------------------------------------------------------------

3 -										FACTONLINESALES
	a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (CustomerKey)
	do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
	b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra
	quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/

SELECT									-- 5 Registros
	TOP(1000)*
FROM
	FactOnlineSales
WHERE
	SalesQuantity NOT LIKE '1' -- Checkint the SUM


SELECT									--  Registros
	TOP(1) CustomerKey AS 'ID do Cliente',
	COUNT(OnlineSalesKey) AS 'Total Comprado',
	COUNT(SalesQuantity) AS 'Total Comprado Check 1',
	SUM(SalesQuantity) AS 'Total Comprado Check 2'
FROM
	FactOnlineSales
GROUP BY 
	CustomerKey

SELECT									--  Registros
	TOP(3) ProductKey AS 'ID do Produto',
	SUM(SalesQuantity) AS 'Qtd. Compras'
FROM
	FactOnlineSales
WHERE 
	CustomerKey = 19037
GROUP BY 
	ProductKey
ORDER BY
	SUM(SalesQuantity) DESC

/* -------------------------------------------------------------------------------------------------

4 -										DIMPRODUCT
	a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
	b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
	c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
*/

SELECT									--  Registros
	TOP(5)*	
FROM
	DimProduct
	   
SELECT									--  Registros
	BrandName AS 'Marca',
	COUNT(DISTINCT ProductName) AS 'Qtde. Produtos'
FROM
	DimProduct
GROUP BY 
	BrandName	
ORDER BY
	BrandName

SELECT
	ClassName AS 'Categoria de Produto',
	AVG(UnitPrice) AS 'M�dia de Pre�os da Categoria'
FROM
	DimProduct
GROUP BY
	ClassName
ORDER BY
	ClassName

SELECT
	ColorName AS 'Cor',
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
GROUP BY
	ColorName
ORDER BY
	'Peso Total' DESC
/* -------------------------------------------------------------------------------------------------
										DIMPRODUCT
5 - Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName). A tabela final
	deve considerar apenas a marca �Contoso� e ter os seus valores classificados em ordem decrescente.
*/

SELECT									--  Registros
	TOP(10)*
FROM
	DimProduct

SELECT
	StockTypeName AS 'Tipo de Estocagem',
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY
	StockTypeName
ORDER BY
	'Peso Total' DESC
/* -------------------------------------------------------------------------------------------------
										DIM PRODUCT
6 - Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as
16 op��es de cores?
*/

SELECT									--  Registros
	*	
FROM
	DimProduct



SELECT									--  Registros
	BrandName AS 'Marca', 
	COUNT(DISTINCT ColorName) AS 'Cores'
FROM
	DimProduct
GROUP BY 
	BrandName
ORDER BY
	'Cores' DESC 


SELECT									--  Registros
	DISTINCT ColorName AS 'Cores'
FROM
	DimProduct
WHERE
	BrandName = 'Adventure Works'
ORDER BY
	ColorName
/* -------------------------------------------------------------------------------------------------
										DIMCUSTOMER
7 - Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia salarial
	de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus conhecimentos em SQL.
*/

SELECT									--  Registros
	TOP(5)*
FROM
	DimCustomer



SELECT									--  Registros
	Gender AS 'Sexo',
	COUNT(DISTINCT CustomerKey) AS 'Qtd. Total de Clientes',
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM
	DimCustomer
WHERE
	Gender IS NOT NULL
GROUP BY 
	Gender
ORDER BY
	AVG(YearlyIncome) DESC

/* -------------------------------------------------------------------------------------------------
										DIMCUSTOMER
8 - Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de acordo com
	o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer esse agrupamento.
*/

SELECT									--  Registros
	TOP(5)*
FROM
	DimCustomer



SELECT									--  Registros
	Education AS 'N�vel Escolar',
	COUNT(DISTINCT CustomerKey) AS 'Qtd. Total',
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM
	DimCustomer
WHERE Education IS NOT NULL
GROUP BY 
	Education
ORDER BY
	COUNT(DISTINCT CustomerKey) DESC

/* -------------------------------------------------------------------------------------------------
										DIMEMPLOYEE
9 - Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o Departamento
	(DepartmentName). Importante: Voc� dever� considerar apenas os funcion�rios ativos.
*/

SELECT									--  Registros
	TOP (100)*
FROM
	DimEmployee



SELECT									--  Registros
	DepartmentName AS 'Departamento',
	COUNT(EmployeeKey) AS 'Qtd. Funcion�rios'
FROM
	DimEmployee
WHERE
	EndDate IS NULL
GROUP BY 
	DepartmentName
ORDER BY
	COUNT(EmployeeKey) DESC

/* -------------------------------------------------------------------------------------------------
										DIMEMPLOYEE
10 - Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc� deve
	considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering e Finance,
	para os funcion�rios contratados entre os anos de 1999 e 2000.
*/

SELECT									--  Registros
	TOP(100)*
FROM
	DimEmployee



SELECT									--  Registros
	Title AS 'Cargo',
	SUM(VacationHours) AS 'Horas de f�rias'
FROM
	DimEmployee	
WHERE
	Gender = 'F' AND 
	DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND 
	HireDate BETWEEN '1999-01-01' AND '2000-12-31'
GROUP BY 
	Title
ORDER BY
	SUM(VacationHours) DESC


/* -------------------------------------------------------------------------------------------------*/