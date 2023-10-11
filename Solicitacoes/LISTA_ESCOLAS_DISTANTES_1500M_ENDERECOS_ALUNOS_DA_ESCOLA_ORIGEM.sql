
DROP TABLE ##ESCOLA_ORIGEM
SELECT * 
INTO ##ESCOLA_ORIGEM
FROM VW_ALUNOS_ENDERECOS
WHERE CD_ESCOLA = 309037
--SELECT * FROM ##ESCOLA_ORIGEM

DROP TABLE ##LISTA_ESCOLAS_DISTANTES_1500M_ENDERECOS_ALUNOS_DA_ESCOLA_ORIGEM
SELECT 
A.DRE,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
TP_LOGRADOURO,
A.ENDERE�O,
A.NR,
A.COMPL,
A.BAIRRO,
B.SG_TP_ESCOLA AS TP_ESCOLA_DESTINO,
B.NOMESC AS NOME_ESCOLA_DESTINO,
--DIST_ALU_ESCOLA,
FLOOR(FLOOR(SQRT(POWER((cd_coordenada_geo_y * 1000000 - (LAT_ALUNO * 1000000) ),2) +  
				 POWER((cd_coordenada_geo_x * 1000000 - (LON_ALUNO * 1000000)),2)) / 10)/0.6) AS DIST_NOVA_UE,
A.CRDATE AS DT_BASE
INTO ##LISTA_ESCOLAS_DISTANTES_1500M_ENDERECOS_ALUNOS_DA_ESCOLA_ORIGEM
FROM ##ESCOLA_ORIGEM A, SME_ESCOLA_DIARIO B
WHERE
FLOOR(FLOOR(SQRT(POWER((cd_coordenada_geo_y * 1000000 - (LAT_ALUNO * 1000000) ),2) +  
				 POWER((cd_coordenada_geo_x * 1000000 - (LON_ALUNO * 1000000)),2)) / 10)/0.6) <= 1500 
AND B.TP_ESCOLA IN(10,11,12,18)
GROUP BY
A.DRE,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
TP_LOGRADOURO,
A.ENDERE�O,
A.NR,
A.COMPL,
A.BAIRRO,
--DIST_ALU_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
LAT_ALUNO,
LON_ALUNO,
CD_COORDENADA_GEO_X,
CD_COORDENADA_GEO_Y,
A.CRDATE




--SELECT TOP 1 * FROM VW_ALUNOS_ENDERECOS
