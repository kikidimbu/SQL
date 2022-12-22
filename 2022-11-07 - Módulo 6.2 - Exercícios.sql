/* -------------------------------------------------------------------------------------------------
1 - O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade Devolvida 
	para o canal de venda mais importante da empresa: Store.
	Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
	an�lise considerando a tabela FactSales.
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

2 - Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse
resultado.
*/

SELECT												-- 100 Registros
	TOP(100)*
FROM
	DimEmployee

SELECT												-- 4 Registros
	DISTINCT Title AS 'Fun��o',
	AVG (BaseRate) AS 'M�dia Salarial'
FROM
	DimEmployee
GROUP BY
	Title

/* ------------------ considerar esta resposta --------------------- */

SELECT												-- 100 Registros
	TOP(5)*
FROM
	DimCustomer

SELECT												-- 1 Registro gerado com 74.184,7826 de m�dia
	DISTINCT Occupation AS 'Fun��o',
	AVG (YearlyIncome) AS 'M�dia Salarial'
FROM
	DimCustomer
WHERE
	Occupation = 'Professional'
GROUP BY
	Occupation
/* -------------------------------------------------------------------------------------------------

3 - Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na
	empresa. O seu gerente te pediu os seguintes n�meros e informa��es:

		a) Quantos funcion�rios tem a loja com mais funcion�rios?
		b) Qual � o nome dessa loja?
		c) Quantos funcion�rios tem a loja com menos funcion�rios?
		d) Qual � o nome dessa loja?
*/

SELECT												-- 100 Registros
	TOP (5)*
FROM
	DimStore

SELECT												-- 1 Registro gerado com 325 m�ximo de funcion�rios
	TOP (1) StoreName AS 'Nome da Loja',
	MAX (EmployeeCount) AS 'M�ximo de Func.'
FROM
	DimStore
GROUP BY 
	 EmployeeCount, StoreName
ORDER BY 
	EmployeeCount DESC

SELECT												-- 1 Registros gerado com 7 m�nimo de funcion�rios
	TOP (1) StoreName AS 'Nome da Loja',
	MIN (EmployeeCount) AS 'M�nimo de Func.'
FROM
	DimStore
WHERE
	EmployeeCount IS NOT NULL
GROUP BY 
	EmployeeCount, StoreName
ORDER BY 
	EmployeeCount ASC

/* -------------------------------------------------------------------------------------------------

4 - A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade
	total de funcion�rios do sexo Masculino e do sexo Feminino.
		a) Descubra essas duas informa��es utilizando o SQL.
		b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as
	seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.
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

5 - Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes
	informa��es:
		a) Quantidade distinta de cores de produtos.
		b) Quantidade distinta de marcas
		c) Quantidade distinta de classes de produto
	Para simplificar, voc� pode fazer isso em uma mesma consulta.
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