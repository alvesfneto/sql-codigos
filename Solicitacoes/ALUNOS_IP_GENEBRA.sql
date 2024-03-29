

SELECT DISTINCT
A.DRE,
B.DISTR,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
CONCAT (TP_LOGRADOURO,' ',ENDERE�O,', ',A.NR,'- ',A.COMPL,', ',A.BAIRRO) AS ENDERE�O,
A.CRDATE
INTO ##ALUNOS_IP
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA

WHERE A.CD_ESCOLA 


iN (
306419
,309594
,306729
,309484
,094625
,019675
,400496
,400316
,400661
,400318
,400727
,400735
,306681
,307066
,306398
,309212
,306740
,400319
,306521
,094633
,091847
,306528
,091855
,309479
,091871)


--SELECT * FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS WHERE ENDERE�O ='GENEBRA'


SELECT DISTINCT
A.DRE,
B.DISTR,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
CONCAT (TP_LOGRADOURO,' ',ENDERE�O,', ',A.NR,'- ',A.COMPL,', ',A.BAIRRO) AS ENDERE�O,
A.CRDATE
INTO ##ALUNOS_DISTR_SANTA_CECILIA_BOM_RETIRO
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA

WHERE B.DISTR IN ('BOM RETIRO','SANTA CECILIA')
