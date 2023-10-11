
--Planilha com dados de matrículas de migrantes internacionais por sexo, raça, UE e DRE.

SELECT
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.CD_ALUNO,
C.nm_pais_mec AS PAIS_ORIGEM,
D.DC_RACA_COR AS RAÇA,
CD_SEXO_ALUNO,
CONVERT(VARCHAR, A.CRDATE-1, 103) AS DT_BASE
INTO ##1
FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA = B.CD_ESCOLA
JOIN pais_eol_mec C ON A.CD_PAIS_MEC=C.cd_pais_mec
JOIN tipo_raca_cor D ON A.TP_RACA_COR=D.tp_raca_cor
WHERE A.CD_PAIS_MEC<>10 AND A.SG_ETAPA IS NOT NULL
--------------------------------------------------------------------------------------------------------------------
--Planilha com dados de distribuição de matrículas migrantes por modalidade de ensino, 
--especificando: EMEI, CEI, FUND I, FUND II, EJA I, EJA II, MOVA, ensino médio, ED. Especial e ED. Profissional.


--DROP TABLE ##2
SELECT
--B.DRE,
--B.CD_ESCOLA,
B.SG_TP_ESCOLA,
--B.NOMESC,
A.SG_ETAPA,
COUNT (DISTINCT CASE WHEN (CD_ETAPA_ENSINO IN(1,2,3,5,6,7,8,9,10,11,13,17,14,18) or CD_TIPO_PROGRAMA=45) THEN CD_ALUNO ELSE NULL END)  AS MATR,
CONVERT(VARCHAR, A.CRDATE-1, 103) AS DT_BASE
INTO ##2
FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA = B.CD_ESCOLA
JOIN pais_eol_mec C ON A.CD_PAIS_MEC=C.cd_pais_mec
JOIN tipo_raca_cor D ON A.TP_RACA_COR=D.tp_raca_cor
WHERE A.CD_PAIS_MEC<>10 
	  AND (A.SG_ETAPA IS NOT NULL or CD_TIPO_PROGRAMA=45)
	  
	  AND B.TP_ESCOLA IN (1,2,3,4,10,11,12,13,16,17,18,22,28,30,31,32,33)

GROUP BY
--B.DRE,
--B.CD_ESCOLA,
B.SG_TP_ESCOLA,
--B.NOMESC,
A.SG_ETAPA,
A.CRDATE
------------------------------------------------------------------------------------------------------

--Planilha com dados de matrículas de brasileiros/as cujos responsáveis nasceram fora do país. 

SELECT
C.DRE,
C.CD_ESCOLA,
C.SG_TP_ESCOLA,
C.NOMESC,
B.SG_ETAPA,
B.CD_ALUNO, 
B.NM_ALUNO, 
B.NM_MAE_ALUNO,
B.nm_pai_aluno, 
B.cd_nacionalidade_aluno, 
A.cd_nacionalidade_mae, 
A.cd_nacionalidade_pai 
INTO ##3
from D_ALUNO A
JOIN SME_ALUNOS_DIARIO B ON A.cd_aluno=B.CD_ALUNO
JOIN SME_ESCOLA_DIARIO C ON B.CD_ESCOLA=C.CD_ESCOLA

WHERE A.cd_nacionalidade_aluno='B' 
	  AND (cd_nacionalidade_mae<>'B' OR cd_nacionalidade_pai<>'B')
	  AND B.SG_ETAPA IS NOT NULL
--------------------------------------------------------------------------------------------------S

--Planilha com dados de matrículas de brasileiros/as nascidos fora do estado de SP. 


SELECT
C.DRE,
C.CD_ESCOLA,
C.SG_TP_ESCOLA,
C.NOMESC,
B.SG_ETAPA,
B.CD_ALUNO, 
B.NM_ALUNO, 
D.nm_municipio AS MUNIC_NASC,
D.sg_uf AS UF_NASC
INTO ##4
from D_ALUNO A
JOIN SME_ALUNOS_DIARIO B ON A.cd_aluno=B.CD_ALUNO
JOIN SME_ESCOLA_DIARIO C ON B.CD_ESCOLA=C.CD_ESCOLA
JOIN D_MUNICIPIO D ON A.cd_municipio_nascimento=D.cd_municipio
WHERE B.SG_ETAPA IS NOT NULL AND D.sg_uf<>'SP'

--------------------------------------------------------------------------------------------------------------------------




/*SELECT TOP 10 * FROM D_MUNICIPIO

SELECT TOP 1 * FROM SME_ALUNOS_DIARIO
SELECT * FROM tipo_raca_cor
SELECT * FROM D_TIPO_ESCOLA

SELECT * FROM D_ETAPA_ENSINO WHERE dt_cancelamento IS NULL

SELECT * FROM D_TIPO_PROGRAMA
*/










