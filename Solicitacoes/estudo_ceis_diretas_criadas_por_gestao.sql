

DROP TABLE ##CEIS_CRIADAS_DIR
SELECT 
	 C.SG_TP_ESCOLA AS TIPO,
	 D.nm_unidade_educacao AS [NOME_ESCOLA],
	 
	 A.dt_inicio_ocorrencia_unidade AS [DT_ATO],
	 MIN(A.dt_atualizacao_tabela) AS [DT_CRIACAO],
	 F.[sg_tipo_situacao_unidade] AS SITUACAO_ATUAL,
	 A.CRDATE
 INTO ##CEIS_CRIADAS_DIR
	FROM D_HISTORICO_UNIDADE A
	LEFT JOIN D_ESCOLA B ON A.cd_unidade_educacao=B.CD_ESCOLA
	JOIN D_TIPO_ESCOLA C ON B.tp_escola=C.tp_escola
	LEFT JOIN D_UNIDADE_EDUCACAO D ON A.cd_unidade_educacao=D.cd_unidade_educacao
	JOIN tbl_dre E ON D.cd_unidade_administrativa_referencia = E.CODLOC COLLATE SQL_Latin1_General_CP1_CI_AI
	JOIN tipo_situacao_unidade F ON D.tp_situacao_unidade = F.tp_situacao_unidade
	

	WHERE tp_ocorrencia_historica IN (1,2,9,18,27) AND A.tp_atualizacao_registro IS NULL
	AND B.TP_ESCOLA IN (10,18,28,31)
	GROUP BY
	
	 C.SG_TP_ESCOLA,
	 D.nm_unidade_educacao,
	 
	 A.dt_inicio_ocorrencia_unidade,
	 A.dt_atualizacao_tabela,
	 F.[sg_tipo_situacao_unidade],
	 A.CRDATE

--SELECT * FROM ##CEIS_CRIADAS_DIR



--Gestões:
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO <'2001-01-01'

--Marta Suplicy - 01/01/2001 a 31/12/2004
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO BETWEEN '2001-01-01' AND '2004-12-31'

--jose Serra - 01/01/2005 a 31/03/2006
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO BETWEEN '2005-01-01' AND '2006-03-31'

--Gilberto Kassab - 31/03/2006 a 31/12/2008 e Gilberto Kassab - 01/01/2009 a 31/12/2012
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO BETWEEN '2006-03-31' AND '2012-12-31'

--Fernendo Haddad - 01/01/2013 a 31/12/2016
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO BETWEEN '2013-01-01' AND '2016-12-31'

--João Dória - 01/01/2017 a 06/04/2018
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO BETWEEN '2017-01-01' AND '2018-04-06'

--Bruno Covas - 06/04/2018 a 31/12/2020 e Bruno Covas - 01/01/2021 a 16/05/2021
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_CRIACAO BETWEEN '2018-04-06' AND '2021-05-16'
/* caderno de dados gerenciais - 28/02/2018 - (CEI DIR + CEU CEI) = 362 + CEMEI = 9 TOTAL 371
								 30/04/2021 - (CEI DIR + CEU CEI) = 362 + CEMEI = 30 TOTAL 392
*/
--Ricardo Nunes - desde 16/05/2021
SELECT * FROM ##CEIS_CRIADAS_DIR
WHERE DT_ATO > '2021-05-06'
/* caderno de dados gerenciais - 30/04/2021 - (CEI DIR + CEU CEI) = 362 + CEMEI = 30 TOTAL 392
								 31/05/2023 - (CEI DIR + CEU CEI) = 362 + CEMEI = 30 TOTAL 392
*/

