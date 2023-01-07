/* -------------------------------------------------------------------------------------------------
1 -Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:
	valor1 = 10
	valor2 = 5
	valor3 = 34
	valor4 = 7
*/
DECLARE @valor1 INT = 10,
		@valor2 INT = 5,
		@valor3 INT = 34,
		@valor4 INT = 7
SELECT 
	@valor1 AS 'Valor1',
	@valor2 AS 'Valor2',
	@valor3 AS 'Valor3',
	@valor4 AS 'Valor4'

	
/*	a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame
		essa vari�vel de soma.*/
DECLARE @soma as INT = @valor1 + @valor2
SELECT @soma AS 'Soma de 1 e 2'

/*	b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4.
		Chame essa vari�vel de subtracao.*/
DECLARE @subtracao as INT = @valor3 - @valor4
SELECT @subtracao AS 'Subtra��o 4 de 3'


/*	c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o
		valor4. Chame essa vari�vel de multiplicacao.*/
DECLARE @multiplicacao AS INT = @valor1 * @valor4
SELECT @multiplicacao AS 'Multiplica��o de 1 por 4'


/*	d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame
		essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.*/
DECLARE @divisao AS FLOAT = CAST(@valor3 AS FLOAT) / @valor4
SELECT @divisao AS 'Divis�o de 3 por 4'

/*	e) Arredonde o resultado da letra d) para 2 casas decimais.*/ 
SELECT ROUND(@divisao,2,1) AS 'Divis�o arredondada'
SELECT ROUND(@divisao,2,0) AS 'Divis�o arredondada para cima'
SELECT ROUND(@divisao,2,2) AS 'Divis�o arredondada'
-- Resultados anteriores (tudo int): 10, 15, 27, 70, 4.85714285714286, 4.85, 4.86, 4.85
----------------------------------------------------------------------------
-- C O R R E � � O   D O   P R O F E S S O R
----------------------------------------------------------------------------
-- � importante lembrar que mesmo quando os n�meros s�o inteiros, os c�lculos realizados com eles
-- podem resultar em n�meros decimais, ent�o o seu conselho foi, declararmos todos como float
-- Atuais resultados: (tudo float):  10, 15, 27, 70, 4.85714285714286, 4.85, 4.86, 4.85
-- TUDO EXATAMENTE IGUAL, a diferen�a ficou na praticidade do c�lculo e da n�o necessidade de n�o
-- converter um int em float na divis�o.

DECLARE @valor1 FLOAT = 10,
		@valor2 FLOAT = 5,
		@valor3 FLOAT = 34,
		@valor4 FLOAT = 7
SELECT 
	@valor1 AS 'Valor1',
	@valor2 AS 'Valor2',
	@valor3 AS 'Valor3',
	@valor4 AS 'Valor4'

	
/*	a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame
		essa vari�vel de soma.*/
DECLARE @soma as FLOAT = @valor1 + @valor2
SELECT @soma AS 'Soma de 1 e 2'

/*	b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4.
		Chame essa vari�vel de subtracao.*/
DECLARE @subtracao as FLOAT = @valor3 - @valor4
SELECT @subtracao AS 'Subtra��o 4 de 3'


/*	c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o
		valor4. Chame essa vari�vel de multiplicacao.*/
DECLARE @multiplicacao AS FLOAT = @valor1 * @valor4
SELECT @multiplicacao AS 'Multiplica��o de 1 por 4'


/*	d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame
		essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.*/
DECLARE @divisao AS FLOAT = @valor3 / @valor4
SELECT @divisao AS 'Divis�o de 3 por 4'

/*	e) Arredonde o resultado da letra d) para 2 casas decimais.*/ 
SELECT ROUND(@divisao,2,1) AS 'Divis�o arredondada'
SELECT ROUND(@divisao,2,0) AS 'Divis�o arredondada para cima'
SELECT ROUND(@divisao,2,2) AS 'Divis�o arredondada'

/* -------------------------------------------------------------------------------------------------
2 - Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser
	especificado.
	a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.
	b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12.
	c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.
	d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre
	�quantidade� e �preco�.
	e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.*/
DECLARE 
	@produto AS VARCHAR(30) = 'Celular',
	@quantidade AS INT = 12,
	@preco AS FLOAT = 9.99
DECLARE
	@faturamento AS FLOAT = ROUND(@quantidade * @preco,2,0)
SELECT
	@produto AS 'Produto',
	@quantidade AS 'Qtd',
	@preco AS 'Pre�o',
	@faturamento AS 'Total'

/* -------------------------------------------------------------------------------------------------
3 - 3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de
usu�rios. Em resumo, esses dados s�o:
- Nome do usu�rio
- Data de nascimento
- Quantidade de pets que aquele usu�rio possui
Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este
usu�rio. Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e
num_pets. Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.
O resultado final a ser alcan�ado � mostrado no print abaixo:

(Nenhum nome da coluna)
Meu nome � Andr�, nasci em 10/02/1998 e tenho 2 pets.

Dica: voc� precisar� utilizar as fun��es CAST e FORMAT para chegar no resultado.*/
DECLARE
	@varNome VARCHAR (30) = 'Andr�',
	@varDtNascimento DATETIME = '10/02/1998',
	@varNumPets INT = 2

SELECT 
	'Meu nome � ' + 
	@varNome + 
	', nasci em ' + 
	FORMAT(@varDtNascimento,'dd') + ' de '	+ FORMAT(@varDtNascimento,'MMMM') + ' de ' + FORMAT(@varDtNascimento,'yyy') + 
	' e tenho ' + CAST(@varNumPets AS VARCHAR(30)) + 
	' pets.'

SELECT
	'Meu nome � ' + 
	@varNome + 
	', nasci em ' + 
	FORMAT(@varDtNascimento,'dd/MM/yyyy') + 
	' e tenho ' + CAST(@varNumPets AS VARCHAR(30)) + 
	' pets.'
/* -------------------------------------------------------------------------------------------------
4 - Voc� acabou de ser promovido e o seu papel ser� realizar um controle de qualidade sobre as
	lojas da empresa.
	A primeira informa��o que � passada a voc� � que o ano de 2008 foi bem complicado para a
	empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio � descobrir
	o nome dessas lojas que fecharam no ano de 2008, para que voc� possa entender o motivo e
	mapear planos de a��o para evitar que outras lojas importantes tomem o mesmo caminho.
	O seu resultado dever� estar estruturado em uma frase, com a seguinte estrutura:
	�As lojas fechadas no ano de 2008 foram: � + nome_das_lojas

	Obs: utilize o comando PRINT (e n�o o SELECT!) para mostrar o resultado.*/
SELECT * FROM DimStore

DECLARE @varListaLojas VARCHAR(70) = ''

SELECT
	@varListaLojas = @varListaLojas + StoreName + ', '
FROM
	DimStore
WHERE
	FORMAT(CloseDate, 'yyyy') = 2008

PRINT 'As lojas fechadas no ano de 2008 foram: ' + LEFT(@varListaLojas, DATALENGTH (@varListaLojas)-2)
/* -------------------------------------------------------------------------------------------------
5 - 5. Voc� precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
	uma subcategoria espec�fica: �Lamps�.
	Utilize o conceito de vari�veis para chegar neste resultado.*/

SELECT
	TOP(1000) * 
FROM 
	DimProduct

SELECT 
	TOP(1000) * 
FROM 
	DimProductSubcategory

DECLARE @varListaProdutos AS VARCHAR(1000) = ''

SELECT
	@varListaProdutos = @varListaProdutos + ProductName + CHAR(10)
FROM 
	DimProduct
INNER JOIN
	DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey =
	DimProductSubcategory.ProductSubcategoryKey
WHERE
	ProductSubcategoryName = 'Lamps'

PRINT @varListaProdutos

-------------------------------------------------------------------------------
-- S O L U � � O   D O    P  R O F E S S O R
-------------------------------------------------------------------------------
SELECT TOP(1000) * FROM DimProduct
SELECT TOP(1000) * FROM DimProductSubcategory

DECLARE @varNomeSubcategoria VARCHAR (30) = 'Lamps'
DECLARE @varIdSucategoria INT = (SELECT ProductSubcategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = @varNomeSubcategoria)

SELECT
	*
FROM 
	DimProduct
WHERE
	ProductSubcategoryKey = @varIdSucategoria