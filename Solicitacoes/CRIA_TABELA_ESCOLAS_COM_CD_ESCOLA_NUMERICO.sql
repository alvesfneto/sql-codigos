--cria tabela de escolas com CD_ESCOLA_NUMERICO
SELECT CONVERT(INT, CD_ESCOLA) AS CD_ESCOLA_NUM,  CD_ESCOLA, REDE,DRE,SG_TP_ESCOLA, NOMESC 
INTO ESCOLAS_CD_ESCOLA_NUMERICO
FROM SME_ESCOLA_DIARIO WHERE CD_SIT=1 AND REDE IN ('DIR','CONV') ORDER BY 1