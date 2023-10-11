

/*Solicitamos arquivo com dist�ncia entre o endere�o das crian�as do CEI Aida Matuck Domingues e dos im�veis abaixo relacionados, para poss�vel mudan�a de endere�o:
Aida Matuck Domingues 
R. Augusto Piacentini - Jardim Independ�ncia  

 

Endere�os 
Avenida do Orat�rio, 1590 
600 mts. de dist�ncia 

Rua Paulo Verissimo da Silva, 50 
950 mts de dist�ncia 

Rua Professor Lelis Vilas Boas, 217 
900 mts. de dist�ncia 

R. Marcello M�ller, 113 - Vila Independ�ncia 
1 km de dist�ncia 

*/

DROP TABLE ##DISTANCIA_ALUNOS_309171
SELECT 
CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
DIST_ALU_ESCOLA,
'Avenida do Orat�rio, 1590' AS END1,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5529223020969 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.5896717973642 * 1000000)),2)) / 10)/0.6) AS DIST1,
'Rua Paulo Verissimo da Silva, 50' AS END2,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5506104597671 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.5936726812897 * 1000000)),2)) / 10)/0.6) AS DIST2,
'Rua Professor Lelis Vilas Boas, 217' AS END3,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5496827714153 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.589146106132 * 1000000)),2)) / 10)/0.6) AS DIST3,
'R. Marcello M�ller, 113 - Vila Independ�ncia' AS END4,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5631206597673 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.5844801314458 * 1000000)),2)) / 10)/0.6) AS DIST4
INTO ##DISTANCIA_ALUNOS_309171
FROM TBL_ENDERECOS_ALUNOS
WHERE CD_ESCOLA=309171




