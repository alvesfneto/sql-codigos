


/*
Considerando a inaugura��o de CEI INDIRETO na Rua Genaro Napoli, solicitamos relat�rio para verificarmos a possibilidade de transfer�ncia para nova unidade. 
No relat�rio deve constar alunos de BI a MGII
Nome completo do aluno
EOL do aluno
Agrupamento da matr�cula
Turma de matr�cula
Endere�o completo
Unidade de matr�cula
Dist�ncia da unidade de matr�cula
Dist�ncia para Rua Genaro Napoli, altura do n�mero 49 ( -23.74399935124327  -46.669873760814376)
*/
DROP TABLE ##ALUNOS_CRECHE_NOVO_DESTINO
SELECT DISTINCT
NM_ALUNO,
CD_ALUNO,
SG_ETAPA,
SG_SERIE_ENSINO,
CONCAT(C.TP_LOGRADOURO,' ',C.ENDERE�O,', ',C.NR,' ',C.BAIRRO) AS ENDERECO_COMPLETO,
C.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
B.DRE,
C.DIST_ESCOLA,
'Rua Genaro Napoli, 49' AS NOVO_DESTINO,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.74399935124327 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.669873760814376 * 1000000)),2)) / 10)/0.6) AS DIST_NOVO_DESTINO


INTO ##ALUNOS_CRECHE_NOVO_DESTINO

FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN VW_ALUNOS_ENDERECOS C ON A.CD_ALUNO=C.COD_ALUNO

WHERE SG_SERIE_ENSINO IN ('BERC I','BERC II','BI E D','BII E D','MG I','MG I ED','MG II','MG II ED','MG UNIF','MG UNIF ED')
AND DRE = 'DRE - CS'
AND FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.74399935124327 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.669873760814376 * 1000000)),2)) / 10)/0.6)<=1500

--SELECT * FROM ##ALUNOS_CRECHE_NOVO_DESTINO



