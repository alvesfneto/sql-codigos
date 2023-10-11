								
--ATOS DE CRIAÇÃO

		--|---------------------------------------------------------------------------------------------------------------------------------|
		--|tp_ocorrencia_historica|dc_tipo_ocorrencia_historica |dt_atualizacao_tabela	|cd_operador|dt_cancelamento|in_utilizacao_historico|
		--|-----------------------|---------------------------- |-----------------------|-----------|---------------|-----------------------|
		--|	1					  |CRIACAO DE ESCOLAS	        |2007-05-25 14:38:08.000|		1   |		NULL	|		S				|
		--|	2					  |CONSOLIDA CRIACAO DE ESCOLAS |2007-05-25 14:38:08.000|		1   |		NULL	|		S				|
		--|	9					  |INSTALACAO DE ESCOLAS	    |2007-05-25 14:38:08.000|		1   |		NULL	|		S				|
		--|	18					  |DATA DE INAUGURACAO DA ESCOLA|2007-05-25 14:38:08.000|		1   |		NULL	|		S				|
		--|	27					  |CRIACAO						|2007-05-25 14:38:08.000|		1   |		NULL	|		S				|
		--|---------------------------------------------------------------------------------------------------------------------------------|
		
--==========================================================================================================
--REDE DIRETA
--==========================================================================================================
----------------------------------------------------------------------------------
--CRIA LISTA DE UNIDADES CRIADAS COM O TP_ATO IN (1,2)
----------------------------------------------------------------------------------
--DROP TABLE ##ATOS_CRIACAO
SELECT DISTINCT
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.tp_ocorrencia_historica AS TP_ATO,
C.dc_tipo_ocorrencia_historica AS TIPO_OCORRENCIA,
A.cd_ato AS ATO_CRIACAO,
A.nr_ato AS NR_ATO,
A.dt_publicacao_dom AS DT_PUBL,
A.dt_inicio_ocorrencia_unidade AS DT_CRIACAO,
A.dt_atualizacao_tabela AS DT_REGISTRO,
A.dc_ato AS NM_CRIACAO,
A.tp_atualizacao_registro AS TP_ATUALIZACAO,
A.cd_operador AS OPERADOR,
D.dc_tipo_situacao_unidade AS SITUACAO,
CONVERT(VARCHAR, B.CRDATE-1, 103) AS [DATA BASE]
INTO ##ATOS_CRIACAO
FROM D_HISTORICO_UNIDADE A
JOIN SME_ESCOLA_DIARIO B ON A.cd_unidade_educacao=B.CD_ESCOLA
JOIN Bd_Local_Aux..tipo_ocorrencia_historica C ON A.tp_ocorrencia_historica=C.tp_ocorrencia_historica
JOIN Bd_Local_Aux..[tipo_situacao_unidade] D ON B.CD_SIT=D.tp_situacao_unidade
WHERE A.tp_ocorrencia_historica IN (1,2) AND B.TP_ESCOLA IN (1,2,3,4,10,13,14,16,17,18,23,25,28,31)
--SELECT * FROM ##ATOS_CRIACAO
--------------------------------------------------------------------------------------------------------
--LOCALIZA REGISTROS DUPLICADOS - TABELA ATOS_CRIACAO
--------------------------------------------------------------------------------------------------------
SELECT
CD_ESCOLA,
COUNT (CD_ESCOLA) AS QTDE
FROM 
##ATOS_CRIACAO
GROUP BY
CD_ESCOLA
HAVING (COUNT (CD_ESCOLA)>1)
ORDER BY 1
--------------------------------------------------------------------------------------------------------
--CRIA TABELA ##ACERTOS (LISTA DE REGISTROS VÁLIDOS CONFORME REGRAS INDIVIDUAIS) 
--------------------------------------------------------------------------------------------------------
--DROP TABLE ##ACERTOS
SELECT * INTO ##ACERTOS 
FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '097705' AND NM_CRIACAO ='COHAB CIDADE TIRADENTES  - UNIDADE IV'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '097691' AND NM_CRIACAO ='VILA PROGRESSO'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '019249' AND NM_CRIACAO ='JARDIM JOAO XXIII'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '095583' AND NM_CRIACAO ='COHAB JARDIM SAPOPEMBA - UNID I'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '019230' AND NM_CRIACAO ='VILA GERMAINE'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '091901' AND tp_ato=1
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '094404' AND tp_ato=1
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '097691' AND nr_ato ='21.537'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '097705' AND nr_ato ='21.536'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '400152' AND nr_ato ='24.405'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '400223' AND nr_ato ='24.765'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '400224' AND nr_ato ='21.968'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '400227' AND nr_ato ='24.498'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '400230' AND nr_ato ='20.719'
UNION
SELECT * FROM ##ATOS_CRIACAO WHERE CD_ESCOLA = '400296' AND nr_ato ='42195'
--SELECT * FROM ##ACERTOS
-------------------------------------------------------------------------------------------------------------
--EXCLUI DA TABELA ##ATOS_CRIACAO OS REGISTROS DUPLICADOS
-------------------------------------------------------------------------------------------------------------
DELETE FROM ##ATOS_CRIACAO
WHERE CD_ESCOLA IN ('019230','019249','091901','094404','095583','097691','097705','400152','400223','400224','400227','400230','400296')
-------------------------------------------------------------------------------------------------------------
--INCLUI TABELA ##ACERTOS NA TABELA ##ATOS_CRIACAO
-------------------------------------------------------------------------------------------------------------
INSERT INTO ##ATOS_CRIACAO SELECT * FROM ##ACERTOS
---------------------------------------------------------------------------------------
--SELECIONA UNIDADES CRIADAS POR TIPO DE OCORRENCIA: 9 - INSTALAÇÃO DE ESCOLAS 
---------------------------------------------------------------------------------------
--DROP TABLE ##ATO_9
SELECT 
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
C.tp_ocorrencia_historica AS TP_ATO,
D.dc_tipo_ocorrencia_historica AS TIPO_OCORRENCIA,
C.cd_ato AS ATO_CRIACAO,
C.nr_ato AS NR_ATO,
C.dt_publicacao_dom AS DT_PUBL,
C.dt_inicio_ocorrencia_unidade AS DT_CRIACAO,
C.dt_atualizacao_tabela AS DT_REGISTRO,
C.dc_ato AS NM_CRIACAO,
C.tp_atualizacao_registro AS TP_ATUALIZACAO,
C.cd_operador AS OPERADOR,
E.dc_tipo_situacao_unidade AS SITUACAO,
CONVERT(VARCHAR, B.CRDATE-1, 103) AS [DATA BASE]
INTO ##ATO_9
FROM ##ATOS_CRIACAO A
RIGHT JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_HISTORICO_UNIDADE C ON B.CD_ESCOLA=C.cd_unidade_educacao
JOIN Bd_Local_Aux..tipo_ocorrencia_historica D ON C.tp_ocorrencia_historica=D.tp_ocorrencia_historica
JOIN Bd_Local_Aux..[tipo_situacao_unidade] E ON B.CD_SIT=E.tp_situacao_unidade
WHERE B.TP_ESCOLA IN (1,2,3,4,10,13,14,16,17,18,23,25,28,31) AND A.CD_ESCOLA IS NULL AND C.tp_ocorrencia_historica  = 9
--SELECT * FROM ##ATO_9
-------------------------------------------------------------------------------------------------------------
--INCLUI TABELA ##ATO_9 NA TABELA ##ATOS_CRIACAO
-------------------------------------------------------------------------------------------------------------
INSERT INTO ##ATOS_CRIACAO SELECT * FROM ##ATO_9
-------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--SELECIONA OS CASOS DE TIPO DE OCORRENCIA = 27 CRIAÇÃO DE ESCOLA
------------------------------------------------------------------------------------------------------------------------
--DROP TABLE ##ATO_27
SELECT 
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
C.tp_ocorrencia_historica AS TP_ATO,
D.dc_tipo_ocorrencia_historica AS TIPO_OCORRENCIA,
C.cd_ato AS ATO_CRIACAO,
C.nr_ato AS NR_ATO,
C.dt_publicacao_dom AS DT_PUBL,
C.dt_inicio_ocorrencia_unidade AS DT_CRIACAO,
C.dt_atualizacao_tabela AS DT_REGISTRO,
C.dc_ato AS NM_CRIACAO,
C.tp_atualizacao_registro AS TP_ATUALIZACAO,
C.cd_operador AS OPERADOR,
E.dc_tipo_situacao_unidade AS SITUACAO,
CONVERT(VARCHAR, B.CRDATE-1, 103) AS [DATA BASE]
INTO ##ATO_27
FROM ##ATOS_CRIACAO A
RIGHT JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_HISTORICO_UNIDADE C ON B.CD_ESCOLA=C.cd_unidade_educacao
JOIN Bd_Local_Aux..tipo_ocorrencia_historica D ON C.tp_ocorrencia_historica=D.tp_ocorrencia_historica
JOIN Bd_Local_Aux..[tipo_situacao_unidade] E ON B.CD_SIT=E.tp_situacao_unidade
WHERE B.TP_ESCOLA IN (1,2,3,4,10,13,14,16,17,18,23,25,28,31) AND A.CD_ESCOLA IS NULL AND C.tp_ocorrencia_historica  = 27
--SELECT * FROM ##ATO_27
-------------------------------------------------------------------------------------------------------------
--INCLUI TABELA ##ATO_27 NA TABELA ##ATOS_CRIACAO
-------------------------------------------------------------------------------------------------------------
INSERT INTO ##ATOS_CRIACAO SELECT * FROM ##ATO_27
-------------------------------------------------------------------------------------------------------------
--ESGOTADOS OS TIPOS QUE TRATAM DE CRIAÇÃO - UTILIZA-SE O ATO TIPO 18 - INAUGURAÇÃO DA ESCOLA
-------------------------------------------------------------------------------------------------------------
--DROP TABLE ##ATO_18
SELECT 
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
C.tp_ocorrencia_historica AS TP_ATO,
D.dc_tipo_ocorrencia_historica AS TIPO_OCORRENCIA,
C.cd_ato AS ATO_CRIACAO,
C.nr_ato AS NR_ATO,
C.dt_publicacao_dom AS DT_PUBL,
C.dt_inicio_ocorrencia_unidade AS DT_CRIACAO,
C.dt_atualizacao_tabela AS DT_REGISTRO,
C.dc_ato AS NM_CRIACAO,
C.tp_atualizacao_registro AS TP_ATUALIZACAO,
C.cd_operador AS OPERADOR,
E.dc_tipo_situacao_unidade AS SITUACAO,
CONVERT(VARCHAR, B.CRDATE-1, 103) AS [DATA BASE]
INTO ##ATO_18
FROM ##ATOS_CRIACAO A
RIGHT JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_HISTORICO_UNIDADE C ON B.CD_ESCOLA=C.cd_unidade_educacao
JOIN Bd_Local_Aux..tipo_ocorrencia_historica D ON C.tp_ocorrencia_historica=D.tp_ocorrencia_historica
JOIN Bd_Local_Aux..[tipo_situacao_unidade] E ON B.CD_SIT=E.tp_situacao_unidade
WHERE B.TP_ESCOLA IN (1,2,3,4,10,13,14,16,17,18,23,25,28,31) AND A.CD_ESCOLA IS NULL AND C.tp_ocorrencia_historica  = 18
--SELECT * FROM ##ATO_18
-------------------------------------------------------------------------------------------------------------
--INCLUI TABELA ##ATO_18 NA TABELA ##ATOS_CRIACAO
-------------------------------------------------------------------------------------------------------------
INSERT INTO ##ATOS_CRIACAO SELECT * FROM ##ATO_18
-------------------------------------------------------------------------------------------------------------
--SELECT * FROM ##ATOS_CRIACAO WHERE SITUACAO ='ESCOLA ATIVA'
-------------------------------------------------------------------------------------------------------------
--CRIA TABELA DE ESCOLAS COM ATOS DE CRIAÇÃO
-------------------------------------------------------------------------------------------------------------
--DROP TABLE SME_ESCOLAS_ATOS_CRIACAO
SELECT *
INTO SME_ESCOLAS_ATOS_CRIACAO
FROM ##ATOS_CRIACAO
--SELECT * FROM SME_ESCOLAS_ATOS_CRIACAO
------------------------------------------------------------------------------------------------------------




select * from Bd_Local_Aux..tipo_ocorrencia_historica where tp_ocorrencia_historica in(1,2,9,18,27)

==========================================================================================================
--REDE CONVENIADA
--==========================================================================================================
--DROP TABLE ##ATOS_CRIACAO_CONV
SELECT DISTINCT
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.tp_ocorrencia_historica AS TP_ATO,
C.dc_tipo_ocorrencia_historica AS TIPO_OCORRENCIA,
A.cd_ato AS ATO_CRIACAO,
A.nr_ato AS NR_ATO,
A.dt_publicacao_dom AS DT_PUBL,
A.dt_inicio_ocorrencia_unidade AS DT_CRIACAO,
A.dt_atualizacao_tabela AS DT_REGISTRO,
A.dc_ato AS NM_CRIACAO,
A.tp_atualizacao_registro AS TP_ATUALIZACAO,
A.cd_operador AS OPERADOR,
D.dc_tipo_situacao_unidade AS SITUACAO,
CONVERT(VARCHAR, B.CRDATE-1, 103) AS [DATA BASE]
INTO ##ATOS_CRIACAO_CONV
FROM D_HISTORICO_UNIDADE A
JOIN SME_ESCOLA_DIARIO B ON A.cd_unidade_educacao=B.CD_ESCOLA
JOIN Db_Local_Aux..tipo_ocorrencia_historica C ON A.tp_ocorrencia_historica=C.tp_ocorrencia_historica
JOIN Db_Local_Aux..[tipo_situacao_unidade] D ON B.CD_SIT=D.tp_situacao_unidade
WHERE A.tp_ocorrencia_historica =1 AND B.TP_ESCOLA IN (11,12)
--SELECT * FROM ##ATOS_CRIACAO_CONV
--------------------------------------------------------------------------------------------------------
--LOCALIZA REGISTROS DUPLICADOS - TABELA ATOS_CRIACAO_CONV
--------------------------------------------------------------------------------------------------------
SELECT
CD_ESCOLA,
COUNT (CD_ESCOLA) AS QTDE
FROM 
##ATOS_CRIACAO_CONV
GROUP BY
CD_ESCOLA
HAVING (COUNT (CD_ESCOLA)>1)
ORDER BY 1

SELECT * FROM ##ATOS_CRIACAO_CONV WHERE CD_ESCOLA IN ('400453','400603') --REGISTROS DUPLICAODS
--------------------------------------------------------------------------------------------------------
--CRIA TABLELA COM REGISTROS ÚNICOS DOS CASOS DUPLICADOS 
SELECT * 
INTO ##ACERTOS_CONV
FROM ##ATOS_CRIACAO_CONV WHERE CD_ESCOLA='400453' AND NM_CRIACAO='ANTONIO ELPIDIO DA SILVA'
UNION
SELECT * FROM ##ATOS_CRIACAO_CONV WHERE CD_ESCOLA='400603' AND OPERADOR = '3162'
--------------------------------------------------------------------------------------------------------
DELETE FROM ##ATOS_CRIACAO_CONV  WHERE CD_ESCOLA IN ('400453','400603') --ESTES REGISTROS ESTÃO DUPLICADOS
--------------------------------------------------------------------------------------------------------
INSERT  INTO ##ATOS_CRIACAO_CONV SELECT * FROM ##ACERTOS_CONV  --VOLTA REGISTROS ÚNICOS ANTES DUPLICADOS
---------------------------------------------------------------------------------------------------------


SELECT 
A.CD_ESCOLA, 
B.CD_ESCOLA,
C.tp_ocorrencia_historica,
C.cd_ato,
D.dc_tipo_ocorrencia_historica



FROM SME_ESCOLA_DIARIO A
LEFT JOIN ##ATOS_CRIACAO_CONV B ON A.CD_ESCOLA=B.CD_ESCOLA
LEFT JOIN D_HISTORICO_UNIDADE C ON A.CD_ESCOLA=C.cd_unidade_educacao
LEFT JOIN Db_Local_Aux..tipo_ocorrencia_historica D ON C.cd_historico_unidade=D.tp_ocorrencia_historica
WHERE A.TP_ESCOLA IN (11,12) AND B.CD_ESCOLA IS NULL
ORDER BY 3


SELECT DISTINCT 
A.TP_OCORRENCIA_HISTORICA,
B.DC_TIPO_OCORRENCIA_HISTORICA 
FROM D_HISTORICO_UNIDADE A
JOIN Db_Local_Aux..tipo_ocorrencia_historica B ON A.tp_ocorrencia_historica=B.tp_ocorrencia_historica


SELECT TOP 1 * FROM D_HISTORICO_UNIDADE
SELECT * FROM Db_Local_Aux..tipo_ocorrencia_historica
ORDER BY 2