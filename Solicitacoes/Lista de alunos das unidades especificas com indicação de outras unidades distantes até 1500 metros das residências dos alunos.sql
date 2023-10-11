
/*
Em virtude da solicita��o do setor de Parcerias, e considerando a necessidade de atendimento 
ao que est� previsto na Portaria n.� 21 SGM-SEGES de 03/2022 que disp�e sobre os Contratos 
de Loca��o, solicitamos que seja encaminhado o arquivo de escolas pr�ximas at� 1,5 km 
para poss�vel transfer�ncia das crian�as para CEIs do entorno das seguintes Unidades: 

Educado Paulo Freire 
Padre Jos� Ho 
Abrindo o Saber 
Liu Shie Lin  
Maranata Irm�os Natali 
Abra�ar 
Cantinho Irm�os Natali 
Pedacinho do C�u 
Padre Pedro Siao 
R�ach 
*/

--CRIA TABELA QUE LISTA ALUNOS DE ESCOLAS ESPEC�FICAS COM PROJE��O DE OURAS ESCOLAS PARA ATNDIMENTO EM UM RAIO DE 1500 NETROS DO ENDERE�O DESSES ALUNOS

DROP TABLE ##ESCOLAS_ATE1500METROS_END_ALUNOS
SELECT 
DRE,
A.CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
A.COD_ALUNO,
NOME_ALUNO,
ESC_DESTINO,
DIST_DESTINO
INTO ##ESCOLAS_ATE1500METROS_END_ALUNOS
FROM TBL_ENDERECOS_ALUNOS A
JOIN (SELECT
	  B.CD_ESCOLA,
	  COD_ALUNO,
	  CONCAT(B.CD_ESCOLA,' - ',B.SG_TP_ESCOLA,' - ',B.NOMESC) AS ESC_DESTINO,
      FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (CD_COORDENADA_GEO_Y * 1000000) ),2) +  
			           POWER((LON_ALUNO * 1000000 - (CD_COORDENADA_GEO_X * 1000000)),2)) / 10)/0.6) AS DIST_DESTINO
	  FROM TBL_ENDERECOS_ALUNOS A, SME_ESCOLA_DIARIO B
      WHERE A.ETAPA = 'ED INF' 
	    AND B.TP_ESCOLA IN (10,11,12,18,28,31) 
		AND B.CD_SIT=1
        AND FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (CD_COORDENADA_GEO_Y * 1000000) ),2) +  
			               POWER((LON_ALUNO * 1000000 - (CD_COORDENADA_GEO_X * 1000000)),2)) / 10)/0.6)<=1500) B ON A.COD_ALUNO=B.COD_ALUNO

WHERE A.CD_ESCOLA IN (309086,309771,308354,309594,400319,309360,309212,309481,309596,309296) 
  AND B.CD_ESCOLA NOT IN (309086,309771,308354,309594,400319,309360,309212,309481,309596,309296)
ORDER BY A.CD_ESCOLA
------------------------------------------------------------------------------------------------------------------------------
--SELECT * FROM ##ESCOLAS_ATE1500METROS_END_ALUNOS

------------------------------------------------------------------------------------------------------------------------------
--tp_escola	sg_tp_escola	dc_tipo_escola
--10	     CEI DIRET   	CENTRO DE EDUCACAO INFANTIL DIRETO                                    
--11	     CEI INDIR   	CENTRO DE EDUCACAO INFANTIL INDIRETO
--12	     CR.P.CONV   	CRECHE PARTICULAR CONVENIADA                                          
--18	     CEU CEI     	CENTRO EDUCACIONAL UNIFICADO - CEI                                    
--28	     CEMEI       	CENTRO MUNICIPAL DE EDUCACAO INFANTIL
--31	     CEU CEMEI   	CENTRO EDUCACIONAL UNIFICADO CEMEI
-------------------------------------------------------------------------------------------------------------------------------







































