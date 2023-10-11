
/*
Prezada Equipe!
Considerando possibilidade de fechamento da EMEI JARDIM MYRNA (-23.773802	-46.693497), 
e a obrigatoriedade de garantir a continuidade do atendimento 
dos alunos já matriculados, 
solicitamos relatório para o endereço e escolas abaixo relacionadas: 


Rua Domingos Rinaldelli, 1730 (nova unidade)-23.743322326363707 -46.68336586098009

EMEI Caminho dos Martins -23.787439	-46.692529
EMEI Parque Cocaia -23.750522	-46.679663
EMEI Jardim Lucélia -23.761494	-46.670802
EMEI Rio Branco -23.755627	-46.684260
EMEI Jardim Ideal -23.760305	-46.661574
EMEI Aristides Nogueira -23.746950	-46.675913
EMEI Parque Brasil -23.752429	-46.682671

O relatório deve conter os seguintes dados: 

nome completo do aluno
endereço completo
distância da unidade de matrícula
uso de TEG
necessidade especial (DEFICIÊNCIA)
distância para as unidades citadas
*/

SELECT DISTINCT
DRE,
A.CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
NOME_ALUNO,
CONCAT (TP_LOGRADOURO,' ',ENDEREÇO,', ',NR,' ',COMPL,' ',BAIRRO) AS END_ALUNO,
DIST_ESCOLA,
'' AS TEG,
CASE WHEN B.DEF1 IS NOT NULL THEN 'S' ELSE ' ' END AS NEE,
'Rua Domingos Rinaldelli, 1730' AS DEST_1,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.743322326363707 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.68336586098009 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_1,
'EMEI Caminho dos Martins' AS DEST_2,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.787439 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.692529 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_2,
'EMEI Parque Cocaia' AS DEST_3,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.750522 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.679663 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_3,
'EMEI Jardim Lucélia' AS DEST_4,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.761494 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.670802 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_4,
'EMEI Rio Branco' AS DEST_5,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.755627 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.684260 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_5,
'EMEI Jardim Ideal' AS DEST_6,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.760305 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.661574 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_6,
'EMEI Aristides Nogueira' AS DEST_7,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.746950 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.675913 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_7,
'EMEI Parque Brasil' AS DEST_8,
FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.752429 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.682671 * 1000000)),2)) / 10)/0.6) AS DIST_DEST_8

--INTO ##ALUNOS_EMEI_JARRIM_MYRNA_NOVOS_DESTINOS

FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS A
JOIN SME_ALUNOS_DIARIO B ON A.COD_ALUNO=B.CD_ALUNO
WHERE A.CD_ESCOLA = 019522