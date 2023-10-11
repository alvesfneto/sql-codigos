/*Considerando a inauguração de novo equipamento em nossa DRE, solicitamos estudo de endereço para alunos matriculados a fim de indicarmos transferência em lote para alunos mais próximo de sua residência. 

Solicitamos na relação: 
nome completo do aluno 
EOL do aluno 
identificação de agrupamento de BI a Infantil
EOL do aluno
endereço completo
distância até 800 metros lineares
indicação de uso de TEG ou não na unidade de matrícula
distância para o endereço Rua José Diogo Abadiano, (altura do número 24)
distância da unidade de matrícula
*/
SELECT 
DRE,
CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
NOME_ALUNO,
SERIE_ANO,
COD_ALUNO,
concat (TP_LOGRADOURO,' ',ENDEREÇO,', ',NR,'',COMPL,' ',BAIRRO) AS ENDERECO,
' ' AS [DISTANCIA ATE 800 M],
' ' AS TEG,
'Rua José Diogo Abadiano, 24 ' AS END_DESTINO,
' ' AS DIST_END_DESTINO,
DIST_ESCOLA

FROM VW_ENDERECOS_ALUNOS WHERE ETAPA LIKE '%INF%' AND DRE = 'DRE - CS'

