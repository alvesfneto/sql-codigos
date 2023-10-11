

--ESTUDO AREA ESCOLAS
DROP TABLE ##ESCOLAS_AREAS
SELECT
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
qt_area_edificada,
qt_area_livre,
qt_area_ocupada,
qt_area_total,
qt_pavimento
INTO ##ESCOLAS_AREAS
 FROM D_ESCOLA A
 JOIN SME_ESCOLA_DIARIO B ON A.cd_escola=B.CD_ESCOLA
 WHERE B.CD_SIT=1
 --SELECT * FROM ##ESCOLAS_AREAS