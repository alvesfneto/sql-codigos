
DROP TABLE ##COPED_NAAPA
SELECT 
CODESC,
TIPOESC,
A.NOMESC AS [NOME DA ESCOLA],
A.ENDERECO AS LOGRADOURO,
NUMERO AS N�MERO,
B.COMPL AS COMPLEMENTO,
A.BAIRRO, 
A.CEP,
A.DRE AS [DIRETORIA REGIONAL DE EDUCA��O],
SUBPREF AS SUBPREFEITTURA

INTO ##COPED_NAAPA

FROM CADASTRO_ESCOLAS_DIVULGACAO_EOL A
JOIN SME_ESCOLA_DIARIO B ON A.CODESC=B.CD_ESCOLA
WHERE TP_ESCOLA IN (1,2,3,4,10,11,12,13,16,17,18,28,30,31)

SELECT * FROM CADASTRO_ESCOLAS_DIVULGACAO_EOL

SELECT * FROM D_TIPO_ESCOLA