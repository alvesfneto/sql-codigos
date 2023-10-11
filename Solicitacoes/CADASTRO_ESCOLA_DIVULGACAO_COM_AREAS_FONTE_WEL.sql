

SELECT 
A.*, 
B.qt_area_edificada,
B.qt_area_livre,
B.qt_area_ocupada,
B.qt_area_total,
B.qt_pavimento

INTO ##CADASTRO_ESCOLAS_DIVULGACAO_COM_AREAS


FROM DBO.['Cadastro Escola Divulgação$'] A
JOIN D_ESCOLA B ON A.CODESC=B.cd_escola