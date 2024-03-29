/*ESCOLAS QUE MIGRARAM DA DRE CL PARA DRE BT
DECRETO 62643 DE 02/08/2023 - DOC 03/08/2023
*/
SELECT 
RIGHT(COD_ESC,6) AS CIE,
SG_TP_ESCOLA AS TIPO,
NOMESC AS NOME_ESCOLA,
ENDERECO,
NR,
COMPL,
BAIRRO,
CEP,
DISTR AS DISTRITO, 
'BUTANTA' AS DRE,
'19902' AS COD_DRE,
'108100' AS EOL_DRE
INTO ##VILA_ANDRADE
FROM SME_ESCOLA_DIARIO 

WHERE DISTR='VILA ANDRADE' 
      AND CD_SIT=1 
      AND SG_TP_ESCOLA <>'CCA' 
ORDER BY TP_ESCOLA

--SELECT * FROM ##VILA_ANDRADE