-- SQL HASHTAG MODULO 1

-- EXERC�CIOS
/*
1 - Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
		
		O que voc� precisar� fazer � confirmar se:
*/		
--		a) Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar
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
		
--		b) At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle. 
--			Verifique se esse n�mero aumentou ou reduziu

SELECT TOP (10) PERCENT
	*
FROM
	DimCustomer

SELECT									-- b) 18.869 registros, N�MERO MENOR QUE NO M�S ANTERIOR
	DISTINCT
	CustomerKey AS ID,
	FirstName AS Nome,
	LastName AS Sobrenome
FROM
	DimCustomer
	   
/*
2 - Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
	descontos especiais para os clientes no dia de seus anivers�rios. Para isso, voc� vai precisar 
	listar todos os clientes e as suas respectivas datas de nascimento, al�m de um contato.

		a) Selecione as colunas: CustomerKey, FirstName,EmailAdress, BirthDate da tabela DimCustomer.
		b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/
SELECT									--18.869 registros
	CustomerKey AS 'ID do Cliente',
	FirstName AS Nome,
	EmailAddress AS 'E-mail',
	BirthDate AS 'Anivers�rio'
FROM
	DimCustomer

/*
3 - A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e pretende fazer uma a��o de
	premia��o para os clientes. A empresa quer presentear os primeiros clientes desde a inaugura��o.
	Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que fazer o seguinte:

		a) A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com vale compras
			de R$ 10.000,00. Utilize o comando em SQL para retornar uma tabela com os priemiros
			100 clientes da tabeka dim.Customer (selecione todas as colunas).*/

SELECT 									-- 100 Registros
	TOP (100) *
FROM
	DimCustomer

/*		b) A Contoso decidiu presentear os primeiros 20 % de clientes da hist�ria com um vale compras
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

/*		c) Adapte o c�digo do item a para retornar apenas as 100 primeiras linhas, mas apenas as 
			colunas FirstName, EmailAddress, BirthDate.
		d) Renomeie as colunas anteriores para os nomes em portugu�s.*/

SELECT TOP (100)						-- 100 Registros
	FirstName AS Nome,
	EmailAddress AS 'E-mail',
	BirthDate AS Anivers�rio
FROM
	DimCustomer

/*
4 - A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque.
	Voc� � da �rea de Compras e precisa descobrir quem s�o esses fornecedeores.
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
5 - O seu trabalho de investiga��o n�o para. Voc� perecisa descobrir se existe algum produto
	registrado na base de produtos que ainda n�o tenha sido vendido. Tente chegar nessa informa��o.
	Obs.: Caso n�o tenha algum produto que ainda n�o tenha sido vendido, voc� n�o precisar� descobrir
	qual �, � suficiente saber se teve ou n�o algum produto que ainda n�o foi vendido.
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

SELECT									-- 1 Registro -- MEU RESULTADO N�O FUNCIONOU E VOU TER QUE REFAZER QUANDO APRENDER
	DISTINCT A.ProductKey
FROM
	FactSales AS A,
	DimProduct AS B
WHERE B.ProductKey IS NULL