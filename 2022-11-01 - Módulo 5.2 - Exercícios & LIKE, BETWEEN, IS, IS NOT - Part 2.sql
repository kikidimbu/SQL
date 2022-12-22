/* 
EXERCÍCIOS COM OPERADORES AND, OR e NOT
*/

-- 1 - Selecione todas as linhas da tabela DimEmployeee de funcionários do sexo feminino E do departamento de Finanças.

SELECT
	TOP(100) *
FROM
	DimEmployee

SELECT											-- 5 Registros
	*
FROM
	DimEmployee
WHERE
	Gender = 'F' AND DepartmentName = 'Finance'

-- 2 - Selecione todas as linhas da tabela dimProduct de produtos da marca Contoso E da cor Vermelha E que tenham um UnitPrice maior ou igual a $100.

SELECT
	TOP (100) *
FROM
	DimProduct

SELECT													-- 25 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' AND  ColorName = 'Red' AND UnitPrice >= 100

-- 3 - Selecione todas as linhas da tabela de produtos com produtos da marca Litware OU da marca Fabrikam OU da cor preta

SELECT
	TOP (100) *
FROM
	DimProduct

SELECT													-- 1.037 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'

-- 4 - Selecione todas as linhas da tabela DimSalesTerritory onde o continente é a Europa mas o país NÃO É igual à Itália.

SELECT
	TOP (100) *
FROM
	DimSalesTerritory

SELECT													-- 47 Registros
	*
FROM
	DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'

/* ------------------------------------------------------------------------------------------------------- */

-- 1 - Selecione todas as linhas da tabela dimProduct onde a cor do Produto pode ser igual a Preto OU Vermelho, MAS a marca deve ser obrigatoriamente igual a Fabrikan.

SELECT
	TOP(100)*
FROM
	DimProduct

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam' AND ColorName = 'Black' OR BrandName = 'Fabrikam' AND ColorName = 'Red'

-- OU

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam' AND (ColorName = 'Black' OR ColorName = 'Red')

/* ------------------------------------------------------------------------------------------------------- */

SELECT
	TOP (100) *
FROM
	DimProduct

SELECT														--1.823 Registros
	*
FROM
	DimProduct
WHERE
	ColorName IN ('Blue', 'Black', 'Silver', 'White', 'Red')

SELECT
	TOP (100) *
FROM
	DimEmployee

SELECT														-- 192 Registros
	*
FROM
	DimEmployee
WHERE
	DepartmentName IN ('Production', 'Marketing', 'Engineering')
ORDER BY
	DepartmentName

/* ------------------------------------------------------------------------------------------------------- */

SELECT
	TOP(100)*
FROM
	DimProduct


SELECT												-- 0 Registros
	*
FROM
	DimProduct
WHERE
	ProductName = 'MP3 Player'

SELECT												-- 31 Registros
	*
FROM
	DimProduct
WHERE
	ProductName LIKE '%MP3 Player%'

SELECT												-- 92 Registros
	*
FROM
	DimProduct
WHERE
	ProductDescription LIKE '%Type%'

SELECT												-- 24 Registros
	*
FROM
	DimProduct
WHERE
	ProductDescription LIKE 'Type%'
	
SELECT												-- 16 Registros
	*
FROM
	DimProduct
WHERE
	ProductDescription LIKE '%WMA'


SELECT												--118 Registros
	DISTINCT Manufacturer,
	ProductName
FROM
	DimProduct
WHERE
	ProductName LIKE '%Lamp%'
ORDER BY Manufacturer

/* ------------------------------------------------------------------------------------------------------- */


SELECT												-- 237 Registros
	*
FROM
	DimProduct
WHERE
	UnitPrice BETWEEN 50 AND 100


SELECT												-- 2.280 Registros
	*
FROM
	DimProduct
WHERE
	UnitPrice NOT BETWEEN 50 AND 100

SELECT												-- 44 Registros
	*
FROM
	DimEmployee
WHERE
	HireDate BETWEEN '2000-01-01' AND '2000-12-31'

/* ------------------------------------------------------------------------------------------------------- */

SELECT												-- 293 Registros
	*
FROM
	DimEmployee

SELECT												-- 14 Registros
	*
FROM
	DimEmployee
WHERE
	MiddleName IS NOT NULL

SELECT												-- 279 Registros
	*
FROM
	DimEmployee
WHERE
	MiddleName IS NULL

SELECT												-- 18.869 Registros
	*
FROM
	DimCustomer



SELECT												-- 2 Registros
	DISTINCT CustomerType
FROM
	DimCustomer



SELECT												-- 385 Registros
	*
FROM
	DimCustomer
WHERE
	CompanyName IS NOT NULL
ORDER BY CompanyName


SELECT												-- 385 Registros
	DISTINCT CompanyName
FROM
	DimCustomer
WHERE
	CustomerType = 'Company'
ORDER BY CompanyName



SELECT												-- 18.484 Registros
	*
FROM
	DimCustomer
WHERE
	CompanyName IS NULL