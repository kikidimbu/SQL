-- SQL HASHTAG MODULO 1

-- EXERCÍCIOS
/*
1 - Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
		
		O que você precisará fazer é confirmar se:
*/		
--		a) Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar
			ao seu gestor para saber se existe alguma defasagem no controle de produtos.

SELECT TOP (100)						-- 100 Registros
	*
FROM
	DimProduct

SELECT DISTINCT							-- 2.517 registros - TOTAL DE REGISTROS
	ProductLabel AS Etiqueta,
	ProductName AS Nome,
	ColorName AS Cor
FROM
	DimProduct
		
--		b) Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle. 
--			Verifique se esse número aumentou ou reduziu

SELECT TOP (10) PERCENT
	*
FROM
	DimCustomer

SELECT									-- b) 18.869 registros, NÚMERO MENOR QUE NO MÊS ANTERIOR
	DISTINCT
	CustomerKey AS ID,
	FirstName AS Nome,
	LastName AS Sobrenome
FROM
	DimCustomer
	   
/*
2 - Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
	descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar 
	listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.

		a) Selecione as colunas: CustomerKey, FirstName,EmailAdress, BirthDate da tabela DimCustomer.
		b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/
SELECT									--18.869 registros
	CustomerKey AS 'ID do Cliente',
	FirstName AS Nome,
	EmailAddress AS 'E-mail',
	BirthDate AS 'Aniversário'
FROM
	DimCustomer

/*
3 - A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma ação de
	premiação para os clientes. A empresa quer presentear os primeiros clientes desde a inauguração.
	Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:

		a) A Contoso decidiu presentear os primeiros 100 clientes da história com vale compras
			de R$ 10.000,00. Utilize o comando em SQL para retornar uma tabela com os priemiros
			100 clientes da tabeka dim.Customer (selecione todas as colunas).*/

SELECT 									-- 100 Registros
	TOP (100) *
FROM
	DimCustomer

/*		b) A Contoso decidiu presentear os primeiros 20 % de clientes da história com um vale compras
			de R$ 2.000,00. Utilize um comando em SQL para retornar 10% das linhas da sua tabela 
			dimCustomer (selecione todas as colunas).*/

SELECT									-- 3.774 Registros
	TOP (20) PERCENT *
FROM
	DimCustomer

SELECT									-- 1.887 Registros
	TOP (10) PERCENT
	*
FROM
	DimCustomer

/*		c) Adapte o código do item a para retornar apenas as 100 primeiras linhas, mas apenas as 
			colunas FirstName, EmailAddress, BirthDate.
		d) Renomeie as colunas anteriores para os nomes em português.*/

SELECT TOP (100)						-- 100 Registros
	FirstName AS Nome,
	EmailAddress AS 'E-mail',
	BirthDate AS Aniversário
FROM
	DimCustomer

/*
4 - A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque.
	Você é da área de Compras e precisa descobrir quem são esses fornecedeores.
	Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tablea dimProduct
	e renomeie essa nova coluna da tabela.
*/
SELECT
	*
FROM
	DimProduct

SELECT									-- 11 Registros
	DISTINCT Manufacturer AS Produtor
FROM
	DimProduct

/*
5 - O seu trabalho de investigação não para. Você perecisa descobrir se existe algum produto
	registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa informação.
	Obs.: Caso não tenha algum produto que ainda não tenha sido vendido, você não precisará descobrir
	qual é, é suficiente saber se teve ou não algum produto que ainda não foi vendido.
*/
SELECT TOP (100)
	*
FROM
	FactSales

SELECT									-- 2.516 Registros
	DISTINCT ProductKey
FROM
	FactSales

SELECT									-- 2.517 Registros
	*
FROM
	DimProduct

SELECT									-- 1 Registro -- MEU RESULTADO NÃO FUNCIONOU E VOU TER QUE REFAZER QUANDO APRENDER
	DISTINCT A.ProductKey
FROM
	FactSales AS A,
	DimProduct AS B
WHERE B.ProductKey IS NULL