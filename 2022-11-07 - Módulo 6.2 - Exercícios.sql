/* -------------------------------------------------------------------------------------------------
1 - O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade Devolvida 
	para o canal de venda mais importante da empresa: Store.
	Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
	análise considerando a tabela FactSales.
*/

SELECT												-- 100 Registros
	TOP (5) *
FROM
	FactSales

SELECT
	TOP(5)*
FROM
	DimStore


SELECT
	TOP(5)*
FROM
	DimChannel


SELECT												-- 1 Registros gerados (Qtd.V. 29.089.448, Qtd.D. 274.205) 
	SUM (SalesQuantity) AS 'Qtd. Vendida',
	SUM (ReturnQuantity) AS 'Qtd. Devolvida'
FROM
	FactSales
WHERE
	channelKey = 1
/* -------------------------------------------------------------------------------------------------

2 - Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado.
*/

SELECT												-- 100 Registros
	TOP(100)*
FROM
	DimEmployee

SELECT												-- 4 Registros
	DISTINCT Title AS 'Função',
	AVG (BaseRate) AS 'Média Salarial'
FROM
	DimEmployee
GROUP BY
	Title

/* ------------------ considerar esta resposta --------------------- */

SELECT												-- 100 Registros
	TOP(5)*
FROM
	DimCustomer

SELECT												-- 1 Registro gerado com 74.184,7826 de média
	DISTINCT Occupation AS 'Função',
	AVG (YearlyIncome) AS 'Média Salarial'
FROM
	DimCustomer
WHERE
	Occupation = 'Professional'
GROUP BY
	Occupation
/* -------------------------------------------------------------------------------------------------

3 - Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
	empresa. O seu gerente te pediu os seguintes números e informações:

		a) Quantos funcionários tem a loja com mais funcionários?
		b) Qual é o nome dessa loja?
		c) Quantos funcionários tem a loja com menos funcionários?
		d) Qual é o nome dessa loja?
*/

SELECT												-- 100 Registros
	TOP (5)*
FROM
	DimStore

SELECT												-- 1 Registro gerado com 325 máximo de funcionários
	TOP (1) StoreName AS 'Nome da Loja',
	MAX (EmployeeCount) AS 'Máximo de Func.'
FROM
	DimStore
GROUP BY 
	 EmployeeCount, StoreName
ORDER BY 
	EmployeeCount DESC

SELECT												-- 1 Registros gerado com 7 mínimo de funcionários
	TOP (1) StoreName AS 'Nome da Loja',
	MIN (EmployeeCount) AS 'Mínimo de Func.'
FROM
	DimStore
WHERE
	EmployeeCount IS NOT NULL
GROUP BY 
	EmployeeCount, StoreName
ORDER BY 
	EmployeeCount ASC

/* -------------------------------------------------------------------------------------------------

4 - A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade
	total de funcionários do sexo Masculino e do sexo Feminino.
		a) Descubra essas duas informações utilizando o SQL.
		b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as
	seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.
*/

SELECT												--  Registros
	TOP (5)*
FROM
	DimEmployee
	   
SELECT												-- 206 Registros
	COUNT(Gender) AS 'Homens'
FROM
	DimEmployee
WHERE
	Gender = 'M'
GROUP BY Gender

SELECT												-- 87 Registros
	COUNT(Gender) AS 'Mulheres'
FROM
	DimEmployee
WHERE
	Gender = 'F'
GROUP BY Gender

SELECT												-- 206 Registros
	TOP (1) FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	EmailAddress AS 'E-mail',
	HireDate AS 'Contratado em:'
FROM
	DimEmployee
WHERE
	Gender = 'M'
ORDER BY
	HireDate ASC

SELECT												-- 206 Registros
	TOP (1) FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	EmailAddress AS 'E-mail',
	HireDate AS 'Contratada em:'
FROM
	DimEmployee
WHERE
	Gender = 'F'
ORDER BY
	HireDate ASC
/* -------------------------------------------------------------------------------------------------

5 - Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes
	informações:
		a) Quantidade distinta de cores de produtos.
		b) Quantidade distinta de marcas
		c) Quantidade distinta de classes de produto
	Para simplificar, você pode fazer isso em uma mesma consulta.
*/

SELECT												--  Registros
	TOP (10)*
FROM
	DimProduct

SELECT												-- 1 Registros gerado com 16 cores, 11 marcas, 3 classes
	COUNT(DISTINCT ColorName) AS 'Cores',
	COUNT(DISTINCT BrandName) AS 'Marcas',
	COUNT(DISTINCT ClassName) AS 'Classes'
FROM
	DimProduct	
/* -------------------------------------------------------------------------------------------------*/