/* -------------------------------------------------------------------------------------------------
1 - Voc� � o gerente da �rea de compras e precisa gerar um relat�rio com as TOP 100 vendas,
	de acordo com a quantidade vendida. Voc� precisa fazer isso em 10 minutos pois o diretor de
	compras solicitou essa informa��o para apresentar em uma reuni�o. 
	Utilize seus conhecimentos em SQL para encontrar essas TOP 100 vendas de acordo com o total
	vendido (SalesAmount).
	PS.: Na corre��o o professor usou a coluna SalesQuantity ao inv�s de SalesAmount
*/

SELECT												-- 100 Registros
	TOP (100)*
FROM
	FactSales



SELECT												-- 100 Registros
	TOP (100)*
FROM
	FactSales
ORDER BY 
	SalesQuantity DESC
	--SalesAmount DESC
/* -------------------------------------------------------------------------------------------------
 2 - Os top 10 produtos com maior UnitPrice possuem exatamente o mesmo pre�o, por�m a empresa quer
	diferenciar esses pre�os de acordo com o peso (weight)de cada um. 
	O que voc� precisar� fazer � ordenar esses TOP 10 produtos de acordo com a coluna de UnitPrice
	e, al�m disso, estabelecer um crit�rio de desempate, para que seja mostrado na ordem, do maior
	para o menor.
	Caso ainda haja um empate entre dois ou mais produtos, pense em uma forma de criar um segundo
	crit�rio de desempate.
*/ 

SELECT												-- 100 Registros
	TOP (100)* 
FROM
	DimProduct
ORDER BY 
	UnitPrice DESC, Weight DESC, Manufacturer

SELECT												-- 10 Registros
	TOP (10) ProductName AS 'Produto',
	UnitPrice AS 'Pre�o Unit�rio',
	Weight AS 'Peso',
	Manufacturer AS 'Fabricante'
FROM
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, Manufacturer


SELECT												-- 10 Registros
	TOP (10) ProductName AS 'Produto',
	UnitPrice AS 'Pre�o Unit�rio',
	Weight AS 'Peso',
	AvailableForSaleDate AS 'Disponibilizado � venda em:'
FROM
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate

/* -------------------------------------------------------------------------------------------------
3 - Voc� � o respons�vel pelo setor de log�stica da empresa Contoso e precisa dimensionar o transporte
	de todos os produtos em categorias, de acordo com o peso.
	Os produtos da Categoria A, com peso acima de 100kg dever�o ser transpotados na primeira leva.
	Fa�a uma consulta no banco de dados para descobrir quais s�o esses produtos que est�o na categoria
	A.
	a) Voc� dever� retornar apenas duas colunas nesta consulta: Nome do Produto e Peso.
	b) Renomeie estas colunas com nomes mais intuitivos.
	c) Ordene esses produtos do mais pesado para o mais leve.
*/

SELECT												-- 805 Registros
	TOP (100) *
FROM
	DimProduct



SELECT												-- 112 Registros
	ProductName AS 'Produtos de Categoria A',
	Weight AS 'Peso'
FROM
	DimProduct
WHERE
	Weight >= 100 AND Weight IS NOT NULL
ORDER BY 
	Weight DESC
	 
/* -------------------------------------------------------------------------------------------------
4 - Voc� foi alocado para criar um relat�rio das lojas registradas atualmente na Contoso.
	a) Descubra quantas lojas a empresa tem no total. Na consulta que voc� dever� fazer � tabela 
	DimStore retorne as seguintes informa��es StoreName, OpenDate, EmployeeCount
	b) Renomeie as colunas anteriores para deixar a consulta mais intuitiva.
	c) Dessas lojas, descubra quantas e quais ainda est�o ativas.
*/
SELECT												-- 1000 Registros
	TOP(1000)*
FROM
	DimStore


SELECT												-- 286 Registros
	StoreName AS 'Lojas Ativas',
	OpenDate AS 'Inaugurada em:',
	EmployeeCount AS 'Funcion�rios'
FROM
	DimStore
WHERE
	StoreType = 'Store' AND EmployeeCount IS NOT NULL AND Status = 'On'
ORDER BY 
	OpenDate DESC


SELECT												-- 12 Registros
	StoreName AS 'Lojas Inativas',
	OpenDate AS 'Inaugurada em:',
	EmployeeCount AS 'Funcion�rios'
FROM
	DimStore
WHERE
	StoreType = 'Store' AND EmployeeCount IS NOT NULL AND CloseDate IS NOT NULL
ORDER BY 
	OpenDate DESC

/* -------------------------------------------------------------------------------------------------
5 - O gerente da �rea de controle de qualidade notificou � Contoso que todos os produtos Home Theater
	da marca Litware, disponibilizados para a venda no dia 15 de mar�o de 2009, foram identificados
	com defeitos de f�brica.
	O que voc� dever� fazer � identificar os ID's desses produtos e repassar ao gerente para que ele
	possas notificar as lojas e consequentemente solicitar a suspens�o das vendas desses produtos.
*/

 
SELECT												-- 3 Registros
	ProductKey AS 'ID',
	ProductName AS 'Produtos',
	BrandName AS 'Marca',
	AvailableForSaleDate AS 'Dispon�vel para venda em:'
FROM
	DimProduct
WHERE
	AvailableForSaleDate = '20090315' -- Para fazer consulta em campos Date/Time � preciso tirar os tra�os entre os dados, j� nos campos data, pode-se utilizar normalmente.
	AND ProductName LIKE '%Home Theater%' 
	AND BrandName = 'Litware'
ORDER BY 
	AvailableForSaleDate DESC

/* -------------------------------------------------------------------------------------------------
6 - Imagine que voc� precise extrair um relat�rio da tabela DimStore, com informa��es de lojas. Mas
	voc� precisa apenas das lojas que n�o est�o mais funcionando atualmente.
	a) Utilize a coluna de status para filtrar a tabela e trazer apenas as lojas que n�o est�o mais
	funcionando.
	b) Agora imagine que essa coluna de status n�o existe na sua tabela, qual seria a outra forma 
	que voc� teria para descobrir quais s�o as lojas que n�o est�o mais funcionando.
*/

SELECT												-- 12 Registros
	*
FROM
	DimStore
WHERE
	Status = 'Off'


SELECT												-- 12 Registros
	*
FROM
	DimStore
WHERE
	CloseDate IS NOT NULL

/* -------------------------------------------------------------------------------------------------
7 - De acordo com a quantidade de funcion�rios, cada loja receber� uma determinada quantidade de
	m�quinas de caf�. As lojas ser�o divididas em tr�s categorias:
		CATEGORIA 1 - De 1 a 20 funcion�rios - 1 m�quina de caf�;
		CATEGORIA 2 - De 21 a 50 funcion�rios - 2 m�quinas de caf�;
		CATEGORIA 3 - Acima de 51 funcion�rios - 3 m�quinas de caf�
	Identifique para cada caso, quais s�o as lojas de cada uma das tr�s categorias acima (basta fazer
	uma verifica��o).
*/

--CATEGORIA 1
SELECT												-- 69 Registros
	*	
FROM
	DimStore
WHERE
	EmployeeCount <=20 AND Status = 'On'
ORDER BY 
	EmployeeCount DESC

--CATEGORIA 2
SELECT												-- 181 Registros
	*	
FROM
	DimStore
WHERE
	EmployeeCount BETWEEN 21 AND 50 AND Status = 'On'
ORDER BY 
	EmployeeCount DESC

--CATEGORIA 3
SELECT												-- 43 Registros
	*	
FROM
	DimStore
WHERE
	EmployeeCount >51 AND Status = 'On'
ORDER BY 
	EmployeeCount DESC


/* -------------------------------------------------------------------------------------------------
8 - A empresa decidiu que todas as televis�es de LCD receber�o um super desconto no pr�ximo m�s. O seu
	trabalho � fazer uma consulta � tabela DimProduct e retornar os ID's, Nomes e Pre�os de todos os 
	produtos LCD existentes.
*/


SELECT												-- 144 Registros
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice AS 'Pre�o'
FROM
	DimProduct
WHERE
	ProductName LIKE '%LCD%'	
ORDER BY 
	BrandName

/* -------------------------------------------------------------------------------------------------
9 - Fa�a uma lista com todos os produtos das cores: Green, Orange, Silver, Black e Pink. Esses produtos
	devem ser exclusivamente das marcas Contoso, Litware e Fabrikam.
*/


SELECT												-- 562 Registros
	*
FROM
	DimProduct
WHERE
	ColorName IN ('Green', 'Orange', 'Silver', 'Black', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')
ORDER BY 
	BrandName, ColorName
/* -------------------------------------------------------------------------------------------------
10 - A empresa possui 16 produtos da marca Contoso, da cor Silver e com um UnitPrice entre 10 e 30.
	Descubra quais s�o esses produtos e ordene o resultado em ordem descrecente de acordo com o pre�o
	(UnitPrice).
	PS.: O professor usou Wheight no exerc�cio ao inv�s de UnitPrice
*/

SELECT												-- 15 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY 
	UnitPrice DESC


SELECT												-- 16 Registros
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' AND ColorName = 'Silver' AND Weight BETWEEN 10 AND 30
ORDER BY 
	UnitPrice DESC
/* -------------------------------------------------------------------------------------------------
11 - 

*/

SELECT												-- 385 Registros
	
FROM
	
WHERE
	
ORDER BY 

/* -------------------------------------------------------------------------------------------------
12 - 

*/

SELECT												-- 385 Registros
	
FROM
	
WHERE
	
ORDER BY 

/* -------------------------------------------------------------------------------------------------*/