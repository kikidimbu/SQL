/* -------------------------------------------------------------------------------------------------
MANIPULANDO TEXTOS E DATAS NO SQL

LEN e DATALENGTH
CONCAT
LEFT e RIGHT
REPLACE, TRANSLATE e STUFF
UPPER e LOWER
FORMAT
CHARINDEX
SUBSTRING
TRIM, LTRIM E RTRIM
YEAR, MONTH e DAY
DATEFROMPARTS
GETDATE, SYSDATETIME
DATEPART
DATEADD
DATEDIFF
*/
/* -------------------------------------------------------------------------------------------------
LEN e DATA DATALENGTH: Retorna a quantidade de caraccteres de uma palavra.*/
-- Descubra a quantidade da palavra 'SQL Hashtag'
SELECT
	LEN('SQL Hash   tag') AS 'Len', -- Considera todos os espaços entre palavras
	DATALENGTH(' SQL Has   htag   ') AS 'DataLength' -- Considera todos os espaços antes e depois das palavras
/* -------------------------------------------------------------------------------------------------
CONCAT: Permite juntar mais de um texto em uma única palavra.*/
-- Faça uma consulta à tabela DimCustomer onde seja possível visualizar o nome completo de cada cliente.

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	CONCAT (FirstName, ' ',  LastName) AS 'Nome Completo',
	EmailAddress AS 'E-mail'
FROM 
	DimCustomer

/* -------------------------------------------------------------------------------------------------
LEFT AND RIGHT
LEFT: Extrai uma determinada quantidade de caracteres de um texto, da esquerda para a direita.
RIGHT: Extrai uma determinada quantidade de caracterere de um texto, da direita para a esquerda.*/
--


/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/

/* -------------------------------------------------------------------------------------------------*/