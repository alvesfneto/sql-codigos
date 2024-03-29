/*
Pesquisa de escolas da rede municipal criadas por gest�o
*/

DROP TABLE SME_ESCOLAS_ATOS_CRIACAO_GESTAO
SELECT DISTINCT

*,
CASE 
	WHEN DT_CRIACAO <'1951-02-01' THEN 'ANTERIOR A 01/02/1951'
	--Ulimo prefeito da Era Vargas e Quarta Rep�blica: prefeitos nomeados (1930�1953)
	WHEN DT_CRIACAO BETWEEN '1951-02-01' AND '1953-04-07' THEN 'ARMANDO DE ARRUDA PEREIRA'
	--Fase democr�tica da Quarta Rep�blica e �ltimas elei��es na ditadura (1953�1969)
	WHEN DT_CRIACAO BETWEEN '1953-04-08' AND '1955-01-30' THEN 'JANIO QUADROS 1'
	WHEN DT_CRIACAO BETWEEN '1955-01-31' AND '1955-06-21' THEN 'WILLIAN SALEM'
	WHEN DT_CRIACAO BETWEEN '1955-06-22' AND '1956-04-12' THEN 'JUVENALO LINO DE MATOS'
	WHEN DT_CRIACAO BETWEEN '1956-04-13' AND '1957-04-07' THEN 'VLADIMIR DE TOLODO PIZA'
	WHEN DT_CRIACAO BETWEEN '1957-04-08' AND '1961-04-07' THEN 'ADEMAR DE BARROS'
	WHEN DT_CRIACAO BETWEEN '1961-04-08' AND '1965-04-07' THEN 'PRESTES MAIA'
	WHEN DT_CRIACAO BETWEEN '1965-04-08' AND '1969-04-07' THEN 'JOSE VICENTE FARIA LIMA'
	--Ditadura militar: prefeitos bi�nicos (1969�1986)
	WHEN DT_CRIACAO BETWEEN '1969-04-08' AND '1971-04-07' THEN 'PAULO MALUF 1'
	WHEN DT_CRIACAO BETWEEN '1971-04-08' AND '1973-08-21' THEN 'JOSE CARLOS DE FIGUEIREDO FERRAZ'
	WHEN DT_CRIACAO BETWEEN '1973-08-22' AND '1973-08-27' THEN 'BRASIL VITA'
    WHEN DT_CRIACAO BETWEEN '1973-08-28' AND '1975-08-16' THEN 'MIGUEL COLASUONNO'
	WHEN DT_CRIACAO BETWEEN '1975-08-17' AND '1979-06-11' THEN 'OLAVO SETUBAL'
	WHEN DT_CRIACAO BETWEEN '1979-06-12' AND '1982-05-14' THEN 'REINALDO DE BARROS'
	WHEN DT_CRIACAO BETWEEN '1982-05-15' AND '1983-03-14' THEN 'ANTONIO SALIM CURIATTI'
	WHEN DT_CRIACAO BETWEEN '1983-03-15' AND '1983-05-10' THEN 'FRANCISCO ALTINO LIMA
'	WHEN DT_CRIACAO BETWEEN '1983-05-11' AND '1985-12-31' THEN 'MARIO COVAS'
    --Sexta Rep�blica (1986�2023)
	WHEN DT_CRIACAO BETWEEN '1986-01-01' AND '1988-12-31' THEN 'JANIO QUADROS 2'
	WHEN DT_CRIACAO BETWEEN '1989-01-01' AND '1992-12-31' THEN 'LUIZA ERUNDINA'
	WHEN DT_CRIACAO BETWEEN '1993-01-01' AND '1996-12-31' THEN 'PAULO MALUF 2'
	WHEN DT_CRIACAO BETWEEN '1997-01-01' AND '2000-12-31' THEN 'CELSO PITTA'
	WHEN DT_CRIACAO BETWEEN '2001-01-01' AND '2004-12-31' THEN 'MARTA SUPLICY'
	WHEN DT_CRIACAO BETWEEN '2005-01-01' AND '2006-03-31' THEN 'JOSE SERRA'
	WHEN DT_CRIACAO BETWEEN '2006-04-01' AND '2008-12-31' THEN 'GILBERTO KASSAB 1'
	WHEN DT_CRIACAO BETWEEN '2009-01-01' AND '2012-12-31' THEN 'GILBERTO KASSAB 2'
	WHEN DT_CRIACAO BETWEEN '2013-01-01' AND '2016-12-31' THEN 'FERNANDO HADDAD'
	WHEN DT_CRIACAO BETWEEN '2017-01-01' AND '2018-04-05' THEN 'JO�O DORIA'
	WHEN DT_CRIACAO BETWEEN '2018-04-06' AND '2021-05-16' THEN 'BRUNO COVAS 1'
	WHEN DT_CRIACAO >'2021-05-17'THEN 'RICARDO NUNES'
ELSE NULL END AS GESTAO

INTO SME_ESCOLAS_ATOS_CRIACAO_GESTAO
FROM SME_ESCOLAS_ATOS_CRIACAO
--SELECT * FROM SME_ESCOLAS_ATOS_CRIACAO_GESTAO
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
--RESUMO ATIVAS
SELECT
GESTAO AS PREFEITO,
COUNT (Distinct Case When SG_TP_ESCOLA = 'EMEF' THEN CD_ESCOLA ELSE NULL END) AS EMEF,
COUNT (Distinct Case When SG_TP_ESCOLA = 'CEU EMEF' THEN CD_ESCOLA ELSE NULL END) AS [CEU EMEF],
COUNT (Distinct Case When SG_TP_ESCOLA = 'EMEFM' THEN CD_ESCOLA ELSE NULL END) AS EMEFM,
COUNT (Distinct Case When SG_TP_ESCOLA = 'EMEI' THEN CD_ESCOLA ELSE NULL END) AS EMEI,
COUNT (Distinct Case When SG_TP_ESCOLA = 'CEU EMEI' THEN CD_ESCOLA ELSE NULL END) AS [CEU EMEI],
COUNT (Distinct Case When SG_TP_ESCOLA = 'CEI DIRET' THEN CD_ESCOLA ELSE NULL END) AS [CEI DIRET],
COUNT (Distinct Case When SG_TP_ESCOLA = 'CEU CEI' THEN CD_ESCOLA ELSE NULL END) AS [CEU CEI],
COUNT (Distinct Case When SG_TP_ESCOLA = 'CEMEI' THEN CD_ESCOLA ELSE NULL END) AS CEMEI,
COUNT (Distinct Case When SG_TP_ESCOLA = 'CEU CEMEI' THEN CD_ESCOLA ELSE NULL END) AS [CEU CEMEI],
COUNT (Distinct Case When SG_TP_ESCOLA = 'EMEBS' THEN CD_ESCOLA ELSE NULL END) AS EMEBS,
COUNT (Distinct Case When SG_TP_ESCOLA = 'CCI/CIPS' THEN CD_ESCOLA ELSE NULL END) AS [CCI/CIPS],
COUNT (Distinct Case When SG_TP_ESCOLA = 'CIEJA' THEN CD_ESCOLA ELSE NULL END) AS CIEJA,
COUNT (Distinct Case When SG_TP_ESCOLA = 'CMCT' THEN CD_ESCOLA ELSE NULL END) AS CMCT,
COUNT (Distinct Case When SG_TP_ESCOLA = 'CECI' THEN CD_ESCOLA ELSE NULL END) AS CECI,
COUNT (Distinct Case When SG_TP_ESCOLA = 'E TEC' THEN CD_ESCOLA ELSE NULL END) AS [E TEC],
Count (Distinct CD_ESCOLA) AS 'TOTAL'
INTO SME_ESCOLAS_ATOS_CRIACAO_GESTAO_RESUMO
FROM SME_ESCOLAS_ATOS_CRIACAO_GESTAO
WHERE SITUACAO='ESCOLA ATIVA'

GROUP BY GESTAO WITH ROLLUP

--SELECT * FROM SME_ESCOLAS_ATOS_CRIACAO_GESTAO_RESUMO


