--matriculas 2023
DROP TABLE ALUNOS2023
SELECT distinct 
I.DRE,
I.CD_ESCOLA,
I.SG_TP_ESCOLA,
I.NOMESC AS NOME_ESCOLA,
H.SG_ETAPA AS ETAPA,
H.SG_SERIE_ENSINO AS SERIE_ANO,
A.cd_aluno AS COD_ALUNO, 
H.NM_ALUNO AS NOME_ALUNO,
H.NM_MAE_ALUNO AS MÃE_ALUNO,
G.nm_responsavel AS RESPONSÁVEL,
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
D.nm_logradouro AS ENDEREÇO, 
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
CONVERT(FLOAT,D.cd_coordenada_geo_y) AS LAT_ALUNO, 
CONVERT(FLOAT,D.cd_coordenada_geo_x) AS LON_ALUNO,
FLOOR(FLOOR(SQRT(POWER((D.cd_coordenada_geo_y * 1000000 - (I.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
				 POWER((D.cd_coordenada_geo_x * 1000000 - (I.CD_COORDENADA_GEO_X * 1000000)),2)) / 10)/0.6) AS DIST_ALU_ESCOLA,
--A.st_matricula, 
A.an_letivo AS ANO_LETIVO, 
CONVERT(VARCHAR, A.CRDATE,103) AS CRDATE
INTO ALUNOS2023
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


SELECT * FROM ALUNOS2023

WHERE ETAPA IN ( 'ENS FUND9A','ED INF') AND SERIE_ANO IN ('1º ANO', '2º ANO','3º ANO','4º ANO','5º ANO','INFANTIL UNIFICADO')

------------------------------------------------------------------------------------------------------------------------
--======================================================================================================================
------------------------------------------------------------------------------------------------------------------------

/*estudantes com matrícula ativa para 2023 na Educação Infantil pré-escola e 
Ensino Fundamental de 1º ao 5º ano, que residam num até 4km 
do endereço Alameda Dino Bueno, 285
*/

/*DROP TABLE TAB_END
CREATE TABLE TAB_END (
	ID  INT IDENTITY(0,1),
	ENDERECO NVARCHAR(200) NULL,
	LAT FLOAT NULL,
	LON FLOAT NULL,
	DATA_GERACAO DATETIME NULL	)*/


TRUNCATE TABLE TAB_END

--ENDEREÇO 1
DECLARE @END NVARCHAR(200) SET @END ='Alameda Dino Bueno, 285, cep 01217-000'
DECLARE @LAT_Y FLOAT SET @LAT_Y = -23.531868616130332
DECLARE	@LON_X FLOAT SET @LON_X = -46.643186786757134
INSERT INTO TAB_END  
SELECT @END,@LAT_Y, @LON_X,  SYSDATETIME() WHERE @LAT_Y IS NOT NULL
GO

--SELECT * FROM TAB_END
DROP TABLE CONSULTA_NOVO_END
SELECT
ANO_LETIVO,
DRE,
CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
NOME_ALUNO,
MÃE_ALUNO,
RESPONSÁVEL,
TEL_CELULAR,
TP_LOGRADOURO,
ENDEREÇO,
NR,
COMPL,
BAIRRO,
CEP,
DIST_ALU_ESCOLA,
ENDERECO AS NOVO_END,
FLOOR(FLOOR(SQRT(POWER((LON_ALUNO*1000000 - (A.LON * 1000000) ),2) +  POWER((LAT_ALUNO*1000000  - (A.LAT * 1000000)),2)) / 10)/0.6) AS DIS_NOVO_END,
	  B.CRDATE AS DT_BASE
	  --INTO CONSULTA_NOVO_END

FROM	TAB_END A, TBL_ENDERECOS_ALUNOS_2023 B

WHERE 
ETAPA IN ( 'ENS FUND9A','ED INF') AND SERIE_ANO IN ('1º ANO', '2º ANO','3º ANO','4º ANO','5º ANO','INFANTIL UNIFICADO')

	 AND (FLOOR(SQRT(POWER((LON_ALUNO*1000000 - (A.LON * 1000000) ),2) +  POWER((LAT_ALUNO*1000000  - (A.LAT * 1000000)),2)) / 10)/0.6) <= 4000

--SELECT * FROM ALUNOS2023
--SELECT * FROM CONSULTA_NOVO_END

SELECT * FROM CONSULTA_NOVO_END WHERE DRE = 'DRE - CL'



select top 100 * from D_ENDERECO

