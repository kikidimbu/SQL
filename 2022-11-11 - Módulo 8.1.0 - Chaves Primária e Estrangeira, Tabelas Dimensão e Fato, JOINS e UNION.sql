/* -------------------------------------------------------------------------------------------------
JOINS NO SQL

Porque precisamos do JOIN?
Chave prim�ria vs. Chave Estrangeira
Tabela Fato vs. Tabela Dimens�o
Tipos de JOIN
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN
CROSS JOIN
M�ltiplos JOIN
UNION e UNION ALL

/* -------------------------------------------------------------------------------------------------*/
Porque precisamos do JOIN?*/
SELECT TOP (1000)
	*
FROM
	FactSales -- Foreign Key is ChannelKey

SELECT 
	*
FROM
	DimChannel -- Primary Key is ChannelKey

SELECT
	ChannelKey,
	SUM(SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactSales
GROUP BY
	channelKey

-- COM O JOIN AO INV�S DE VER O C�DIGO DO CANAL, PODEREMOS VER O NOME DO CANAL COMO RESULTADO DESTE �LTIMO SELECT

SELECT TOP (1000)
	*
FROM
	FactSales -- Foreign Key is ProductKey

SELECT 
	*
FROM
	DimProduct -- Primary Key is ProductKey


SELECT TOP (1000)
	*
FROM
	FacOnlinetSales -- Foreign Key is CustommerKey

SELECT 
	*
FROM
	DimCustomer -- Primary Key is CustommerKey


SELECT TOP (1000)
	*
FROM
	FactStrategyPlan -- Foreign Key is ScenarioKey

SELECT 
	*
FROM
	DimScenario -- Primary Key is ScenarioKey

/* -------------------------------------------------------------------------------------------------*/
--CHAVE PRIM�RIA X CHAVE ESTRANGEIRA (Primary Key and Foreign Key)
--A chave prim�ria se refere ao registro ou informa��o que n�o se repete em nenhum registro na mesma tabela.
--A chave estrangeira � chave prim�ria em alguma outra tabela e serve para fazer a conex�o de dados de 
--diferentes tabelas, bem como, evita a repeti��o de dados de cadastro, por exemplo.
--A chave estrangeira pode se repetir, enquanto a chave prim�ria n�o.


/* -------------------------------------------------------------------------------------------------*/
--TABELA FATO X TABELA DIMENS�O (FACT VS. DIMENSION TABLES)
/*Uma tabela Dimens�o � uma tabela que cont�m caracter�sticas de um determinado elementeo: lojas, 
produtos, funcion�rios, clientes, etc.

Nesta tabela, nenhum dos elementos principais ir� se repetir. � onde vamos encontrar nossas CHAVES PRIM�RIAS.

Uma tabela Fato � uma tabela que vai registrar os fatos ou acontecimentos de uma empresa/neg�cio em
determinados per�odos de tempo (vendas, devolu��es, aberturas de chamados, receitas, despesas, etc.

Geralmente, � uma tabela commilhares de informa��es e composta essencialmente por coluna de ID usadas
para buscar as informa��es complementares de uma tabela dimens�o, conhecidas como CHAVES ESTRANGEIRAS.

� poss�vel relacionar duas tabelas dimens�o, por�m o mesmo n�o pode ser dito sobre tabelas fato.
 -------------------------------------------------------------------------------------------------*/
/*

TIPOS DE JOIN

TABLE A					/				 TABLE B
Id (PK) + Descri��o + ForeignKey		Aqui a primary key � a ForeignKey na Tabela A 

LEFT OUTER JOIN * Um dos mais usados
Trar� tudo da tabela A e apenas a intersec��o da Tabela B. Todos os dados existentes na tabela A
	e os dados correspondentes � chave estrangeria da Tabela B, o que n�o encontrar ser� exibido como NULL.

RIGHT OUTER JOIN
Trar� tudo que da tabela B e apenas a intersec��o da Tabela A. Todos os dados existentes na tabela B
	e os dados correspondentes � chave estrangeira da Tabela A, o que n�o encontrar ser� exibido como NULL.

INNER JOIN * Um dos mais usados
Trar� apenas a intersec��o das duas tabelas, ser�o desconsiderados os registros que n�o tiverem
	correspond�ncia nas duas tabelas. O que s� tem na tabela A n�o ser� considerado, e da mesma forma,
	tudo que est� contido apenas na tabela B, sem conex�o com a tabela A.
	
FULL OUTER JOIN
Trar� tudo que est� contido nas duas tabelas, onde o que n�o tem refer�ncia, ser� exibido como NULL.

LEFT ANTI JOIN
Trar� os dados correspondentes apenas da tabela A.

RIGHT ANTI JOIN
Trar� os dados correspondentes apenas da tabela B.

FULL ANTI JOIN
Trar� todo os dados que aparecem apenas da tabela A e que aparecem apenas na tabela B, sem correla��o.
*/

SELECT
	Tabela_A.coluna1,
	Tabela_A.coluna2,
	Tabela_A.coluna2,
	Tabela_B.coluna4
FROM
	Tabela_A -- TABELA DA ESQUERDA
INNER JOIN
	Tabela_B -- TABELA DA DIREITA
ON	
	Tabela_A.id_chave_estrangeira = Tabela_B.id_chave_primaria


/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/