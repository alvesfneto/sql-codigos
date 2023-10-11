


DROP TABLE ##AL_DEF_POR_SALA_POR_TURNO
SELECT 
A.AN_LETIVO,
B.DRE,B.CD_ESCOLA,B.SG_TP_ESCOLA, B.NOMESC,
C.CD_TURMA_ESCOLA,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
C.DC_TIPO_AMBIENTE,
C.NR_SALA,
C.dc_tipo_turno,
COUNT (A.DEF1) AS AL_DEF,
CONVERT(VARCHAR,A.CRDATE-1,103) AS DT_BASE
INTO ##AL_DEF_POR_SALA_POR_TURNO
FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA = B.CD_ESCOLA
JOIN ( SELECT 
	   CD_ESCOLA,
	   CD_TURMA_ESCOLA,
	   DC_TIPO_AMBIENTE,
	   NR_SALA,
	   B.dc_tipo_turno,
	   CRDATE
	   FROM SME_CLASSES_DIARIO A
	   JOIN tipo_turno B ON A.CD_TIPO_TURNO=B.cd_tipo_turno
	   WHERE
	   SG_ETAPA IS NOT NULL) C ON A.CD_TURMA_ESCOLA=C.CD_TURMA_ESCOLA
WHERE B.TP_ESCOLA IN (1,2,3,4,10,11,12,13,16,17,18,28,30,31) --AND COUNT(A.DEF1)<>0
GROUP BY
B.DRE,B.CD_ESCOLA,B.SG_TP_ESCOLA, B.NOMESC,
C.CD_TURMA_ESCOLA,
C.DC_TIPO_AMBIENTE,
C.NR_SALA,
C.dc_tipo_turno,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
A.CRDATE,
A.AN_LETIVO
--SELECT * FROM ##AL_DEF_POR_SALA_POR_TURNO


--SELECT * INTO SME_ALUNOS_NOV21  FROM MARCIO.DB_LOCAL_0_20211130.DBO.SME_ALUNOS
--SELECT * INTO SME_CLASSES_NOV21  FROM MARCIO.DB_LOCAL_0_20211130.DBO.SME_CLASSES
--SELECT * INTO SME_ESCOLA_NOV21  FROM MARCIO.DB_LOCAL_0_20211130.DBO.SME_ESCOLA
---------------------------------------------------------------------------------------------------------------
DROP TABLE ##AL_DEF_POR_SALA_POR_TURNO_NOV21
SELECT 
A.AN_LETIVO,
B.DRE,B.CD_ESCOLA,B.SG_TP_ESCOLA, B.NOMESC,
C.CD_TURMA_ESCOLA,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
C.DC_TIPO_AMBIENTE,
C.NR_SALA,
C.dc_tipo_turno,
COUNT (A.DEF1) AS AL_DEF,
CONVERT(VARCHAR,A.CRDATE-1,103) AS DT_BASE
INTO ##AL_DEF_POR_SALA_POR_TURNO_NOV21
FROM SME_ALUNOS_NOV21 A
JOIN SME_ESCOLA_NOV21 B ON A.CD_ESCOLA = B.CD_ESCOLA
JOIN ( SELECT 
	   CD_ESCOLA,
	   CD_TURMA_ESCOLA,
	   DC_TIPO_AMBIENTE,
	   NR_SALA,
	   B.dc_tipo_turno,
	   CRDATE
	   FROM SME_CLASSES_NOV21 A
	   JOIN tipo_turno B ON A.CD_TIPO_TURNO=B.cd_tipo_turno
	   WHERE
	   SG_ETAPA IS NOT NULL) C ON A.CD_TURMA_ESCOLA=C.CD_TURMA_ESCOLA
WHERE B.TP_ESCOLA IN (1,2,3,4,10,11,12,13,16,17,18,28,30,31) --AND COUNT(A.DEF1)<>0
GROUP BY
B.DRE,B.CD_ESCOLA,B.SG_TP_ESCOLA, B.NOMESC,
C.CD_TURMA_ESCOLA,
C.DC_TIPO_AMBIENTE,
C.NR_SALA,
C.dc_tipo_turno,
A.CRDATE,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
A.AN_LETIVO
--SELECT * FROM ##AL_DEF_POR_SALA_POR_TURNO_NOV21



