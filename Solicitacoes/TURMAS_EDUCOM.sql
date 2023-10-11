
/*

EDUCOMUNICAÇÃO - ANIMAÇÃO/STOPMOTION       -NÃO LOCALIZADO NA TABELA TIPO_PROGRAMA
EDUCOMUNICAÇÃO - CINEMA/CINECLUBE		   -NÃO LOCALIZADO NA TABELA TIPO_PROGRAMA
EDUCOMUNICAÇÃO - FAKE NEWS E DESINFORMAÇÃO -NÃO LOCALIZADO NA TABELA TIPO_PROGRAMA
EDUCOMUNICAÇÃO – IMPRENSA MIRIM			   -NÃO LOCALIZADO NA TABELA TIPO_PROGRAMA
EDUCOMUNICAÇÃO - PRODUÇÃO DE VÍDEO		   -NÃO LOCALIZADO NA TABELA TIPO_PROGRAMA
EDUCOMUNICAÇÃO - REVISTA				   -NÃO LOCALIZADO NA TABELA TIPO_PROGRAMA

EDUCOMUNICAÇÃO - BLOG/SITE OK
EDUCOMUNICAÇÃO - FANZINE OK
EDUCOMUNICAÇÃO - FOTOGRAFIA OK
EDUCOMUNICAÇÃO - HISTÓRIA EM QUADRINHOS OK
EDUCOMUNICAÇÃO - IMPRENSA JOVEM OK
EDUCOMUNICAÇÃO - JORNAL ESCOLAR OK
EDUCOMUNICAÇÃO - MÍDIAS SOCIAIS OK
EDUCOMUNICAÇÃO - RÁDIO ESCOLAR OK
EDUCOMUNICAÇÃO - VIDEOPERFORMANCE OK
EDUCOMUNICAÇÃO - CULTURA DIGITAL OK
EDUCOMUNICAÇÃO - JORNAL MURAL OK
*/


USE Db_Local_0
DROP TABLE ##TURMAS_EDUCOMUNICACAO
SELECT 
DRE, 
A.CD_ESCOLA, 
SG_TP_ESCOLA, 
NOMESC,
C.dc_tipo_programa AS PROGRAMA,
COUNT (DISTINCT CASE WHEN A.CD_TIPO_PROGRAMA in (406,560,317,322,355,319,416,321,323,329,357,320,324,327,328,330) THEN A.CD_TURMA_ESCOLA ELSE NULL END) AS QT_TUR,
SUM(CASE WHEN  A.CD_TIPO_PROGRAMA in (406,560,317,322,355,319,416,321,323,329,357,320,324,327,328,330) THEN AL_AT ELSE NULL END) AS QT_MT,
CONVERT(VARCHAR,A.CRDATE-1, 103) AS DT_BASE
INTO ##TURMAS_EDUCOMUNICACAO
FROM SME_CLASSES_DIARIO A
LEFT JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_TIPO_PROGRAMA C ON A.CD_TIPO_PROGRAMA=C.cd_tipo_programa
where A.CD_TIPO_PROGRAMA in (406,560,317,322,355,319,416,321,323,329,357,320,324,327,328,330)	
GROUP BY DRE, A.CD_ESCOLA, SG_TP_ESCOLA, NOMESC,C.dc_tipo_programa, A.CRDATE
--SELECT * FROM ##TURMAS_EDUCOMUNICACAO

-----------------------------------------------------------------------------------------------
--lista de turmas co dc_turma
SELECT 
DRE, 
A.CD_ESCOLA, 
SG_TP_ESCOLA, 
NOMESC,
C.dc_tipo_programa AS PROGRAMA,
A.CD_TURMA_ESCOLA,
CONVERT(VARCHAR,A.CRDATE-1, 103) AS DT_BASE
INTO ##TURMAS_EDUCOMUNICACAO_1
FROM SME_CLASSES_DIARIO A
LEFT JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_TIPO_PROGRAMA C ON A.CD_TIPO_PROGRAMA=C.cd_tipo_programa
where A.CD_TIPO_PROGRAMA in (406,560,317,322,355,319,416,321,323,329,357,320,324,327,328,330)	






