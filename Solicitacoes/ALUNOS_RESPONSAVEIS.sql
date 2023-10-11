--RESPONSÁVESI ALUNOS


DROP VIEW VW_ALUNOS_RESPONSAVEIS
CREATE VIEW VW_ALUNOS_RESPONSAVEIS AS 
SELECT distinct 
A.cd_escola,
A.cd_aluno AS COD_ALUNO, 
G.nm_responsavel AS RESPONSÁVEL,
G.NR_RG_RESPONSAVEL,
G.CD_DIGITO_RG_RESPONSAVEL,
G.SG_UF_RG_RESPONSAVEL,
G.CD_CPF_RESPONSAVEL,
G.cd_ddd_celular_responsavel AS DDD,
G.nr_celular_responsavel AS TEL_CELULAR,
G.nr_telefone_fixo_responsavel AS TEL_FIXO,
G.EMAIL_RESPONSAVEL,

A.an_letivo AS ANO_LETIVO, 
CONVERT(VARCHAR, A.CRDATE,103) AS CRDATE

FROM D_MATRICULA A 

LEFT JOIN D_RESPONSAVEL_ALUNO G ON A.cd_aluno=G.cd_aluno
WHERE 
A.st_matricula='1'
AND A.an_letivo=YEAR(GETDATE())
AND A.cd_serie_ensino IS NOT NULL
AND G.dt_fim IS NULL
--------------------------------------------
--SELECT * FROM VW_ALUNOS_RESPONSAVEIS