
/*Tendo em vista a perspectiva de fechamento de uma unidade na regi�o do Vargem Grande, solicitar efetuar estudo de endere�o para verificar a possibilidade de transfer�ncia para os alunos matriculados no CEI LUDOTECA EOL 306720. 
Temos 5 unidades no mesmo setor (5510).

Visando estudo/an�lise de demanda apara transfer�ncia, pedimos relat�rio com: 
Nome do aluno/EOL/Agrupamento 2023/Endere�o/Dist�ncia para as unidades abaixo indicadas: 

306998	JD DAS ORQU�DEAS
309729	JOVELINA ALVES FEITOZA
306279	SANTA TEREZINHA 
307083	VARGEM GRANDE
306804	VENHA CONOSCO UNIDADE II
SELECT NOMESC,CD_COORDENADA_GEO_Y,CD_COORDENADA_GEO_X FROM SME_ESCOLA_DIARIO WHERE CD_ESCOLA IN (306998,309729,306279,307083,306804)

*/

DROP TABLE ##DISTANCIA_ALUNOS_306720				 
SELECT 
CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
ENDERE�O,
NR,
COMPL,
BAIRRO,
DIST_ALU_ESCOLA,
'CEI JD DAS ORQU�DEAS' AS END1,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.705948 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.861004 * 1000000)),2)) / 10)/0.6) AS DIST1,
'CEI JOVELINA ALVES FEITOZA, 50' AS END2,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.713216 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.861771 * 1000000)),2)) / 10)/0.6) AS DIST2,
'CEI SANTA TEREZINHA ' AS END3,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.695996 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.853341 * 1000000)),2)) / 10)/0.6) AS DIST3,
'CEI VARGEM GRANDE' AS END4,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.713827 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.858741 * 1000000)),2)) / 10)/0.6) AS DIST4,
'CEI VENHA CONOSCO UNIDADE II' AS END5,
FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (-46.706340 * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (-23.853550 * 1000000)),2)) / 10)/0.6) AS DIST5

INTO ##DISTANCIA_ALUNOS_306720
FROM TBL_ENDERECOS_ALUNOS
WHERE CD_ESCOLA=306720