

--DROP TABLE TAB_END

--CREATE TABLE TAB_END (
--     ID  INT IDENTITY(1,1),
--     ENDERECO_BASE NVARCHAR(200) NULL,
--     LAT FLOAT NULL,
--     LON FLOAT NULL,
--     DATA_GERACAO DATETIME NULL )

 
 
TRUNCATE TABLE TAB_END



DECLARE @END NVARCHAR(200) SET @END = 'RUA helvetia'
DECLARE @LAT_Y FLOAT SET @LAT_Y = -23.5358092
DECLARE      @LON_X FLOAT SET @LON_X = -46.6457666
INSERT INTO TAB_END 

SELECT @END,@LAT_Y, @LON_X,  SYSDATETIME() WHERE @LAT_Y IS NOT NULL
GO
 
 

drop table ##escola_Proxima
SELECT   *
             , DISTANCIA =  FLOOR(SQRT(POWER(((B.[CD_COORDENADA_GEO_X] * 1000000) - (A.lon * 1000000 ) ),2) +  POWER(((B.[CD_COORDENADA_GEO_Y] * 1000000)  - (A.lat * 1000000 )),2)) / 10)/0.6
             into ##escola_proxima
             FROM ( --SELECT     CD_SIT AS CD_SIT_2, DEPADM AS DEPADM_2, NOMEDEP AS NOMEDEP_2, REDE AS REDE_2, DRE AS DRE_2, NM_UNIDADE_EDUCACAO AS NM_UNIDADE_EDUCACAO_2,
                           --           CD_DIST AS CD_DIST_2, DISTR AS DISTR_2, SETOR AS SETOR_2, TP_ESCOLA as TP_ESCOLA_2, SG_TP_ESCOLA as SG_TP_ESCOLA_2, NOMESC as NOMESC_2, A.CD_ESCOLA as CD_ESCOLA_2,
                           --           COD_ESC as COD_ESC_2, CODESCMEC as CODESCMEC_2, CD_CIE_UNID as CD_CIE_UNID_2, ENDERECO as ENDERECO_2, NR as NR_2, COMPL as COMPL_2, BAIRRO as BAIRRO_2, CEP as CEP_2,
                           --           CD_COORDENADA_GEO_Y as CD_COORDENADA_GEO_Y_2, CD_COORDENADA_GEO_X as CD_COORDENADA_GEO_X_2, DDD as DDD_2, FONE1 as FONE1_2, FONE2 as FONE2_2,
                           --           FAX as FAX_2, EMAIL as EMAIL_2, ZONA as ZONA_2, CD_SUB_PREFEITURA as CD_SUB_PREFEITURA_2, DC_SUB_PREFEITURA as DC_SUB_PREFEITURA_2, CRDATE as CRDATE_2, AL_AT AS AL_AT_2
                           --           FROM SME_ESCOLA_DIARIO A
                           --           left join (   select CD_ESCOLA, SUM(AL_AT)AL_AT FROM SME_CLASSES_DIARIO
                           --                                WHERE  CD_SERIE_ENSINO IS NOT NULL
                           --                                             AND CD_TIPO_TURMA =1
                           --                                             AND ST_TURMA_ESCOLA <> 'E'
                           --                                GROUP BY CD_ESCOLA) B ON A.CD_ESCOLA = B.CD_ESCOLA
                           --           WHERE  CD_SIT = 1
                           --                         AND A.CD_ESCOLA in (014249)--select * from sme_escola_diario where nomesc like '%ERNESTO%'
                                                      --AND NOMESC LIKE '%JOSE KAUFFMANN%'
                                                      ----23.5358092 -46.6457666
                           --ENDEREÇO INEXISTENTES - PARA CASO DO CEU AINDA EM CONSTRUCAO*/

                          select * from tab_end
                           ) A, ( select  TOP 0
                                                       [CD_SIT]
                                                      ,[DEPADM]
                                                      ,[NOMEDEP]
                                                      ,[REDE]
                                                      ,[DRE]
                                                      ,[NM_UNIDADE_EDUCACAO]
                                                      ,[CD_DIST]
                                                      ,[DISTR]
                                                      ,[SETOR]
                                                      ,[TP_ESCOLA]
                                                      ,[SG_TP_ESCOLA]
                                                      ,' ' AS ATEND_ED_INF
                                                      ,' ' AS ATEND_EFINI
                                                      ,' ' AS ATEND_EFFIN
                                                      ,' ' AS ATEND_EM   
                                                      ,[NOMESC]
                                                      ,A.[CD_ESCOLA]
                                                      ,[COD_ESC]
                                                      ,[CODESCMEC]
                                                      ,[CD_CIE_UNID]
                                                      ,[ENDERECO]
                                                      ,[NR]
                                                      ,[COMPL]
                                                      ,[BAIRRO]
                                                      ,[CEP]
                                                      ,[CD_COORDENADA_GEO_Y]
                                                      ,[CD_COORDENADA_GEO_X]
                                                      ,[DDD]
                                                      ,[FONE1]
                                                      ,[FONE2]
                                                      ,[FAX]
                                                      ,[EMAIL]
                                                      ,[ZONA]
                                                      ,[CD_SUB_PREFEITURA]
                                                      ,[DC_SUB_PREFEITURA]
                                                      ,[CRDATE]
                                              

                                                      FROM SME_ESCOLA_DIARIO A
                                                      Left join (  select CD_ESCOLA, SUM(AL_AT)QT_ALUNOS FROM SME_CLASSES_DIARIO
													                                                        WHERE  CD_SERIE_ENSINO IS NOT NULL
                                                             AND CD_TIPO_TURMA =1
                                                             AND ST_TURMA_ESCOLA <> 'E'
                                                      GROUP BY CD_ESCOLA) B ON A.CD_ESCOLA = B.CD_ESCOLA  COLLATE Latin1_General_CI_AS
													                                                        WHERE CD_SIT = 1
                                      

                                        UNION all

                                        --aqui entra em segundo somente pra manter o formato do campo latlon da tabela do EOL...se fizer direto não herda o formato...bora tentar com union partindo da tabela orginial

                                        SELECT CODSIT, DEPADM, NOMEDEP, '' as REDE, DE, DRE, CODDIST, DISTR, SETOR, TIPOESC, 'SEC_ESTADO' AS DESC_TIPOESC,

                                                      ATEND_ED_INF = CASE WHEN EXISTS (SELECT * FROM SEE_CLASSES B WHERE A.COD_ESC = B.COD_ESC AND GRAU = 06)  THEN 'S' ELSE 'N' END,

                                                      ATEND_EFINI         = CASE WHEN EXISTS (SELECT * FROM SEE_CLASSES B WHERE A.COD_ESC = B.COD_ESC AND GRAU = 14 AND SERIE < 06)  THEN 'S' ELSE 'N' END,

                                                      ATEND_EFFIN         = CASE WHEN EXISTS (SELECT * FROM SEE_CLASSES B WHERE A.COD_ESC = B.COD_ESC AND GRAU = 14 AND SERIE > 05)  THEN 'S' ELSE 'N' END,

                                                      ATEND_EM            = CASE WHEN EXISTS (SELECT * FROM SEE_CLASSES B WHERE A.COD_ESC = B.COD_ESC AND GRAU = 02 )THEN 'S' ELSE 'N' END,

                                                      NOMESC, 
													  '' AS CD_ESCOLA,
													  COD_ESC, 
													  CODESCMEC, 
													  COD_UNID_ADM, 
													  ENDESC, 
													  NUMESC, 
													  COMPLEND, 
													  BAIESC, 
													  (CODCEP+COMPCEP) COLLATE Latin1_General_CI_AS as CEP ,
													  convert(nvarchar(10),REPLACE(DS_LATITUDE,',','.')) as DS_LATITUDE,
													  convert(nvarchar(10),REPLACE(DS_LONGITUDE,',','.')) as DS_LONGITUDE,
													  DDD COLLATE Latin1_General_CI_AS, 
													  FONE1 COLLATE Latin1_General_CI_AS, 
													  FONE2 COLLATE Latin1_General_CI_AS, 
													  FAX COLLATE Latin1_General_CI_AS, 
													  EMAIL COLLATE Latin1_General_CI_AS,
													  '' AS ZONA, 
													  '' AS CD_SUBPRE, 
													  '' AS DC_SUB,  
													  CONVERT(DATE,(SELECT TOP 1 CRDATE FROM SME_ESCOLA_DIARIO)) AS CRDATE

                                                      FROM SEE_ESCOLA A

                                                      WHERE CODSIT = 1

                                                      AND CHAVE NOT BETWEEN 19901 AND 19928

                                                      AND CODMUN = 100

                                                      AND DEPADM = 3

                                                      --and convert(int,REPLACE(DS_LATITUDE,',','.')) in (0)

                                                      AND EXISTS (SELECT * FROM SEE_CLASSES B WHERE A.COD_ESC = B.COD_ESC COLLATE Latin1_General_CI_AS AND GRAU IN (14))

                                                     

                                                     

                                  ) as B

                          

             WHERE  (ATEND_EFINI = 's' or ATEND_EFFIN = 's')

                        AND FLOOR(SQRT(POWER(((B.[CD_COORDENADA_GEO_X] * 1000000) - (A.lon * 1000000 ) ),2) +  POWER(((B.[CD_COORDENADA_GEO_Y] * 1000000)  - (A.lat * 1000000 )),2)) / 10)/0.6 < 3000

 

ORDER BY                   FLOOR(SQRT(POWER(((B.[CD_COORDENADA_GEO_X] * 1000000) - (A.lon * 1000000 ) ),2) +  POWER(((B.[CD_COORDENADA_GEO_Y] * 1000000)  - (A.lat * 1000000 )),2)) / 10)/0.6

 

 

 

 

 

select * from ##escola_Proxima