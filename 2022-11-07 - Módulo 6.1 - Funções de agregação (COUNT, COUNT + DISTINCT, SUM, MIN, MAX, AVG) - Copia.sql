/* -------------------------------------------------------------------------------------------------
1 - Você é o gerente da área de compras e precisa gerar um relatório com as TOP 100 vendas,
	de acordo com a quantidade vendida. Você precisa fazer isso em 10 minutos pois o diretor de
	compras solicitou essa informação para apresentar em uma reunião. 
	Utilize seus conhecimentos em SQL para encontrar essas TOP 100 vendas de acordo com o total
	vendido (SalesAmount).
	PS.: Na correção o professor usou a coluna SalesQuantity ao invés de SalesAmount
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
 2 - Os top 10 produtos com maior UnitPrice possuem exatamente o mesmo preço, porém a empresa quer
	diferenciar esses preços de acordo com o peso (weight)de cada um. 
	O que você precisará fazer é ordenar esses TOP 10 produtos de acordo com a coluna de UnitPrice
	e, além disso, estabelecer um critério de desempate, para que seja mostrado na ordem, do maior
	para o menor.
	Caso ainda haja um empate entre dois ou mais produtos, pense em uma forma de criar um segundo
	critério de desempate.
*/ 

SELECT												-- 100 Registros
	TOP (100)* 
FROM
	DimProduct
ORDER BY 
	UnitPrice DESC, Weight DESC, Manufacturer

SELECT												-- 10 Registros
	TOP (10) ProductName AS 'Produto',
	UnitPrice AS 'Preço Unitário',
	Weight AS 'Peso',
	Manufacturer AS 'Fabricante'
FROM
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, Manufacturer


SELECT												-- 10 Registros
	TOP (10) ProductName AS 'Produto',
	UnitPrice AS 'Preço Unitário',
	Weight AS 'Peso',
	AvailableForSaleDate AS 'Disponibilizado à venda em:'
FROM
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate

/* -------------------------------------------------------------------------------------------------
3 - Você é o responsável pelo setor de logística da empresa Contoso e precisa dimensionar o transporte
	de todos os produtos em categorias, de acordo com o peso.
	Os produtos da Categoria A, com peso acima de 100kg deverão ser transpotados na primeira leva.
	Faça uma consulta no banco de dados para descobrir quais são esses produtos que estão na categoria
	A.
	a) Você deverá retornar apenas duas colunas nesta consulta: Nome do Produto e Peso.
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
4 - Você foi alocado para criar um relatório das lojas registradas atualmente na Contoso.
	a) Descubra quantas lojas a empresa tem no total. Na consulta que você deverá fazer à tabela 
	DimStore retorne as seguintes informações StoreName, OpenDate, EmployeeCount
	b) Renomeie as colunas anteriores para deixar a consulta mais intuitiva.
	c) Dessas lojas, descubra quantas e quais ainda estão ativas.
*/
SELECT												-- 1000 Registros
	TOP(1000)*
FROM
	DimStore


SELECT												-- 286 Registros
	StoreName AS 'Lojas Ativas',
	OpenDate AS 'Inaugurada em:',
	EmployeeCount AS 'Funcionários'
FROM
	DimStore
WHERE
	StoreType = 'Store' AND EmployeeCount IS NOT NULL AND Status = 'On'
ORDER BY 
	OpenDate DESC


SELECT												-- 12 Registros
	StoreName AS 'Lojas Inativas',
	OpenDate AS 'Inaugurada em:',
	EmployeeCount AS 'Funcionários'
FROM
	DimStore
WHERE
	StoreType = 'Store' AND EmployeeCount IS NOT NULL AND CloseDate IS NOT NULL
ORDER BY 
	OpenDate DESC

/* -------------------------------------------------------------------------------------------------
5 - O gerente da área de controle de qualidade notificou à Contoso que todos os produtos Home Theater
	da marca Litware, disponibilizados para a venda no dia 15 de março de 2009, foram identificados
	com defeitos de fábrica.
	O que você deverá fazer é identificar os ID's desses produtos e repassar ao gerente para que ele
	possas notificar as lojas e consequentemente solicitar a suspensão das vendas desses produtos.
*/

 
SELECT												-- 3 Registros
	ProductKey AS 'ID',
	ProductName AS 'Produtos',
	BrandName AS 'Marca',
	AvailableForSaleDate AS 'Disponível para venda em:'
FROM
	DimProduct
WHERE
	AvailableForSaleDate = '20090315' -- Para fazer consulta em campos Date/Time é preciso tirar os traços entre os dados, já nos campos data, pode-se utilizar normalmente.
	AND ProductName LIKE '%Home Theater%' 
	AND BrandName = 'Litware'
ORDER BY 
	AvailableForSaleDate DESC

/* -------------------------------------------------------------------------------------------------
6 - Imagine que você precise extrair um relatório da tabela DimStore, com informações de lojas. Mas
	você precisa apenas das lojas que não estão mais funcionando atualmente.
	a) Utilize a coluna de status para filtrar a tabela e trazer apenas as lojas que não estão mais
	funcionando.
	b) Agora imagine que essa coluna de status não existe na sua tabela, qual seria a outra forma 
	que você teria para descobrir quais são as lojas que não estão mais funcionando.
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
7 - De acordo com a quantidade de funcionários, cada loja receberá uma determinada quantidade de
	máquinas de café. As lojas serão divididas em três categorias:
		CATEGORIA 1 - De 1 a 20 funcionários - 1 máquina de café;
		CATEGORIA 2 - De 21 a 50 funcionários - 2 máquinas de café;
		CATEGORIA 3 - Acima de 51 funcionários - 3 máquinas de café
	Identifique para cada caso, quais são as lojas de cada uma das três categorias acima (basta fazer
	uma verificação).
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
8 - A empresa decidiu que todas as televisões de LCD receberão um super desconto no próximo mês. O seu
	trabalho é fazer uma consulta à tabela DimProduct e retornar os ID's, Nomes e Preços de todos os 
	produtos LCD existentes.
*/


SELECT												-- 144 Registros
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice AS 'Preço'
FROM
	DimProduct
WHERE
	ProductName LIKE '%LCD%'	
ORDER BY 
	BrandName

/* -------------------------------------------------------------------------------------------------
9 - Faça uma lista com todos os produtos das cores: Green, Orange, Silver, Black e Pink. Esses produtos
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
	Descubra quais são esses produtos e ordene o resultado em ordem descrecente de acordo com o preço
	(UnitPrice).
	PS.: O professor usou Wheight no exercício ao invés de UnitPrice
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