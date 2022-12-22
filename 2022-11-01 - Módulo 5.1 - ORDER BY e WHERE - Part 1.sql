/*
HASHTG
SQL 
MÓDULO 5

Order by
Where
Where ... Like (para textos)
Where ... Or / And
Where ... In
Where ... (not) Between
Where ... is (not) full
*/

/* -------------------------------------------------------------------------------------------------------------------------- */

SELECT
	TOP (100) *
FROM
	DimStore
ORDER BY EmployeeCount ASC -- Se não mencionar, ele considera ASC

SELECT
	TOP (100) *
FROM
	DimStore
ORDER BY EmployeeCount DESC

--

SELECT
	TOP (10) ProductName, 
	UnitCost,
	Weight
FROM
	DimProduct
ORDER BY UnitCost DESC, Weight DESC

SELECT									-- 2.517 Produtos
	*
FROM
	DimProduct

/* -------------------------------------------------------------------------------------------------------------------------- */

-- Quantos produtos tem preço unitário maior que $ 1.000?
SELECT
	TOP (10) UnitPrice
FROM
	DimProduct
ORDER BY UnitPrice DESC

--

SELECT									-- 158 Registros
	ProductName AS Produto,
	UnitPrice AS 'Preço Unitário'
FROM
	DimProduct
WHERE UnitPrice >=1000

SELECT									-- 50 Registros
	ProductName AS Produto,
	UnitPrice AS 'Preço Unitário'
FROM
	DimProduct
WHERE UnitPrice >=2000

SELECT									-- 14 Registros
	ProductName AS Produto,
	UnitPrice AS 'Preço Unitário'
FROM
	DimProduct
WHERE UnitPrice >=3000

/* -------------------------------------------------------------------------------------------------------------------------- */

SELECT									-- 11 Registros
	DISTINCT BrandName
FROM
	DimProduct

SELECT									-- 267 Registros
	*
FROM
	DimProduct
WHERE BrandName = 'Fabrikam'

SELECT									-- 602 Registros
	*
FROM
	DimProduct
WHERE ColorName = 'Black'
 
/* -------------------------------------------------------------------------------------------------------------------------- */
-- WHERE COM DATAS

-- Quantos clientes nasceram após o dia 31/12/1970

SELECT									-- 18.869 Registros
	* 
FROM
	DimCustomer

SELECT									-- 4.474 Registros
	* 
FROM
	DimCustomer
WHERE BirthDate >= '1970-12-31'
ORDER BY BirthDate DESC

/* -------------------------------------------------------------------------------------------------------------------------- */

-- WHERE COM OPRADORES LÓGIDOS (AND, OR E NOT)

/*
And = mostra as linhas da tabela se todas as condições forem atendidas;
Or = mostra as linhas da tabela se alguma das condições for verdadeira;
Not = mostra os registros da tabela onde a negativa da condição construída.
*/

SELECT									--50 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam' AND ColorName = 'Black'


SELECT									--819 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Fabrikam' OR ColorName = 'Black'

SELECT									--169 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' AND ColorName = 'White'

SELECT									--1.046 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' OR ColorName = 'White'

SELECT									--710 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' OR BrandName = 'Fabrikan'

SELECT									--1.107 Registros
	*
FROM
	DimProduct
WHERE
	ColorName = 'White' OR ColorName = 'Black'

SELECT									--974 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' OR BrandName = 'Fabrikan' OR BrandName = 'Litware'

--

SELECT									--283 Registros
	*
FROM
	DimEmployee
WHERE NOT DepartmentName = 'Marketing'

