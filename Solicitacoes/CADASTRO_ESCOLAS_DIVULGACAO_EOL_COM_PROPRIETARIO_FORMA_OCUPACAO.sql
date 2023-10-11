
--RELA��O DE ESCOLAS COM INDICA��O DE PROPRIETARIO E DEPEND�NCIA ADMINISTRATIVA
DROP TABLE ##TBL_DIVULGACACO
select 
D.*,
--tp_escola,
--cd_escola,
--A.tp_proprietario,
B.dc_tipo_proprietario AS TIPO_PROPRIETARIO,
--tp_forma_ocupacao_predio,
--A.tp_dependencia_administrativa, 
C.dc_tipo_dependencia_administrativa AS DEPENDENCIA_ADMINISTRATIVA

INTO ##TBL_DIVULGACACO

from D_ESCOLA A
JOIN tipo_proprietario B ON A.tp_proprietario=B.tp_proprietario
JOIN D_TIPO_DEPENDENCIA_ADMINISTRATIVA C ON A.tp_dependencia_administrativa=C.tp_dependencia_administrativa
RIGHT JOIN VW_CADASTRO_ESCOLAS_DIVULGACAO_EOL D ON A.cd_escola=D.CODESC
--SELECT * FROM ##TBL_DIVULGACACO
----------------------------------------------------------------------------------------------------------------------
DROP TABLE ##TBL_ESCOLAS_PROPRIEDADE_PREDIO
SELECT 
CODESC, 
TIPOESC AS TIPO,
NOMESC AS NOME,
ENDERECO,
NUMERO,
BAIRRO,
DRE,
LATITUDE,
LONGITUDE, CONCAT(LATITUDE,',',LONGITUDE) AS [COORDENADAS GEOGR�FICAS], 
TIPO_PROPRIETARIO
INTO ##TBL_ESCOLAS_PROPRIEDADE_PREDIO
FROM ##TBL_DIVULGACACO
--SELECT * FROM ##TBL_ESCOLAS_PROPRIEDADE_PREDIO


select * from D_INSTITUICAO