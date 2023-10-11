/*

Considerando inauguração de unidade tipo EMEI em nossa DRE, 
solicitamos relatório dos alunos matriculados no Infantil com distância 
linear inferior a 1.000 metros para o endereço Rua Domingos Rinaldelli, 1266. 
No relatório deve conter: 
Nome do aluno
EOL do aluno
Agrupamento Infantil I e Infantil II
Endereço completo
Distância da unidade de matrícula
Distância para endereço Rua Domingos Rinaldelli, 1266
Uso do TEG
Se tem Deficiência

-23.743302684907796, -46.68322638731865

*/

DROP TABLE ##ALUNOS_PARA_Rua_Domingos_Rinaldelli
SELECT DRE,A.CD_ESCOLA,SG_TP_ESCOLA,NOME_ESCOLA, NOME_ALUNO,COD_ALUNO,SERIE_ANO,
CONCAT(TP_LOGRADOURO,' ',ENDEREÇO,', ',NR,' ',COMPL,'-',BAIRRO) AS ENDERECO,DIST_ESCOLA,
FLOOR(FLOOR(SQRT(POWER(((LAT_ALUNO*1000000) - (-23.743302684907796 * 1000000) ),2) +  
POWER(((LON_ALUNO*1000000)  - (-46.68322638731865 * 1000000)),2)) / 10)/0.6) AS DISTANCIA,
CASE WHEN DEF1 IS NOT NULL THEN 'S' ELSE 'N' END AS DEFICIENCIA

INTO ##ALUNOS_PARA_Rua_Domingos_Rinaldelli
FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN SME_ALUNOS_DIARIO B ON A.COD_ALUNO=B.CD_ALUNO
WHERE SERIE_ANO LIKE '%INFANTIL%'
AND FLOOR(SQRT(POWER(((LAT_ALUNO*1000000) - (-23.743302684907796 * 1000000) ),2) +  
POWER(((LON_ALUNO*1000000)  - (-46.68322638731865 * 1000000)),2)) / 10)/0.6 <=1000

--SELECT * FROM ##ALUNOS_PARA_Rua_Domingos_Rinaldelli


