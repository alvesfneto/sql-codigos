

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
USE Db_Local_0
/*DROP TABLE TAB_END
CREATE TABLE TAB_END (
	ID  INT IDENTITY(0,1),
	ENDERECO NVARCHAR(200) NULL,
	LAT FLOAT NULL,
	LON FLOAT NULL,
	DATA_GERACAO DATETIME NULL	)*/


TRUNCATE TABLE TAB_END

--ENDEREÇO 1
DECLARE @END NVARCHAR(200) SET @END ='Avenida do Oratório, 1590'
DECLARE @LAT_Y FLOAT SET @LAT_Y =  -23.589671797364225  
DECLARE	@LON_X FLOAT SET @LON_X =  -46.55292230209692
INSERT INTO TAB_END  
SELECT @END,@LAT_Y, @LON_X,  SYSDATETIME() WHERE @LAT_Y IS NOT NULL
GO

--ENDEREÇO 2
DECLARE @END NVARCHAR(200) SET @END = 'Rua Paulo Verissimo da Silva, 50'
DECLARE @LAT_Y FLOAT SET @LAT_Y =    -23.59367268128966 
DECLARE	@LON_X FLOAT SET @LON_X =    -46.55061045976711
INSERT INTO TAB_END  
SELECT @END,@LAT_Y, @LON_X,  SYSDATETIME() WHERE @LAT_Y IS NOT NULL
GO

--ENDEREÇO 3
DECLARE @END NVARCHAR(200) SET @END = 'Rua Professor Lelis Vilas Boas, 217'
DECLARE @LAT_Y FLOAT SET @LAT_Y =    -23.589146106132024 
DECLARE	@LON_X FLOAT SET @LON_X =    -46.549682771415334
INSERT INTO TAB_END  
SELECT @END,@LAT_Y, @LON_X,  SYSDATETIME() WHERE @LAT_Y IS NOT NULL
GO

--ENDEREÇO 4
DECLARE @END NVARCHAR(200) SET @END = 'R. Marcello Müller, 113 - Vila Independência'
DECLARE @LAT_Y FLOAT SET @LAT_Y =     -23.584480131445776 
DECLARE	@LON_X FLOAT SET @LON_X =     -46.563120659767286
INSERT INTO TAB_END  
SELECT @END,@LAT_Y, @LON_X,  SYSDATETIME() WHERE @LAT_Y IS NOT NULL
GO

--select * from TAB_END

--------------------------------------------------------------------------------------

SELECT CD_ESCOLA,SG_TP_ESCOLA,NOME_ESCOLA,COD_ALUNO,NOME_ALUNO,DIST_ALU_ESCOLA,ID,ENDERECO,

FLOOR(FLOOR(SQRT(POWER(((LON_ALUNO*1000000) - (A.LON * 1000000) ),2) +  POWER(((LAT_ALUNO*1000000) - (A.LAT * 1000000)),2)) / 10)/0.6) AS DISTÂNCIA


FROM TAB_END A, TBL_ENDERECOS_ALUNOS B

WHERE CD_ESCOLA=309171