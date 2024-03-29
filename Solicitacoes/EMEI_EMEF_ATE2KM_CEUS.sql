
--SELECT * FROM TBL_CEUS

DROP TABLE ##EMEI_EMEF_ATE2KM_CEUS
SELECT
CODLOC,
TIPO,
DESLOC,
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
FLOOR(FLOOR(SQRT(POWER((LATITUDE - (B.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
						   POWER((LONGITUDE - (B.CD_COORDENADA_GEO_X * 1000000)),2))/10)/0.6) AS DISTANCIA,

CASE WHEN FLOOR(FLOOR(SQRT(POWER((LATITUDE - (B.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
						   POWER((LONGITUDE - (B.CD_COORDENADA_GEO_X * 1000000)),2))/10)/0.6) <= 500 THEN 'At� 500 m'

     WHEN FLOOR(FLOOR(SQRT(POWER((LATITUDE - (B.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
						   POWER((LONGITUDE - (B.CD_COORDENADA_GEO_X * 1000000)),2))/10)/0.6) BETWEEN 501 AND 1000 THEN '501 a 1000 m'
	 WHEN FLOOR(FLOOR(SQRT(POWER((LATITUDE - (B.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
						   POWER((LONGITUDE - (B.CD_COORDENADA_GEO_X * 1000000)),2))/10)/0.6) BETWEEN 1001 AND 1500 THEN '1001 a 1500 m'
	 WHEN FLOOR(FLOOR(SQRT(POWER((LATITUDE - (B.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
					       POWER((LONGITUDE - (B.CD_COORDENADA_GEO_X * 1000000)),2))/10)/0.6) BETWEEN 1501 AND 2000 THEN '1501 a 2000 m'
ELSE NULL END AS FAIXA
INTO ##EMEI_EMEF_ATE2KM_CEUS
FROM TBL_CEUS A, SME_ESCOLA_DIARIO B

WHERE  FLOOR(FLOOR(SQRT(POWER((LATITUDE - (B.CD_COORDENADA_GEO_Y * 1000000) ),2) +  
						   POWER((LONGITUDE - (B.CD_COORDENADA_GEO_X * 1000000)),2))/10)/0.6)<=2000
AND B.TP_ESCOLA IN (1,2,10,16,17,18)

--SELECT * FROM ##EMEI_EMEF_ATE2KM_CEUS

--select * from tipo_escola