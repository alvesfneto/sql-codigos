--LISTA DE ALUNOS COM INFORMA�OES DE ORIGEM/RACA/IDADE
--------------------------------------------------------------
USE Db_Local_0
--DROP TABLE ALUNOS_ORIGEM_RACA_IDADE
CREATE VIEW VW_ALUNOS_ORIGEM_RACA_IDADE AS
SELECT DISTINCT
E.DRE,
D.CD_ESCOLA,
E.SG_TP_ESCOLA,
E.NOMESC,
A.cd_aluno,
nm_aluno,
nm_social_aluno,
dt_nascimento_aluno,
sg_uf_nascimento_aluno,
cd_sexo_aluno,
B.dc_raca_cor,
C.nm_pais_mec,
cd_nacionalidade_aluno,
cd_nacionalidade_mae,
cd_nacionalidade_pai
cd_pais_origem_mae,
cd_pais_origem_pai,
A.nm_mae_aluno,
a.nm_pai_aluno,
cd_tipo_sigilo,
CAST(DATEDIFF(DD, DT_NASCIMENTO_ALUNO, GETDATE())/365.25 AS INT) AS IDADE,
CONVERT(VARCHAR,A.CRDATE-1, 103) AS DT_BASE

FROM D_ALUNO A
LEFT JOIN Bd_Local_Aux..tipo_raca_cor B ON A.tp_raca_cor=B.tp_raca_cor
LEFT JOIN [dbo].[PAIS_MEC] C ON A.cd_pais_mec = C.cd_pais_mec
INNER JOIN D_MATRICULA D ON A.cd_aluno=D.cd_aluno
JOIN SME_ESCOLA_DIARIO E ON D.cd_escola=E.CD_ESCOLA
WHERE D.st_matricula=1 AND D.cd_tipo_programa IS NULL
--SELECT top 10 * FROM VW_ALUNOS_ORIGEM_RACA_IDADE
-----------------------------------------------------------------------------------------



--LISTA DE ALUNOS MIGRANTES
DROP TABLE ##ALU_MIGRANTES
SELECT DISTINCT
A.DRE,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
A.NOMESC,
B.CD_ALUNO,
B.cd_sexo_aluno AS SEXO,
B.RACA,
B.IDADE,
B.nm_pais_mec AS PA�S,
B.CRDATE
INTO ##ALU_MIGRANTES
FROM SME_ESCOLA_DIARIO A 
JOIN ##ALUNOS_ORIGEM_RACA_IDADE B ON A.CD_ESCOLA=B.CD_ESCOLA
WHERE B.nm_pais_mec<>'BRASIL' AND REDE IN ('DIR','CONV') 
--SELECT * FROM ##ALU_MIGRANTES
-------------------------------------------------------------------------------------------
--QUANTIDADE DE ALUNOS MIGRANTES POR PA�S DE OR�GEM
DROP TABLE ##QTDE_MIGRANTES
SELECT DISTINCT
nm_pais_mec AS PA�S,
COUNT(cd_aluno) as MATRICULAS
INTO ##QTDE_MIGRANTES
FROM ##ALUNOS_ORIGEM_RACA_IDADE
WHERE nm_pais_mec is not null AND  nm_pais_mec<>'BRASIL'
GROUP BY nm_pais_mec WITH ROLLUP
--SELECT * FROM ##QTDE_MIGRANTES
--------------------------------------------------------------------------------------------

--SELECT TOP 1 * FROM D_MATRICULA
-------------------------------------------------------------------

DROP TABLE [##ALUNOS_50+]
SELECT DISTINCT
DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
A.CD_ALUNO,
C.dt_nascimento_aluno AS DT_NASC,
C.IDADE,
CONVERT(VARCHAR,A.CRDATE, 103) AS [CRDATE]
INTO [##ALUNOS_50+]
FROM SME_ALUNOS A
LEFT JOIN SME_ESCOLA B ON A.CD_ESCOLA=B.CD_ESCOLA
LEFT JOIN ##ALUNOS_ORIGEM_RACA_IDADE C ON A.CD_ALUNO=C.cd_aluno
WHERE C.IDADE >=50 AND A.SG_ETAPA IS NOT NULL 
--SELECT * FROM [##ALUNOS_50+]

------------------------------------------------------------------------------

DROP TABLE [##ALUNOS_90+]
SELECT DISTINCT
DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
A.CD_ALUNO,
C.dt_nascimento_aluno AS DT_NASC,
C.IDADE,
CONVERT(VARCHAR,A.CRDATE, 103) AS [CRDATE]
INTO [##ALUNOS_90+]
FROM SME_ALUNOS A
LEFT JOIN SME_ESCOLA B ON A.CD_ESCOLA=B.CD_ESCOLA
LEFT JOIN ##ALUNOS_ORIGEM_RACA_IDADE C ON A.CD_ALUNO=C.cd_aluno
WHERE C.IDADE >=90 AND A.SG_ETAPA IS NOT NULL
--select * from [##ALUNOS_90+]
--------------------------------------------------------
--ALUNOS ESTRANGEIROS COM IDADE, SEXO, RA�A, PAIS
--------------------------------------------------------
SELECT DISTINCT
A.DRE,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
A.NOMESC,
B.CD_ALUNO,
B.SG_ETAPA,
B.SG_SERIE_ENSINO AS S�RIE,
CONVERT(VARCHAR, B.DT_NASCIMENTO_ALUNO, 103) AS DT_NASC,
CAST(DATEDIFF(DD, B.DT_NASCIMENTO_ALUNO, GETDATE())/365.25 AS INT) AS IDADE,
B.CD_SEXO_ALUNO AS SEXO,
C.RACA,
D.nm_pais_mec AS PA�S,
CONVERT(VARCHAR, B.CRDATE, 103) AS CRDATE

FROM SME_ESCOLA A
RIGHT  JOIN SME_ALUNOS B ON A.CD_ESCOLA=B.CD_ESCOLA
LEFT JOIN Db_Local_Aux..TabRACACOR C ON B.TP_RACA_COR=C.ID_RACA
LEFT JOIN [dbo].[PAIS_MEC] D ON B.cd_pais_mec = D.cd_pais_mec
WHERE B.CD_PAIS_MEC <>10 AND SG_ETAPA IS NOT NULL

SELECT * FROM Db_Local_Aux..TabRACACOR

SELECT TOP 1 * FROM SME_ALUNOS

------------------------------------------------------------------

SELECT * FROM ##ALUNOS_ORIGEM_RACA_IDADE WHERE cd_sexo_aluno='F'
SELECT * FROM ##ALUNOS_ORIGEM_RACA_IDADE WHERE cd_sexo_aluno='M'
------------------------------------------------------------------
--CONTA ALUNOS POR SEXO/ETAPA ENSINO
------------------------------------------------------------------
SELECT 
SG_ETAPA AS ETAPA,
COUNT (DISTINCT CASE WHEN CD_SEXO_ALUNO = 'F' THEN CD_ALUNO ELSE NULL END) AS FEMININO,
COUNT (DISTINCT CASE WHEN CD_SEXO_ALUNO = 'M' THEN CD_ALUNO ELSE NULL END) AS MASCULINO
FROM SME_ALUNOS_DIARIO 
WHERE SG_ETAPA IS NOT NULL AND ST_MATRICULA =1
GROUP BY
SG_ETAPA WITH ROLLUP
------------------------------------------------------------------
--SELECT DISTINCT ST_MATRICULA FROM SME_ALUNOS_DIARIO


SELECT 
DRE,
A.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.CD_ALUNO,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
A.DT_NASCIMENTO_ALUNO,
DATEDIFF(MM,A.DT_NASCIMENTO_ALUNO,GETDATE()) AS IDADE_MESES

FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
WHERE SG_ETAPA = 'ED INF' 
	AND DT_NASCIMENTO_ALUNO>'2021-12-28 00:00:00.000'
	AND TP_ESCOLA IN(1,2,3,4,10,11,12,13,16,17,18,28,30,31)
GROUP BY
DRE,
A.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.CD_ALUNO,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
A.DT_NASCIMENTO_ALUNO
