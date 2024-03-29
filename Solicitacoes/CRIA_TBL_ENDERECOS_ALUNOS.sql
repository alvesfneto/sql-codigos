--DADOS DE ENDERECO RESIDENCIAL ALUNO E INFORMA��ES DE RESPONSAVEIS
------------------------------------------------------------

USE Db_Local_0
IF EXISTS 
(SELECT 'TRUE' FROM Db_Local_0..SYSOBJECTS WHERE NAME ='TBL_ENDERECOS_ALUNOS')
DROP TABLE TBL_ENDERECOS_ALUNOS

SELECT distinct 
I.DRE,
I.CD_ESCOLA,
I.SG_TP_ESCOLA,
I.NOMESC AS NOME_ESCOLA,
H.SG_ETAPA AS ETAPA,
H.SG_SERIE_ENSINO AS SERIE_ANO,
A.cd_aluno AS COD_ALUNO, 
H.NM_ALUNO AS NOME_ALUNO,
H.NM_MAE_ALUNO AS M�E_ALUNO,
G.nm_responsavel AS RESPONS�VEL,
G.cd_ddd_celular_responsavel AS DDD,
G.nr_celular_responsavel AS TEL_CELULAR,
G.nr_telefone_fixo_responsavel AS TEL_FIXO,
--B.ci_endereco, 
--B.dt_inicio, 
--B.dt_fim, 
--B.in_endereco_confere, 
--C.ci_tipo_endereco, 
--D.tp_logradouro,
--F.dc_tipo_endereco,
E.dc_tp_logradouro AS TP_LOGRADOURO,
D.sg_titulo_logradouro, 
D.nm_logradouro AS ENDERE�O, 
D.cd_nr_endereco AS NR, 
D.dc_complemento_endereco AS COMPL, 
D.nm_bairro AS BAIRRO, 
D.cd_cep AS CEP, 
--D.cd_logradouro, 
--D.cd_micro_regiao, 
--D.cd_sql_endereco, 
--D.tp_localizacao_endereco, 
--B.dt_atualizacao_tabela, 
--B.cd_operador, 
D.DC_distrito_mec AS DISTRITO, 
--D.cd_municipio, 
D.cd_coordenada_geo_y AS LAT_ALUNO, 
D.cd_coordenada_geo_x AS LON_ALUNO,
A.qt_distancia AS DIST_ESCOLA,
A.qt_distancia_carro AS DIST_CARRO,
--A.st_matricula, 
A.an_letivo AS ANO_LETIVO, 
CONVERT(VARCHAR, A.CRDATE,103) AS CRDATE
into TBL_ENDERECOS_ALUNOS
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

-----------------------------------------------------------------------------------------------------------------------

--SELECT * INTO ##ALUNOS_400089 FROM TBL_ENDERECOS_ALUNOS WHERE CD_ESCOLA=400089

--SELECT * INTO ##MATRICULAS_309717 FROM TBL_ENDERECOS_ALUNOS WHERE CD_ESCOLA=309717

--SELECT * INTO ##ENDERECOS_MGII_IP FROM TBL_ENDERECOS_ALUNOS WHERE DRE='DRE - IP' AND SERIE_ANO='MG II'

select * from TBL_ENDERECOS_ALUNOS where COD_ALUNO=8158066
-----------------------------------------------------------------------------


SELECT CD_ESCOLA,SG_TP_ESCOLA, NOME_ESCOLA,ETAPA,COD_ALUNO,NOME_ALUNO,DIST_ESCOLA,DIST_CARRO,CRDATE from TBL_ENDERECOS_ALUNOS where COD_ALUNO=8158066

select CD_ESCOLA, SG_TP_ESCOLA, NOMESC, ENDERECO, NR,CD_COORDENADA_GEO_Y,CD_COORDENADA_GEO_X from SME_ESCOLA_DIARIO where CD_ESCOLA='092231'



IF EXISTS 
(SELECT 'TRUE' FROM Db_Local_0..SYSOBJECTS WHERE NAME ='TBL_ENDERECOS_ALUNOS_2023')
DROP TABLE TBL_ENDERECOS_ALUNOS_2023
SELECT distinct 
I.DRE,
I.CD_ESCOLA,
I.SG_TP_ESCOLA,
I.NOMESC AS NOME_ESCOLA,
H.SG_ETAPA AS ETAPA,
H.SG_SERIE_ENSINO AS SERIE_ANO,
A.cd_aluno AS COD_ALUNO, 
H.NM_ALUNO AS NOME_ALUNO,
H.NM_MAE_ALUNO AS M�E_ALUNO,
G.nm_responsavel AS RESPONS�VEL,
G.cd_ddd_celular_responsavel AS DDD,
G.nr_celular_responsavel AS TEL_CELULAR,
G.nr_telefone_fixo_responsavel AS TEL_FIXO,
--B.ci_endereco, 
--B.dt_inicio, 
--B.dt_fim, 
--B.in_endereco_confere, 
--C.ci_tipo_endereco, 
--D.tp_logradouro,
--F.dc_tipo_endereco,
E.dc_tp_logradouro AS TP_LOGRADOURO,
--D.sg_titulo_logradouro, 
D.nm_logradouro AS ENDERE�O, 
D.cd_nr_endereco AS NR, 
D.dc_complemento_endereco AS COMPL, 
D.nm_bairro AS BAIRRO, 
D.cd_cep AS CEP, 
--D.cd_logradouro, 
--D.cd_micro_regiao, 
--D.cd_sql_endereco, 
--D.tp_localizacao_endereco, 
--B.dt_atualizacao_tabela, 
--B.cd_operador, 
--D.cd_distrito_mec AS DISTRITO, 
--D.cd_municipio, 
D.cd_coordenada_geo_y AS LAT_ALUNO, 
D.cd_coordenada_geo_x AS LON_ALUNO,
FLOOR(SQRT(POWER((D.cd_coordenada_geo_y * 1000000 - (I.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
				 POWER((D.cd_coordenada_geo_x * 1000000 - (I.CD_COORDENADA_GEO_X * 1000000)),2)) / 10)/0.6 AS DIST_ALU_ESCOLA,
--A.st_matricula, 
A.an_letivo AS ANO_LETIVO, 
CONVERT(VARCHAR, A.CRDATE,103) AS CRDATE
INTO TBL_ENDERECOS_ALUNOS_2023
FROM D_MATRICULA A 
INNER JOIN ((D_ENDERECO_ALUNO B
INNER JOIN D_endereco_aluno_tipo_endereco C ON B.cd_endereco_aluno = C.cd_endereco_aluno) 
INNER JOIN D_endereco D ON B.ci_endereco = D.ci_endereco) ON A.cd_aluno = B.cd_aluno
INNER JOIN D_TIPO_LOGRADOURO E ON D.tp_logradouro= E.tp_logradouro
INNER JOIN Bd_Local_Aux..TIPO_ENDERECO F ON C.ci_tipo_endereco =F.ci_tipo_endereco
LEFT JOIN D_RESPONSAVEL_ALUNO G ON A.cd_aluno=G.cd_aluno
LEFT JOIN SME_ALUNOS_DIARIO H ON A.cd_aluno=H.CD_ALUNO
LEFT JOIN SME_ESCOLA_DIARIO I ON H.CD_ESCOLA=I.CD_ESCOLA
WHERE B.dt_fim Is Null 
AND A.st_matricula='1'
AND A.an_letivo='2023'
AND C.dt_fim Is Null
AND F.ci_tipo_endereco='1'
AND G.dt_fim IS NULL
AND I.TP_ESCOLA IN (1,2,3,4,10,11,12,13,16,17,18,28,30,31) AND H.SG_ETAPA IS NOT NULL

--SELECT *  FROM TBL_ENDERECOS_ALUNOS_2023