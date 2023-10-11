
--LISTA_DE_ALUNOS_DE_ESCOLA_ESPECIFICA_COM_INDICACAO_DISTANCIA_NOVOS_ENDERECOS--

/*
Por favor, solicitamos o arquivo dos alunos matriculados na 
CR.P.CONV. LIU SHIE LIN - 309594, 
para os endereços abaixo relacionados para 
estudo de mudança de endereço:

1.  Rua Benjamin Constant n.º 77  - -23.549864791116192, -46.63490425960521

2. Rua Silveira Martins n.º 167 - -23.55208095310661, -46.63059223076954
-------------------------------------------------------------------------
arquivo dos alunos matriculados na CEI Pedacinho do Céu (309481) para o endereço 
Rua Almeida Torres, 124, para possível mudança de endereço.
-23.56797603895422, -46.62886003076904
----------------------------------------------------------------------------
alunos matriculados na CEI Cantinho dos Irmãos Natali (309212) em relação ao endereço 
Alameda Joaquim Eugenio De Lima , 61
-23.56299169648647, -46.6478878442623
*******************************************************************************/

DROP TABLE ##DISTANCIA_ALUNOS_NOVOS_ENDERECOS
SELECT 
DRE,
CD_ESCOLA,
SG_TP_ESCOLA,
NOME_ESCOLA,
ETAPA,
SERIE_ANO,
COD_ALUNO,
NOME_ALUNO,
CONCAT (TP_LOGRADOURO,' ',ENDEREÇO,', ',NR,' ',COMPL,' - ',BAIRRO) AS ENDEREÇO,
DIST_ESCOLA,
--DIST_CARRO,
'Alameda Joaquim Eugenio De Lima , 61' AS DESTINO_1,

FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.56299169648647 * 1000000) ),2) +  
				 POWER((LON_ALUNO * 1000000 - (-46.6478878442623 * 1000000)),2)) / 10)/0.6) AS DIST1,

--'Rua Silveira Martins n.º 167' AS DESTINO_2,
--FLOOR(FLOOR(SQRT(POWER((LAT_ALUNO * 1000000 - (-23.55208095310661 * 1000000) ),2) +  
--				 POWER((LON_ALUNO * 1000000 - (-46.63059223076954 * 1000000)),2)) / 10)/0.6) AS DIST2,
CRDATE AS DT_BASE

--INTO ##DISTANCIA_ALUNOS_NOVOS_ENDERECOS

FROM VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS WHERE CD_ESCOLA = 309212

--SELECT * FROM ##DISTANCIA_ALUNOS_NOVOS_ENDERECOS

SELECT * FROM DBO.VW_ENDERECOS_ALUNOS_COM_RESPONSAVEIS




	 
	 
	 
	 
	 
	 
	/* 
	 
	  (FLOOR(SQRT(POWER((COORDENADA_X_ALU - (A.LON * 1000000) ),2) +  POWER((COORDENADA_Y_ALU  - (A.LAT * 1000000)),2)) / 10)/0.6) AS DISTÂNCIA,
	  B.CRDATE AS DATA

	*/