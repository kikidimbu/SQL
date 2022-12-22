/* -------------------------------------------------------------------------------------------------
1 -Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
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

	
/*	a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame
		essa variável de soma.*/
DECLARE @soma as INT = @valor1 + @valor2
SELECT @soma AS 'Soma de 1 e 2'

/*	b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4.
		Chame essa variável de subtracao.*/
DECLARE @subtracao as INT = @valor3 - @valor4
SELECT @subtracao AS 'Subtração 4 de 3'


/*	c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o
		valor4. Chame essa variável de multiplicacao.*/
DECLARE @multiplicacao AS INT = @valor1 * @valor4
SELECT @multiplicacao AS 'Multiplicação de 1 por 4'


/*	d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame
		essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.*/
DECLARE @divisao AS FLOAT = CAST(@valor3 AS FLOAT) / @valor4
SELECT @divisao AS 'Divisão de 3 por 4'

/*	e) Arredonde o resultado da letra d) para 2 casas decimais.*/ 
SELECT ROUND(@divisao,2,1) AS 'Divisão arredondada'
SELECT ROUND(@divisao,2,0) AS 'Divisão arredondada para cima'
SELECT ROUND(@divisao,2,2) AS 'Divisão arredondada'

/* -------------------------------------------------------------------------------------------------
2 - Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser
	especificado.
	a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
	b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
	c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
	d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre
	‘quantidade’ e ‘preco’.
	e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.*/
DECLARE 
	@produto AS VARCHAR(30) = 'Celular',
	@quantidade AS INT = 12,
	@preco AS FLOAT = 9.99
DECLARE
	@faturamento AS FLOAT = ROUND(@quantidade * @preco,2,0)
SELECT
	@produto AS 'Produto',
	@quantidade AS 'Qtd',
	@preco AS 'Preço',
	@faturamento AS 'Total'

/* -------------------------------------------------------------------------------------------------
3 - 3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de
usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este
usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e
num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo:

(Nenhum nome da coluna)
Meu nome é André, nasci em 10/02/1998 e tenho 2 pets.

Dica: você precisará utilizar as funções CAST e FORMAT para chegar no resultado.*/
DECLARE
	@varNome VARCHAR (30) = 'André',
	@varDtNascimento DATETIME = '10/02/1998',
	@varNumPets INT = 2

SELECT 
	'Meu nome é ' + 
	@varNome + 
	', nasci em ' + 
	FORMAT(@varDtNascimento,'dd') + ' de '	+ FORMAT(@varDtNascimento,'MMMM') + ' de ' + FORMAT(@varDtNascimento,'yyy') + 
	' e tenho ' + CAST(@varNumPets AS VARCHAR(30)) + 
	' pets.'

/* -------------------------------------------------------------------------------------------------
4 - Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as
	lojas da empresa.
	A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a
	empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir
	o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e
	mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
	O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
	‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas

	Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado.
	

/* -------------------------------------------------------------------------------------------------
5 - 5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
	uma subcategoria específica: ‘Lamps’.
	Utilize o conceito de variáveis para chegar neste resultado.



