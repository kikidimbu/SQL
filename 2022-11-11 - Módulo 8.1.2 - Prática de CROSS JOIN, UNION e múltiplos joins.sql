CREATE TABLE DimMarcas(
	id_marca int,
	marca varchar(30))

INSERT INTO DimMarcas(id_marca, marca)
VALUES
	(1, 'Apple'),
	(2, 'Samsung'),
	(3, 'Motorola')

SELECT
	*
FROM
	DimMarcas

SELECT
	*
FROM
	DimSubcategoria
	
/* -------------------------------------------------------------------------------------------------*/
--CROSS JOIN -- entrega o produto cartesiano
SELECT
	marca,
	nome_subcategoria
FROM
	DimMarcas
	CROSS JOIN
	DimSubcategoria
	
/* -------------------------------------------------------------------------------------------------*/
--Múltiplos JOIN
SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryKey
FROM
	DimProduct

SELECT
	ProductSubcategoryKey,
	ProductSubcategoryName,
	ProductCategoryKey
FROM
	DimProductSubcategory

SELECT
	ProductCategoryKey,
	ProductCategoryName
FROM
	DimProductCategory



SELECT
	ProductKey,
	ProductName,
	--DimProduct.ProductSubcategoryKey,
	ProductCategoryName
FROM
	DimProduct
INNER JOIN
	DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey =
		DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductCategory.ProductCategoryKey =
				DimProductSubcategory.ProductCategoryKey
/* -------------------------------------------------------------------------------------------------*/
--UNION e UNION ALL
SELECT							-- INDIVIDUALMENTE 9.133 REGISTROS, TOTAL 18.484 SEM UNION
	*
FROM
	DimCustomer
WHERE
	Gender = 'F'
--UNION							-- AS DUAS TABELAS PRECISAM TER A MESMA ESTRUTURA PARA USAR UNION
SELECT							-- INDIVIDUALMENTE 9.351 REGISTROS, TOTAL 18.484
	*
FROM
	DimCustomer
WHERE
	Gender = 'M'

SELECT							-- TOTAL DE REGISTROS COM UNION: 18.450, pois UNION remove duplicatas
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE
	Gender = 'F'
UNION 							-- AS DUAS TABELAS PRECISAM TER A MESMA ESTRUTURA PARA USAR UNION
SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE
	Gender = 'M'

SELECT							-- TOTAL DE REGISTROS COM UNION: 18.484, pois UNION ALL não remove duplicatas
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE
	Gender = 'F'
UNION ALL							-- AS DUAS TABELAS PRECISAM TER A MESMA ESTRUTURA PARA USAR UNION
SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE
	Gender = 'M'
/* -------------------------------------------------------------------------------------------------*/
