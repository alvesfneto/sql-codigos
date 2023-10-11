
/*
Estamos em articula��o com a OIM/ONU e para seguirmos as tratativas, foi solicitado que os 
envi�ssemos dados sobre quantos estudantes imigrantes est�o matriculados na 
EJA do munic�pio, recorte de 
g�nero dos estudantes imigrantes, 
dados de perman�ncia desses estudantes e as 
nacionalidades dos matriculados da EJA.
*/
DROP TABLE ##ESTUDO_MIGRANTES_EJA
SELECT DISTINCT
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.SG_ETAPA AS ETAPA,
A.CD_ALUNO,
C.nm_pais_mec AS PA�S,
A.CD_SEXO_ALUNO AS SEXO,
ISNULL(CONVERT(VARCHAR,D.dt_entrada_pais,103),'') AS DT_ENTRADA_PA�S,
CONVERT(VARCHAR,D.dt_inclusao_cadastro, 103) AS DT_CADASTRO,
DATEDIFF(YY,D.dt_entrada_pais,getdate()) AS [TEMPO_PA�S(ANOS)],
DATEDIFF(YY,D.dt_inclusao_cadastro,getdate()) AS [TEMPO_RME(ANOS)]

INTO ##ESTUDO_MIGRANTES_EJA

FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN pais_mec C ON A.CD_PAIS_MEC=C.cd_pais_mec
JOIN D_ALUNO D ON A.CD_ALUNO=D.cd_aluno
WHERE A.CD_PAIS_MEC<>10 AND SG_ETAPA LIKE '%EJA%'

--SELECT * FROM ##ESTUDO_MIGRANTES_EJA
