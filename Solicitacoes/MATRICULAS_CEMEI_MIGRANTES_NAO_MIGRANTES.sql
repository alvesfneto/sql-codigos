
--Total de matr�cula por agrupamento nos CEMEIs

--DROP TABLE ##MATR_AGRUP_CEMEI
SELECT 
DRE,
B.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
--SG_ETAPA,
--CD_SERIE_ENSINO,
--SG_SERIE_ENSINO,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =1 THEN CD_ALUNO ELSE NULL END ) AS B1,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =4 THEN CD_ALUNO ELSE NULL END ) AS B2,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =27 THEN CD_ALUNO ELSE NULL END ) AS MG1,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =28 THEN CD_ALUNO ELSE NULL END ) AS MG2,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =321 THEN CD_ALUNO ELSE NULL END ) AS MG_UNIF,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =297 THEN CD_ALUNO ELSE NULL END ) AS INF_UNIF,
COUNT (CASE WHEN B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO IN (1,3,4,6,11,25,27,28,29,297,319,321,322,225,320,226) THEN CD_ALUNO ELSE NULL END ) AS MATR,
CONVERT(VARCHAR, (A.CRDATE-1),103) AS DT_BASE

INTO ##MATR_AGRUP_CEMEI
FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
WHERE B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO IN (1,3,4,6,11,25,27,28,29,297,319,321,322,225,320,226)
GROUP BY
DRE,
B.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
A.CRDATE
-----------------------------------------------------------------------------------------
--Total de matr�cula de crian�as que nasceram depois de 31/03 ( apenas para as crian�as da �ltima etapa/fase/ agrupamento do CEMEI - Infantil 2)
--INFANTIL UNIFICADO PARA 2023 (DT_NASCIMENTO_ALUNO BETWEEN '2017-04-17' AND '2019-03-31') �LTIMA FASE --> infantil II a partir de 01/04/2028

--DROP TABLE ##MATR_INF_NASC_MAR_2022_CEMEI
SELECT 
DRE,
B.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,

COUNT (CASE WHEN (B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO =297 AND DT_NASCIMENTO_ALUNO > '2018-04-01') THEN CD_ALUNO ELSE NULL END ) AS INF_UNIF,
CONVERT(VARCHAR, (A.CRDATE-1),103) AS DT_BASE
INTO ##MATR_INF_NASC_MAR_2022_CEMEI
FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
WHERE B.SG_TP_ESCOLA LIKE '%CEMEI%'-- AND CD_SERIE_ENSINO IN (1,3,4,6,11,25,27,28,29,297,319,321,322,225,320,226)
GROUP BY
DRE,
B.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
A.CRDATE




/*Total de matriculas de migrantes nos 31 CEMEIs;
Se tiver o n�mero de crian�as pretas, pardas , brancas e outros, ser� bastante interessante tamb�m.
*/

--DROP TABLE ##MATR_MIGRANTES_RACA_CEMEI
SELECT 
DRE,
B.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
COUNT (A.CD_ALUNO) AS MATRIC,
COUNT (DISTINCT CASE WHEN C.CD_NACIONALIDADE_ALUNO <>'B' THEN  A.CD_ALUNO ELSE NULL END) AS MIGRANTES,
COUNT (DISTINCT CASE WHEN C.CD_NACIONALIDADE_ALUNO ='B' THEN  A.CD_ALUNO ELSE NULL END) AS NAO_MIGRANTES,
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =1 THEN  A.CD_ALUNO ELSE NULL END) AS BRANCA,
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =2 THEN  A.CD_ALUNO ELSE NULL END) AS PRETA,
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =3 THEN  A.CD_ALUNO ELSE NULL END) AS PARDA,
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =4 THEN  A.CD_ALUNO ELSE NULL END) AS AMARELA,
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =5 THEN  A.CD_ALUNO ELSE NULL END) AS INDIGENA,
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =6 THEN  A.CD_ALUNO ELSE NULL END) AS [N�O INFORMADA],
COUNT (DISTINCT CASE WHEN C.tp_raca_cor =7 THEN  A.CD_ALUNO ELSE NULL END) AS [RECUSOU INFORMAR],
CONVERT(VARCHAR, (A.CRDATE-1),103) AS DT_BASE

INTO ##MATR_MIGRANTES_RACA_CEMEI

FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_ALUNO C ON A.CD_ALUNO=C.cd_aluno
WHERE B.SG_TP_ESCOLA LIKE '%CEMEI%' AND CD_SERIE_ENSINO IN (1,3,4,6,11,25,27,28,29,297,319,321,322,225,320,226)
GROUP BY
DRE,
B.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
A.CRDATE

/*
tp_raca_cor	cd_operador	dt_atualizacao_tabela	dc_raca_cor	dt_cancelamento
1	1       	2007-05-31 11:27:46.410	BRANCA	NULL
2	1       	2007-05-31 11:27:46.410	PRETA	NULL
3	1       	2007-05-31 11:27:46.410	PARDA	NULL
4	1       	2007-05-31 11:27:46.410	AMARELA	NULL
5	1       	2007-05-31 11:27:46.410	INDIGENA	NULL
6	1       	2007-05-31 11:27:46.410	NAO INFORMADA	NULL
7	3162    	2018-07-30 15:43:59.933	RECUSOU INFORMAR	NULL
*/

SELECT DISTINCT CRDATE FROM SME_ALUNOS_DIARIO


SELECT * FROM SME_ALUNOS_DIARIO WHERE CD_SERIE_ENSINO=297 --AND DT_NASCIMENTO_ALUNO >='2022-05-11 00:00:00.000'
ORDER BY DT_NASCIMENTO_ALUNO DESC

