

/*Solicitamos arquivo com distância entre o endereço das crianças do CEI Aida Matuck Domingues e dos imóveis abaixo relacionados, para possível mudança de endereço:
Aida Matuck Domingues 
R. Augusto Piacentini - Jardim Independência  

 

Endereços 
Avenida do Oratório, 1590 
600 mts. de distância 

Rua Paulo Verissimo da Silva, 50 
950 mts de distância 

Rua Professor Lelis Vilas Boas, 217 
900 mts. de distância 

R. Marcello Müller, 113 - Vila Independência 
1 km de distância 

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
'Avenida do Oratório, 1590' AS END1,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5529223020969 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.5896717973642 * 1000000)),2)) / 10)/0.6) AS DIST1,
'Rua Paulo Verissimo da Silva, 50' AS END2,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5506104597671 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.5936726812897 * 1000000)),2)) / 10)/0.6) AS DIST2,
'Rua Professor Lelis Vilas Boas, 217' AS END3,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5496827714153 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.589146106132 * 1000000)),2)) / 10)/0.6) AS DIST3,
'R. Marcello Müller, 113 - Vila Independência' AS END4,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.5631206597673 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.5844801314458 * 1000000)),2)) / 10)/0.6) AS DIST4
INTO ##DISTANCIA_ALUNOS_309171
FROM TBL_ENDERECOS_ALUNOS
WHERE CD_ESCOLA=309171




