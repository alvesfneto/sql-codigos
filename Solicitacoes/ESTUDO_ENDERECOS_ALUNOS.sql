/*
CÓDIGO QUE GERA TBL_ENDERECOS_ALUNOS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

DROP TABLE TBL_ENDERECOS_ALUNOS

SELECT distinct 
I.DRE,
I.CD_ESCOLA,
I.SG_TP_ESCOLA,
I.NOMESC AS NOME_ESCOLA,
CONCAT(I.ENDERECO,', ',I.NR,' ',I.COMPL,' ',I.BAIRRO) AS END_ESCOLA,
I.CD_DIST,
I.CD_SUB_PREFEITURA,
I.CD_COORDENADA_GEO_Y AS LAT_ESCOLA,
I.CD_COORDENADA_GEO_X AS LON_ESCOLA,
H.SG_ETAPA AS ETAPA,
H.SG_SERIE_ENSINO AS SERIE_ANO,
A.cd_aluno AS COD_ALUNO, 
H.NM_ALUNO AS NOME_ALUNO,
H.NM_MAE_ALUNO AS MÃE_ALUNO,
G.nm_responsavel AS RESPONSÁVEL,
G.NR_RG_RESPONSAVEL,
G.CD_DIGITO_RG_RESPONSAVEL,
G.SG_UF_RG_RESPONSAVEL,
G.CD_CPF_RESPONSAVEL,
G.cd_ddd_celular_responsavel AS DDD,
G.nr_celular_responsavel AS TEL_CELULAR,
G.nr_telefone_fixo_responsavel AS TEL_FIXO,
G.EMAIL_RESPONSAVEL,
CONCAT(E.dc_tp_logradouro,'',D.nm_logradouro,', ', D.cd_nr_endereco,',', D.dc_complemento_endereco,' ', D.nm_bairro,' ',D.cd_cep) AS END_ALUNO,
D.cd_distrito_mec AS DISTR_ALU,
D.cd_sub_prefeitura AS SUB_ALU,
D.cd_coordenada_geo_y AS LAT_ALUNO, 
D.cd_coordenada_geo_x AS LON_ALUNO,
A.qt_distancia AS DIST_ESCOLA,
A.qt_distancia_carro AS DIST_CARRO,
A.an_letivo AS ANO_LETIVO, 
CONVERT(VARCHAR, A.CRDATE,103) AS CRDATE

INTO TBL_ENDERECOS_ALUNOS

FROM D_MATRICULA A 
INNER JOIN ((D_ENDERECO_ALUNO B
INNER JOIN D_endereco_aluno_tipo_endereco C ON B.cd_endereco_aluno = C.cd_endereco_aluno) 
INNER JOIN D_endereco D ON B.ci_endereco = D.ci_endereco) ON A.cd_aluno = B.cd_aluno
INNER JOIN D_TIPO_LOGRADOURO E ON D.tp_logradouro= E.tp_logradouro
INNER JOIN TIPO_ENDERECO F ON C.ci_tipo_endereco =F.ci_tipo_endereco
LEFT JOIN D_RESPONSAVEL_ALUNO G ON A.cd_aluno=G.cd_aluno
LEFT JOIN SME_ALUNOS_DIARIO H ON A.cd_aluno=H.CD_ALUNO
LEFT JOIN SME_ESCOLA_DIARIO I ON H.CD_ESCOLA=I.CD_ESCOLA
WHERE B.dt_fim Is Null 
AND A.st_matricula='1'
AND A.an_letivo=YEAR(GETDATE())
AND C.dt_fim Is Null
AND F.ci_tipo_endereco='1'
AND G.dt_fim IS NULL
AND I.TP_ESCOLA IN (1,2,3,4,10,11,12,13,16,17,18,28,30,31,32,33) AND H.SG_ETAPA IS NOT NULL

--SELECT * FROM TBL_ENDERECOS_ALUNOS

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

--SELEÇÃO DAS ESCOLAS E ALUNOS CUJOS ENDEREÇOS ESTÃO NAS SUBPREFEIRUAS ESPECIFICADAS
-- * Butantã
-- * Cidade Ademar
-- * Capela do Socorro
-- * Guaianases
-- * Itaquera
-- * M'Boi Mirim
-- * Parelheiros
-- * Penha
-- * Vila Prudente
--------------------------------------------------------------------------------------------------

DROP TABLE ##ALUNOS_ESCOLAS_SUB_ESPECIFICA

SELECT DRE,CD_ESCOLA,SG_TP_ESCOLA,NOME_ESCOLA, END_ESCOLA,B.dc_sub_prefeitura AS SUB_ESCOLA,LAT_ESCOLA,LON_ESCOLA,
	   ETAPA,SERIE_ANO,COD_ALUNO,NOME_ALUNO,END_ALUNO, B.dc_sub_prefeitura AS SUB_ALUNO, LAT_ALUNO,LON_ALUNO
INTO ##ALUNOS_ESCOLAS_SUB_ESPECIFICA
FROM TBL_ENDERECOS_ALUNOS A
LEFT JOIN D_SUB_PREFEITURA B ON A.CD_SUB_PREFEITURA=B.cd_sub_prefeitura
LEFT JOIN D_SUB_PREFEITURA C ON A.SUB_ALU=C.cd_sub_prefeitura
WHERE 
A.cd_sub_prefeitura in (50,56,59,85,67,58,60,61,69)


OR
A.SUB_ALU in (50,56,59,85,67,58,60,61,69))
--SELECT * FROM ##ALUNOS_ESCOLAS_SUB_ESPECIFICA

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/


