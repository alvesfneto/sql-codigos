/*Considerando a inaugura��o de novo equipamento em nossa DRE, solicitamos estudo de endere�o para alunos matriculados a fim de indicarmos transfer�ncia em lote para alunos mais pr�ximo de sua resid�ncia. 

Solicitamos na rela��o: 
nome completo do aluno 
EOL do aluno 
identifica��o de agrupamento de BI a Infantil
EOL do aluno
endere�o completo
dist�ncia at� 800 metros lineares
indica��o de uso de TEG ou n�o na unidade de matr�cula
dist�ncia para o endere�o Rua Jos� Diogo Abadiano, (altura do n�mero 24)
dist�ncia da unidade de matr�cula
*/
SELECT 
DRE,
CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
NOME_ALUNO,
SERIE_ANO,
COD_ALUNO,
concat (TP_LOGRADOURO,' ',ENDERE�O,', ',NR,'',COMPL,' ',BAIRRO) AS ENDERECO,
' ' AS [DISTANCIA ATE 800 M],
' ' AS TEG,
'Rua Jos� Diogo Abadiano, 24 ' AS END_DESTINO,
' ' AS DIST_END_DESTINO,
DIST_ESCOLA

FROM VW_ENDERECOS_ALUNOS WHERE ETAPA LIKE '%INF%' AND DRE = 'DRE - CS'

