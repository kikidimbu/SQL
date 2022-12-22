/* -------------------------------------------------------------------------------------------------
VARIÁVEIS

Tipos de dados - TXT, DATA E NÚMERO
CAST e FORMAT - FUNÇÕES COM VARIÁVEIS
ROUND, FLOOR e CEILING - FUNÇÕES DE ARREDONDAMENTO
DECLARE e SET - INSTRUÇÕES PARA DECLARAÇÃO DE VARIÁVEIS
Aplicações de variáveis
PRINT
VARIÁVEIS GLOBAIS

*/

/* -------------------------------------------------------------------------------------------------
T I P O S   D E   D A D O S

O ripo de dado é a maneira como o SQL consegue diferenciar cada valor dentro de um banco de dados.
	a) Inteiro: 1, 100, 569
	Como o SQL entende um número inteiro: INT
*/

/*
	b) Decimal: 10.33, 90.91, 410.787
		Como o SQL entende o número decimal: FLOAT ou DECIMAL (N, M)
			N é o número de dígitos que o número pode ter, incluindo as casas decimais
			M é o número máximo de casas decimais
*/

/*
	c) Texto/String: 'Carla', 'Motorola', 'Pastel', '44'
		Como o SQL entende um texto: VARCHAR (N)
			N é o número de caracteres que o texto pode ter
*/

/*
	d) Data: '01/01/2021', '23/03/2123'
		Como o SQL entende uma data: DATETIME

*/
/* -------------------------------------------------------------------------------------------------
O P E R A Ç Õ E S   B Á S I C A S																	*/
	-- Operações básicas
	SELECT 10 AS 'Número'
	SELECT 49.50 AS 'Decimal'
	SELECT 'Marcus' AS 'Nome'
	SELECT '24/11/2022' AS 'Data'

	-- Operações com números
	SELECT 10+20 AS 'Soma'
	SELECT 20-5 AS 'Subtração'
	SELECT 31*40 AS 'Multiplicação'
	SELECT 431/23 AS 'Divisão INT' -- = 18.739 - INT, para obrigar o SQL a considerar a casa decimal, precisamos colocá-la
	SELECT 431.0/23 AS 'Divisão FLOAT/Decimal' 

	-- Operações com textos
	SELECT 'Kiki' + ' ' +'Dimbu' -- Só concatena dois ou mais campos do mesmo tipo

	--Operações com datas
	SELECT '20/06/2021' + 30 -- Não funciona, porque a "data" está sendo considerada como VARCHAR - tudo que está indicado entre aspas simples será considerado String (txt)

/* -------------------------------------------------------------------------------------------------
S Q L   V A R I A N T   P R O P E R T Y (Valor, 'BaseType')
*/
-- 1 - SQL_VARIANT_PROPERTY
--Como posso entender como o SQL lê os dados nos exemplos abaixo:
	SELECT 10 AS 'Número'
	SELECT 49.50 AS 'Decimal'
	SELECT 'Marcus' AS 'Nome'
	SELECT '24/11/2022' AS 'Data'

	SELECT SQL_VARIANT_PROPERTY(10, 'BaseType') -- int
	SELECT SQL_VARIANT_PROPERTY(49.50, 'BaseType') -- numeric -- como fazer com que o SQL o leia float ou decimal?
	SELECT SQL_VARIANT_PROPERTY('Marcus', 'BaseType') -- varchar
	SELECT SQL_VARIANT_PROPERTY('24/11/2022', 'BaseType') -- varchar -- como fazer com que o SQL o leia como date/datetime
/* -------------------------------------------------------------------------------------------------
C A S T	
*/
-- 2 - CAST: Função para especificar o tipo dos dados.
		-- int: inteiro
		-- float: decimal
		-- varchar: string/texto
		-- datetime: data e hora
	
	SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS FLOAT), 'BaseType')

	SELECT CAST(21.45 AS INT)
	SELECT CAST(21.45 AS FLOAT)
	SELECT CAST(18.7 AS FLOAT)
	SELECT CAST(15.6 AS FLOAT)
	SELECT CAST('24/11/2022' AS DATETIME)

	SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS INT), 'BaseType')
	SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS FLOAT), 'BaseType')
	SELECT SQL_VARIANT_PROPERTY(CAST(18.7 AS FLOAT), 'BaseType')
	SELECT SQL_VARIANT_PROPERTY(CAST('15.6' AS FLOAT), 'BaseType')
	SELECT SQL_VARIANT_PROPERTY(CAST('20/06/2021' AS DATETIME), 'BaseType')
	SELECT CAST('24/11/2022' AS DATETIME) + 1

/* -------------------------------------------------------------------------------------------------*/
		-- EXERCÍCIOS
			-- a) Crie uma consulta juntando o texto 'O preço do pastel é: ' como o valor 30.99
		SELECT 'O preço do pastel é: ' + CAST(30.99 AS VARCHAR)
		SELECT 'O preço do pastel é: ' + CAST(30.99 AS VARCHAR (50))
			-- b) Adcione 1 à data '10/06/2021'
		SELECT CAST('10/06/2021' AS DATETIME) + 1
		SELECT CAST('25/11/2022' AS DATETIME) - CAST('21/05/1980' AS DATETIME) -- traz um resultado no formato data
	 

/* -------------------------------------------------------------------------------------------------
F O R M A T
*/
	-- 3) FORMAT: Função para o formato de valores no SQL
		-- a) numéricos 
		-- SELECT FORMAT (Valor, 'Formato')
			SELECT FORMAT (1000, 'N') -- Valor numérico no formato moeda brasileira sem $
			SELECT FORMAT (1000, 'G') -- Número sem marcação de mil ou casas decimais
		--b) personalizados
			SELECT FORMAT(123456789, '####-##-####')
		--c) Data:
			SELECT FORMAT('23/03/2021', 'dd/MM/yyyy') -- não funciona, porque o SQL primeiro precisa reconhecer o que indicamos como data
			SELECT FORMAT(CAST('23/03/2021' AS DATETIME), 'dd/MM/yyyy')
			SELECT FORMAT(CAST('23/03/2021' AS DATETIME), 'dd/MMM/yyyy')
			SELECT FORMAT(CAST('23/03/2021' AS DATETIME), 'ddd/MMM/yyyy')
			SELECT FORMAT(CAST('23/03/2021' AS DATETIME), 'dd-ddd/MMM/yy')
			SELECT FORMAT(CAST('23/03/2021' AS DATETIME), 'dddd-dd/MMMM/yy')
			SELECT FORMAT((CAST('25/11/2022' AS DATETIME) - CAST('21/05/1980' AS DATETIME)),'G') -- não funcionou
/* -------------------------------------------------------------------------------------------------*/
		--EXERCÍCIOS
		--Crie uma função juntando o texto 'A data de validade do produto é: ' com a data 17/04/2022.
		--Você deverá usar o CAST para garantir que a data é entendida com o tipo DATETIME.

		SELECT 'A data de validade do produto é: ' + FORMAT(CAST('17/04/2022' AS DATETIME), 'dd/MMM/yy')
/* -------------------------------------------------------------------------------------------------
R O U N D ,   F L O O R   &   C E I L I N G
*/
			SELECT 10+30
			SELECT 20-5
			SELECT 31*4
			SELECT 431.0/23
	--ROUND
		SELECT ROUND(18.739130,2) AS 'ROUND no número'
		SELECT ROUND(431.0/23, 2) AS 'ROUND na conta'
	--ROUND (Truncar)
		SELECT ROUND(18.739130,2,1) AS 'ROUND desconsidera'-- QUALQUER número diferente de zero na última opção indica que não quero arredondar e só quero desconsiderar as casas decimais 
		SELECT ROUND(431.0/23, 2,0) AS 'ROUND arred'
	--FLOOR -- arredondamento para baixo
		SELECT FLOOR (431.0/23) AS 'FLOOR'
	--CEILING -- arredondamento para cima
		SELECT CEILING (431.0/23) AS 'CEILING'

/* -------------------------------------------------------------------------------------------------
D E C L A R A N D O   V A R I Á V E I S
	1) O que é uma variável?
		Uma variável é um objeto que armazena o valor de um dado.
	
	2) Estrutura
	DECLARE @var tipo
	SET @var = valor
	SELECT @var

	3) Exemplo:
	Em vez de...
	SELECT 1000
	SELECT 1000 * 1000
	SELECT FORMAT (1000 * 1000, 'N')
	Seria melhor... toda vez que quero alterar o valor, basta usar a variável
	DECLARE @numero FLOAT
	SET @numero = 1000
	SELECT @numero
	SELECT @numero * @numero
	SELECT FORMAT(@numero * @numero, 'N')
*/
	DECLARE @var INT
	SET @var = 10
	SELECT @var AS 'Minha prirmeira variável no SQL'
	--E X E M P L O
	DECLARE @numero FLOAT
	SET @numero = 1000
	SELECT @numero
	SELECT @numero * @numero
	SELECT FORMAT(@numero * @numero, 'N')
	
	DECLARE @numero FLOAT
	SET @numero = 2360
	SELECT @numero
	SELECT @numero * @numero
	SELECT FORMAT(@numero * @numero, 'N')

	DECLARE @numero FLOAT
	SET @numero = 5973.82
	SELECT @numero
	SELECT @numero * @numero
	SELECT FORMAT(@numero * @numero, 'N')

/* -------------------------------------------------------------------------------------------------
	EXERÍCIOS
*/
	--1) Declare uma variável chamada 'idade' e armazene o valor 30	
		DECLARE @idade INT
		SET @idade = 30
		SELECT @idade AS 'Idade'
	--2) Declare uma variável chamada 'preco' e armazene o valor 10.89
		DECLARE @preco FLOAT
		SET @preco = 10.89
		SELECT @preco AS 'Preço'
	--3) Declare uma variável chamada 'nome' e armazene o valor Mateus
		DECLARE @nome AS VARCHAR (15)
		SET @nome = 'Mateus'
		SELECT @nome as 'Nome'
	--4) Declare uma variável chamda 'data' e armazene a data de hoje
		DECLARE @data AS DATETIME
		SET @data = '26/11/2022'
		SELECT @data AS 'Data'
		SELECT FORMAT(@data,'dddd-dd/MMM/yy')
/* -------------------------------------------------------------------------------------------------
D E C L A R A  N D O    M A I S   D E   U M A   V A R I Á V E L
*/
-- Opção 1 - declaração e atribuição de valores individualmente
DECLARE @var1 INT
DECLARE @texto VARCHAR(30)
DECLARE @data DATETIME
SET @var1 = 10
SET @texto = 'Um texto qualquer '
SET @data = '26/11/2022'
SELECT @var1, @texto, @data

--Opção 2 - declaração em grupo, atribuição individual
DECLARE @var1 INT,
		@texto VARCHAR(30),
		@data DATETIME
SET @var1 = 10
SET @texto = 'Um texto qualquer'
SET @data = '26/11/2022'
SELECT @var1, @texto, @data

-- Opção 3 - Declaração e atribuição conjunta
DECLARE @var1 INT = 10,
		@texto VARCHAR(30) = 'Um texto qualquer',
		@data DATETIME = '26/11/2022'
SELECT @var1, @texto, @data

/* -------------------------------------------------------------------------------------------------*/
	--Exercícios
	--1) A sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Faça um SELECT para obter
	-- o resultado do faturamento (multiplicação da quantidade vezes o preço).
			SELECT 100 * 89.99 AS 'Total'
	--2)Refaça o exercício anterior utilizando variáveis para deixar o cálculo mais otimizado.
			-- Tipo 1
			DECLARE @qtd_produto INT
			DECLARE @preco FLOAT
			SET @qtd_produto = 100
			SET @preco = 89.99
			SELECT CAST (@qtd_produto*@preco AS FLOAT) AS 'Faturamento 1'

			-- Tipo 2
			DECLARE @qtd_produto INT,
					@preco FLOAT
			SET @qtd_produto = 100
			SET @preco = 89.99
			SELECT CAST (@qtd_produto*@preco AS FLOAT) AS 'Faturamento 2'

			-- Tipo 3
			DECLARE @qtd_produto INT = 101,
					@preco FLOAT = 89.99
			SELECT CAST (@qtd_produto*@preco AS FLOAT) AS 'Faturamento 3'
/* -------------------------------------------------------------------------------------------------*/
-- E X E M P L O S   D E   C O M O   U T I L I Z A R   U M A   V A R I Á V E L   E M   U M A   C O N S U L T A

-- Exemplo 1: Aplique um desconto de 10% em todos os preços dos produtos. Sua consulta final deve conter
--		as colunas ProductKey, ProductName, UnitPrice e Preço com desconto.

SELECT
	TOP (100)*
FROM
	DimProduct

SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice AS 'Preço Unitário',
	UnitPrice * 0.9 AS 'Preço Promocional'
FROM
	DimProduct

/* CONSTRUÇÃO DA VARIÁVEL
preco = Unitprice
desconto = 0.10
preco_com_desconto = UnitPrice * (UnitPrice [1] - desconto)  1 aqui é o inteiro
*/
DECLARE @varDesconto FLOAT
SET @varDesconto = 0.20  -- A UTILIZAÇÃO DA VARIÁVEL AJUDA NA AUTOMATIZAÇÃO DOS PROCESSOS

SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice AS 'Preço Unitário',
	UnitPrice * (1 - @varDesconto) AS 'Preço Promocional'
FROM
	DimProduct

DECLARE @varDesconto FLOAT
SET @varDesconto = 0.20  -- A UTILIZAÇÃO DA VARIÁVEL AJUDA NA AUTOMATIZAÇÃO DOS PROCESSOS
SELECT ProductKey AS 'ID', ProductName AS 'Produto', UnitPrice AS 'Preço Unitário', UnitPrice * (1 - @varDesconto) AS 'Preço Promocional' FROM DimProduct

/* -------------------------------------------------------------------------------------------------*/
-- Exemplo 2
-- Crie uma variável de data para otimizar a consulta abaixo
DECLARE @var_data AS DATETIME
SET @var_data = '01/01/1980'

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Cliente' AS 'Tipo'
FROM
	DimCustomer
WHERE
	BirthDate >= @var_data

UNION

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Funcionário' AS 'Tipo'
FROM
	DimEmployee
WHERE
	BirthDate >= @var_data
ORDER BY
	Nascimento
/* -------------------------------------------------------------------------------------------------*/
-- A R M A Z E N A N D O   O   R E S U L T A D O   D E   U M   S E L E  C T   N U M A   V A R I Á  V E L
/* -------------------------------------------------------------------------------------------------*/
-- Exemplo 1
-- Crie uma variável para armazenas a quantidade todal de funcionários da tabela DimEmployee.
SELECT
	TOP (100)*
FROM
	DimEmployee

DECLARE @varTotalFuncionarios INT
SET @varTotalFuncionarios = ( 
	SELECT
		COUNT(*)
	FROM
		DimEmployee
	WHERE
		EndDate IS NULL
	)
SELECT @varTotalFuncionarios AS 'Funcionários ativos'

-- Exemplo 2
-- Crie uma variável para armazenar a quantidade total de lojas com o Status Off.
SELECT
	TOP (100)*
FROM
	DimStore

DECLARE @varLojasOff INT
SET @varLojasOff = ( 
	SELECT
		COUNT(*)
	FROM
		DimStore
	WHERE
		CloseDate IS NOT NULL
	)
SELECT @varLojasOff AS 'Lojas Fechadas'
/* -------------------------------------------------------------------------------------------------*/
-- P R I N T A N D O   A V I  S O S    N A   T E L A
/* -------------------------------------------------------------------------------------------------*/
SELECT
	*
FROM
	DimProduct -- 2517 Registros

SELECT
	COUNT(*)
FROM
	DimProduct --  1 Registro de Resultado

-- P R I N T    P A R A   P  E R S O N A L I Z A Ç Ã O   D A   A B A   M E N S A G E N S
-- Exemplo 1
-- Printe na tela a quandidade de Lojas On e Off da Tabela DimStore utilizando variáveis.

SET NOCOUNT ON -- ELIMINA A CONTAGEM NA ABA DE MENSAGENS E FUNCIONA PARA A QUERY ABERTA

DECLARE @varLojasOn INT,
		@varLojasOff INT
SET @varLojasOn = ( 
	SELECT
		COUNT(*)
	FROM
		DimStore
	WHERE
		Status = 'On'
	)
SET @varLojasOff = ( 
	SELECT
		COUNT(*)
	FROM
		DimStore
	WHERE
		Status = 'Off'
	)
SELECT @varLojasOn AS 'Lojas Ativas',
		@varLojasOff AS 'Lojas Inativas'
PRINT 'Lojas ativas: ' + CAST(@varLojasOn AS VARCHAR(10))
PRINT 'Lojas inativas: ' + CAST(@varLojasOff AS VARCHAR(10))

/* -------------------------------------------------------------------------------------------------*/
-- V A R I Á V E L   R E C E B E N D O   O    R E G I S T R O   D E   C O  N S U L T A
/* -------------------------------------------------------------------------------------------------*/
SELECT TOP(100)
	*
FROM
	FactSales
ORDER BY  SalesQuantity DESC

-- Exemplo 1
-- Qual é o nome do produto que teve a maior quantidade vendida  EM UMA ÚNICA VENDA (FactSales)

DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT

SELECT TOP(1)
	@varProdutoMaisVendido = ProductKey,
	@varTotalMaisVendido = SalesQuantity
FROM
	FactSales
ORDER BY
	SalesQuantity Desc

PRINT @varProdutoMaisVendido
PRINT @varTotalMaisVendido

SELECT 
	ProductName
FROM
	DimProduct
WHERE
	ProductKey = @varProdutoMaisVendido

DECLARE @varProdutoMaisVendidoNome VARCHAR -- N Ã O   F U  N C I O N A
DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT

SELECT TOP(1)
	@varProdutoMaisVendidoNome = ProductName,
	@varTotalMaisVendido = SalesQuantity
FROM
	FactSales
	LEFT JOIN
	DimProduct
ON FactSales.ProductKey = DimProduct.ProductDescription
ORDER BY
	SalesQuantity Desc

PRINT @varProdutoMaisVendidoNome
PRINT @varTotalMaisVendido

/* -------------------------------------------------------------------------------------------------*/
-- C O M O   A C U M U L A R   V A L O R E S   D E N T R O   D E   U M A   V A R I Á V E L
/* -------------------------------------------------------------------------------------------------*/
SELECT
	FirstName,
	DepartmentName
FROM
	DimEmployee
WHERE
	DepartmentName = 'Marketing' AND Gender = 'F'

-- Solução

DECLARE @varListaNomes VARCHAR (50)
SET @varListaNomes = ''

SELECT
	@varListaNomes = @varListaNomes + FirstName + ', '
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F'

PRINT LEFT(@varListaNomes, DATALENGTH(@varListaNomes)-2)

--RESULTADO PULANDO UMA LINHA
DECLARE @varListaNomes VARCHAR (50)
SET @varListaNomes = ''

SELECT
	@varListaNomes = @varListaNomes + FirstName + ',' + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F'

PRINT LEFT(@varListaNomes,DATALENGTH(@varListaNomes)-2)
/* -------------------------------------------------------------------------------------------------*/
-- V A R I Á V E I S   G L O B A I S
/* -------------------------------------------------------------------------------------------------*/
-- Estas são as variáveis já existentes dentro do SQL Server identifcados por @@
SELECT @@SERVERNAME
SELECT @@VERSION

SELECT * FROM DimProduct
SELECT @@ROWCOUNT
/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

SET NOCOUNT ON/* -------------------------------------------------------------------------------------------------*/