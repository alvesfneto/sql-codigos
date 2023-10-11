


select * from SYS.COLUMNS where name like '%aVCB%'


select * from D_ESCOLA

SELECT * FROM ESC

DROP TABLE ##UNIDADES_PARCEIRAS_OSC
SELECT DISTINCT
C.DRE,
C.CD_ESCOLA,
C.SG_TP_ESCOLA AS TIPO,
Nome_Escola,
Nome_instituicao AS OSC,
C.ENDERECO AS Endereco_escola,
C.NR,
C.COMPL,
C.BAIRRO,
'Sem informações' AS AVCB
--A.[Situacao Convenio]
--cd_cnpj_unidade_privada,
--cd_cnas_federal,
--cd_cnas_estadual,
--cd_cnas_municipal,
--cd_ceff_unidade
INTO ##UNIDADES_PARCEIRAS_OSC
FROM dbo.unidades_conv_osc A 
JOIN D_ESCOLA B ON A.[CD ESCOLA] = B.cd_escola COLLATE Latin1_General_CI_AS
JOIN SME_ESCOLA_DIARIO C ON A.[CD ESCOLA] = C.CD_ESCOLA COLLATE Latin1_General_CI_AS
WHERE A.[SITUACAO CONVENIO] ='Aprovado'
--SELECT * FROM  ##UNIDADES_PARCEIRAS_OSC
----------------------------------------------------------------------------------

SELECT * INTO ##UNIDADES_PARCEIRAS_OSC_BT_G FROM  ##UNIDADES_PARCEIRAS_OSC WHERE DRE IN ('DRE - BT','DRE - G')


