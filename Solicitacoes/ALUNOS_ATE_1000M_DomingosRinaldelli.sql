
/*
Considerando inaugura��o de unidade tipo EMEI 
em nossa DRE, solicitamos relat�rio 
dos alunos matriculados no Infantil com dist�ncia 
linear inferior a 1.000 metros 
para o endere�o Rua Domingos Rinaldelli, 1730. 

No relat�rio deve conter: 
		Nome do aluno;
		EOL do aluno;
		Agrupamento Infantil I e Infantil II;
		Endere�o completo;
		Dist�ncia da unidade de matr�cula;
		Dist�ncia para endere�o Rua Domingos Rinaldelli, 1730;(-23.743322326363707 -46.68336586098009)
		Uso do TEG;
		Se tem Defici�ncia;

*/

SELECT DISTINCT
A.DRE,
A.CD_ESCOLA,
A.SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
NOME_ALUNO,
CONCAT (TP_LOGRADOURO,' ',ENDERE�O,', ',NR,' ',COMPL,' ',BAIRRO) AS END_ALUNO,
A.DIST_ESCOLA,
C.TEG AS TEG,
CASE WHEN B.DEF1 IS NOT NULL THEN 'S' ELSE ' ' END AS NEE,
'Rua Domingos Rinaldelli, 1730' AS DESTINO,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.743322326363707 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.68336586098009 * 1000000)),2)) / 10)/0.6) AS DIST_DESTINO
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
LEFT JOIN SME_ALUNOS_DIARIO B ON A.COD_ALUNO=B.CD_ALUNO
LEFT JOIN ALUNOS_COM_TEG C ON A.COD_ALUNO=C.CD_ALUNO
WHERE SERIE_ANO LIKE '%INFANTIL%' 
AND FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.743322326363707 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.68336586098009 * 1000000)),2)) / 10)/0.6)<=1000

SELECT * FROM ALUNOS_COM_TEG