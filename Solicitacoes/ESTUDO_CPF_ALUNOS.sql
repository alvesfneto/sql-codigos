--ESTUDO ALUNOS - CPF

SELECT TOP 1 * FROM D_ALUNO
DROP TABLE ##ALUNOS_EJA_SEM_CPF
SELECT 
DRE,
A.CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
M�E_ALUNO,
CONVERT(VARCHAR,dt_nascimento_aluno, 103) AS DT_NASC,
cd_inep_aluno,
cd_cpf_aluno,
A.CRDATE
INTO ##ALUNOS_EJA_SEM_CPF
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN D_ALUNO B ON A.COD_ALUNO=B.cd_aluno
WHERE cd_cpf_aluno is null AND ETAPA LIKE '%EJA%'
--SELECT * FROM ##ALUNOS_EJA_SEM_CPF

--------------------------------

DROP TABLE ##ALUNOS_INEP_EOL_CPF
SELECT 
ANO_LETIVO,
COD_ALUNO,
--NOME_ALUNO,
--M�E_ALUNO,
CONVERT(VARCHAR,dt_nascimento_aluno, 103) AS DT_NASC,
cd_inep_aluno,
cd_cpf_aluno,
A.CRDATE
INTO ##ALUNOS_INEP_EOL_CPF
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN D_ALUNO B ON A.COD_ALUNO=B.cd_aluno
WHERE cd_cpf_aluno is not null AND cd_inep_aluno is not null AND ANO_LETIVO = '2023'
--SELECT * FROM ##ALUNOS_INEP_EOL_CPF

---------------------------------------

DROP TABLE ##ALUNOS_NM_MAE_INEP_EOL_CPF
SELECT 
ANO_LETIVO,
COD_ALUNO,
NOME_ALUNO,
M�E_ALUNO,
CONVERT(VARCHAR,dt_nascimento_aluno, 103) AS DT_NASC,
cd_inep_aluno,
cd_cpf_aluno,
A.CRDATE
INTO ##ALUNOS_NM_MAE_INEP_EOL_CPF
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN D_ALUNO B ON A.COD_ALUNO=B.cd_aluno
WHERE cd_cpf_aluno is not null AND cd_inep_aluno is not null AND ANO_LETIVO = '2023'
--SELECT * FROM ##ALUNOS_NM_MAE_INEP_EOL_CPF

-------------------------------------------


DROP TABLE ##ALUNOS_INEP_CPF_NM_MAE_NASC
SELECT 
DRE,
A.CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
M�E_ALUNO,
CONVERT(VARCHAR,dt_nascimento_aluno, 103) AS DT_NASC,
cd_inep_aluno,
cd_cpf_aluno,
A.CRDATE

INTO ##ALUNOS_INEP_CPF_NM_MAE_NASC
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN D_ALUNO B ON A.COD_ALUNO=B.cd_aluno
WHERE ETAPA IS NOT NULL

--SELECT * FROM ##ALUNOS_INEP_CPF_NM_MAE_NASC