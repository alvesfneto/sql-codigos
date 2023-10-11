select * from SME_ESCOLAS_ATOS_CRIACAO



SELECT 'ANTES DE 1979' AS GESTAO,* 
INTO DIRETAS_POR_GESTAO
FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO <'1979-07-12'

UNION
--REINALDO DE BARROS
SELECT 'REINALDO DE BARROS' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1979-07-12' AND '1982-05-15'

UNION
--ANTONIO SALIM CURIATTI
SELECT 'ANTONIO SALIM CURIATI' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1982-05-13' AND '1983-03-14'

UNION
--MARIO COVAS
SELECT 'MARIO COVAS' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1983-05-11' AND '1985-12-31'

UNION
--JANIO QUADROS
SELECT 'JANIO QUADROS' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1986-01-01' AND '1988-12-31'

UNION
--LUIZA ERUNDINA
SELECT 'LUIZA ERUNDINA' AS GSTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1989-01-01' AND '1992-12-31'

UNION
--PAULO MALLUF
SELECT 'PAULO MALUF' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1993-01-01' AND '1996-12-31'

UNION
--CELSO PITTA
SELECT 'CELSO PITTA' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '1997-01-01' AND '2000-12-31'

UNION
--Marta Suplicy - 01/01/2001 a 31/12/2004
SELECT 'MARTA SUPLICY' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '2001-01-01' AND '2004-12-31'

UNION
--jose Serra - 01/01/2005 a 31/03/2006
SELECT 'JOSE SERRA' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '2005-01-01' AND '2006-03-31'

UNION
--Gilberto Kassab - 31/03/2006 a 31/12/2008 e Gilberto Kassab - 01/01/2009 a 31/12/2012
SELECT 'GILBERTO KASSAB',* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '2006-03-31' AND '2012-12-31'

UNION
--Fernendo Haddad - 01/01/2013 a 31/12/2016
SELECT 'FERNANDO HADDAD' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '2013-01-01' AND '2016-12-31'


UNION
--Jo�o D�ria - 01/01/2017 a 06/04/2018
SELECT 'JOAO DORIA' AS GESTAO, * FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '2017-01-01' AND '2018-04-06'

UNION
--Bruno Covas - 06/04/2018 a 31/12/2020 e Bruno Covas - 01/01/2021 a 16/05/2021
SELECT 'BRUNO COVAS' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO BETWEEN '2018-04-06' AND '2021-05-16'
/* caderno de dados gerenciais - 28/02/2018 - (CEI DIR + CEU CEI) = 362 + CEMEI = 9 TOTAL 371
								 30/04/2021 - (CEI DIR + CEU CEI) = 362 + CEMEI = 30 TOTAL 392
*/

UNION
--Ricardo Nunes - desde 16/05/2021
SELECT 'RICARDO NUNES' AS GESTAO,* FROM SME_ESCOLAS_ATOS_CRIACAO
WHERE DT_CRIACAO > '2021-05-06'
/* caderno de dados gerenciais - 30/04/2021 - (CEI DIR + CEU CEI) = 362 + CEMEI = 30 TOTAL 392
								 31/05/2023 - (CEI DIR + CEU CEI) = 362 + CEMEI = 30 TOTAL 392
*/

