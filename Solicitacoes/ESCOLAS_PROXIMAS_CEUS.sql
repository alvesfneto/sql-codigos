--LISTA DE ESCOLAS DISTANTES AT� 500 METROS DOS CEUS

DROP TABLE CEUS_ENDERECOS
SELECT
DRE,
CD_ESCOLA,
SG_TP_ESCOLA AS TIPO,
NOMESC,
(ENDERECO + ', '+ NR + ' - ' + BAIRRO) AS ENDERECO,
CD_COORDENADA_GEO_Y,
CD_COORDENADA_GEO_X
INTO CEUS_ENDERECOS
FROM SME_ESCOLA_DIARIO
WHERE TP_ESCOLA=27
--SELECT * FROM CEUS_ENDERECOS

SELECT
A.DRE,
A.CD_ESCOLA AS CODEOL,
A.TIPO,
A.NOMESC AS CEU,
A.ENDERECO   AS END_CEU,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
(B.ENDERECO + ', '+ B.NR + ' - ' + B.BAIRRO) AS END_ESCOLA,
FLOOR(FLOOR(SQRT(POWER(((A.CD_COORDENADA_GEO_Y*1000000) - (B.CD_COORDENADA_GEO_Y*1000000) ),2) +  POWER(((A.CD_COORDENADA_GEO_X*1000000) - (B.CD_COORDENADA_GEO_X*1000000) ),2)) / 10)/0.6) AS DIST�NCIA
--A.CD_COORDENADA_GEO_Y,
--B.CD_COORDENADA_GEO_Y,
--A.CD_COORDENADA_GEO_X,
--B.CD_COORDENADA_GEO_X
INTO ESCOLAS_PROXIMAS_CEUS
from CEUS_ENDERECOS A, SME_ESCOLA_DIARIO B

WHERE 
(FLOOR(SQRT(POWER(((A.CD_COORDENADA_GEO_Y*1000000) - (B.CD_COORDENADA_GEO_Y*1000000) ),2) +  POWER(((A.CD_COORDENADA_GEO_X*1000000) - (B.CD_COORDENADA_GEO_X*1000000) ),2)) / 10)/0.6) < 500

AND B.CD_SIT=1 AND B.TP_ESCOLA IN(1,2,3,4,10,11,12,13,16,17,18,28,30,31)
order by 3

--SELECT * FROM ESCOLAS_PROXIMAS_CEUS
--WHERE END_CEU=END_ESCOLA AND DIST�NCIA>10

DROP TABLE ##ESCOLAS_PROXIMAS_CEUS
SELECT 
CEU,
CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
END_ESCOLA
INTO ##ESCOLAS_PROXIMAS_CEUS
FROM ESCOLAS_PROXIMAS_CEUS
--SELECT * FROM ##ESCOLAS_PROXIMAS_CEUS
