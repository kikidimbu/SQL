/* -------------------------------------------------------------------------------------------------
JOINS NO SQL

Porque precisamos do JOIN?
Chave primária vs. Chave Estrangeira
Tabela Fato vs. Tabela Dimensão
Tipos de JOIN
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN
CROSS JOIN
Múltiplos JOIN
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

-- COM O JOIN AO INVÉS DE VER O CÓDIGO DO CANAL, PODEREMOS VER O NOME DO CANAL COMO RESULTADO DESTE ÚLTIMO SELECT

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
--CHAVE PRIMÁRIA X CHAVE ESTRANGEIRA (Primary Key and Foreign Key)
--A chave primária se refere ao registro ou informação que não se repete em nenhum registro na mesma tabela.
--A chave estrangeira é chave primária em alguma outra tabela e serve para fazer a conexão de dados de 
--diferentes tabelas, bem como, evita a repetição de dados de cadastro, por exemplo.
--A chave estrangeira pode se repetir, enquanto a chave primária não.


/* -------------------------------------------------------------------------------------------------*/
--TABELA FATO X TABELA DIMENSÃO (FACT VS. DIMENSION TABLES)
/*Uma tabela Dimensão é uma tabela que contém características de um determinado elementeo: lojas, 
produtos, funcionários, clientes, etc.

Nesta tabela, nenhum dos elementos principais irá se repetir. É onde vamos encontrar nossas CHAVES PRIMÁRIAS.

Uma tabela Fato é uma tabela que vai registrar os fatos ou acontecimentos de uma empresa/negócio em
determinados períodos de tempo (vendas, devoluções, aberturas de chamados, receitas, despesas, etc.

Geralmente, é uma tabela commilhares de informações e composta essencialmente por coluna de ID usadas
para buscar as informações complementares de uma tabela dimensão, conhecidas como CHAVES ESTRANGEIRAS.

É possível relacionar duas tabelas dimensão, porém o mesmo não pode ser dito sobre tabelas fato.
 -------------------------------------------------------------------------------------------------*/
/*

TIPOS DE JOIN

TABLE A					/				 TABLE B
Id (PK) + Descrição + ForeignKey		Aqui a primary key é a ForeignKey na Tabela A 

LEFT OUTER JOIN * Um dos mais usados
Trará tudo da tabela A e apenas a intersecção da Tabela B. Todos os dados existentes na tabela A
	e os dados correspondentes à chave estrangeria da Tabela B, o que não encontrar será exibido como NULL.

RIGHT OUTER JOIN
Trará tudo que da tabela B e apenas a intersecção da Tabela A. Todos os dados existentes na tabela B
	e os dados correspondentes à chave estrangeira da Tabela A, o que não encontrar será exibido como NULL.

INNER JOIN * Um dos mais usados
Trará apenas a intersecção das duas tabelas, serão desconsiderados os registros que não tiverem
	correspondência nas duas tabelas. O que só tem na tabela A não será considerado, e da mesma forma,
	tudo que está contido apenas na tabela B, sem conexão com a tabela A.
	
FULL OUTER JOIN
Trará tudo que está contido nas duas tabelas, onde o que não tem referência, será exibido como NULL.

LEFT ANTI JOIN
Trará os dados correspondentes apenas da tabela A.

RIGHT ANTI JOIN
Trará os dados correspondentes apenas da tabela B.

FULL ANTI JOIN
Trará todo os dados que aparecem apenas da tabela A e que aparecem apenas na tabela B, sem correlação.
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