DROP VIEW VW_CADASTRO_ESCOLAS_DIVULGACAO_EOL

CREATE VIEW VW_CADASTRO_ESCOLAS_DIVULGACAO_EOL AS
SELECT DISTINCT 
YEAR(A.CRDATE) AS ANO,
A.CD_ESCOLA AS CODESC,
A.SG_TP_ESCOLA AS TIPOESC,
A.NOMESC,
A.DRE,
A.NM_UNIDADE_EDUCACAO AS DIRETORIA,
A.DC_SUB_PREFEITURA AS SUBPREF,
M.CEU AS CEU,
A.ENDERECO,
A.NR AS NUMERO,
A.BAIRRO,
A.CEP,
ISNULL(A.FONE1,'') AS TEL1,
ISNULL(A.FONE2,'') AS TEL2,
ISNULL(A.FAX,'') AS FAX,
ISNULL(A.EMAIL,'') AS EMAIL,
'ATIVA' AS SITUACAO,
A.CD_DIST AS CDIST,
A.DISTR AS DISTRITO,
B.SETOR AS SETOR,
A.COD_ESC AS CODSEE,
K.CD_CIE_UNIDADE_EDUCACAO AS CODINEP,
K.cd_endereco_grh AS EH,
L.NOME_ANT,
J.[2D3D] AS T2D3D,
B.TURNOS AS DTURNOS,
A.CD_COORDENADA_GEO_Y AS LATITUDE,
A.CD_COORDENADA_GEO_X AS LONGITUDE,
A.REDE,
k.nr_rgi_sabesp,

G.TOTCLA,
G.VG_OFER,
G.TOTALU,
(G.VG_OFER-G.TOTALU) AS VG_REMAN,
N.ANO_CRIACAO,
CONVERT(VARCHAR,(A.CRDATE-1),103) AS [DATABASE]

FROM SME_ESCOLA_DIARIO A
LEFT JOIN D_MISME_ESCOLA_TOTAL B ON A.CD_ESCOLA=B.CD_ESCOLA
LEFT JOIN (	
			SELECT DISTINCT
			CD_ESCOLA,
			(ISNULL(COUNT(DISTINCT CASE WHEN SG_ETAPA IS NOT NULL THEN CD_TURMA_ESCOLA ELSE NULL END),0) +   
			ISNULL(COUNT (DISTINCT CASE WHEN CD_TIPO_PROGRAMA = 45 THEN CD_TURMA_ESCOLA ELSE NULL END),0)) AS TOTCLA,
			(ISNULL(SUM (CASE WHEN SG_ETAPA IS NOT NULL THEN QT_VAGA_OFERECIDA ELSE NULL END),0) +   
			ISNULL(SUM (CASE WHEN CD_TIPO_PROGRAMA = 45 THEN QT_VAGA_OFERECIDA ELSE NULL END),0)) AS VG_OFER,
			(ISNULL(SUM (CASE WHEN SG_ETAPA IS NOT NULL THEN AL_AT ELSE NULL END),0) +   
			ISNULL(SUM (CASE WHEN CD_TIPO_PROGRAMA = 45 THEN AL_AT ELSE NULL END),0)) AS TOTALU
			FROM SME_CLASSES_DIARIO
		    GROUP BY CD_ESCOLA)

/*
		SELECT DISTINCT
		B.CD_ESCOLA,
		(ISNULL (B.CL_EI,0)+ISNULL(B.CL_FUND,0)+ISNULL (B.CL_MEDI,0)+ISNULL(B.CL_EJA,0)+ISNULL(B.CL_PROF,0)+ISNULL(B.CL_MOVA,0)
		+ISNULL(BB.CL_EI,0)+ISNULL(BB.CL_FUND,0)+ISNULL(BB.CL_MEDI,0)+ISNULL(BB.CL_EJA,0)+ISNULL(BB.CL_PROF,0)+ISNULL(BB.CL_MOVA,0)) AS TOTCLA,
		(ISNULL(B.MT_EI,0)+ISNULL(B.MT_FUND,0)+ISNULL(B.MT_MEDI,0)+ISNULL(B.MT_EJA,0)+ISNULL(B.MT_PROF,0)+ISNULL(B.MT_MOVA,0)
		+ISNULL(BB.MT_EI,0)+ISNULL(BB.MT_FUND,0)+ISNULL(BB.MT_MEDI,0)+ISNULL(BB.MT_EJA,0)+ISNULL(BB.MT_PROF,0)+ISNULL(BB.MT_MOVA,0)+ISNULL(BB.MT_EI,0)) AS TOTALU
		FROM D_MISME_ESCOLA_TOTAL B
		LEFT JOIN D_MISME_EE_ESCOLA_TOTAL BB ON B.CD_ESCOLA=BB.CD_ESCOLA) 
*/		
		G ON A.CD_ESCOLA= G.CD_ESCOLA

LEFT JOIN (		SELECT 
			H.CD_ESCOLA,
			CASE WHEN G=1 THEN '2D' ELSE CASE WHEN ISNULL(M,0)+ISNULL(I,0)+ISNULL(T,0)+ISNULL(V,0)<3 THEN '2D'
			ELSE '3D' END END AS [2D3D],  	
			H.TURNOS
			FROM D_MISME_ESCOLA_TOTAL H
			JOIN (
			SELECT 
			CD_ESCOLA,
			CASE WHEN TURNO_M='X' THEN 1 ELSE NULL END  AS M,
			CASE WHEN TURNO_I='X' THEN 1 ELSE NULL END  AS I,
			CASE WHEN TURNO_T='X' THEN 1 ELSE NULL END  AS T,
			CASE WHEN TURNO_V='X' THEN 1 ELSE NULL END  AS V,
			CASE WHEN TURNO_N='X' THEN 1 ELSE NULL END  AS N,
			CASE WHEN TURNO_G='X' THEN 1 ELSE NULL END  AS G
			FROM D_MISME_ESCOLA_TOTAL) I ON H.CD_ESCOLA=I.CD_ESCOLA
			) J ON A.CD_ESCOLA=J.CD_ESCOLA

LEFT JOIN (		SELECT
			cd_unidade_educacao,
			CD_CIE_UNIDADE_EDUCACAO,
			cd_endereco_grh,
			nr_rgi_sabesp
			FROM 
			D_UNIDADE_EDUCACAO
			WHERE tp_situacao_unidade=1) K ON A.CD_ESCOLA=K.cd_unidade_educacao

LEFT JOIN (		SELECT DISTINCT
			CD_ESCOLA,
			(CASE WHEN NM_CRIACAO=NOMESC THEN '' ELSE NM_CRIACAO END ) AS NOME_ANT
			FROM 
			SME_ESCOLAS_ATOS_CRIACAO) L ON A.CD_ESCOLA=L.CD_ESCOLA

LEFT JOIN (	SELECT 
			CODLOC,
			CEU

			FROM [dbo].[CEUS - ESCOLAS]) M ON A.CD_ESCOLA collate Latin1_General_CI_AS = M.CODLOC

LEFT JOIN (SELECT DISTINCT
cd_unidade_educacao,
tp_ocorrencia_historica,
nr_ato,dt_publicacao_dom, 
dt_inicio_ocorrencia_unidade,
dt_atualizacao_tabela,
YEAR(dt_inicio_ocorrencia_unidade) AS ANO_CRIACAO 

FROM D_HISTORICO_UNIDADE A
RIGHT JOIN SME_ESCOLA_DIARIO B ON A.cd_unidade_educacao=B.CD_ESCOLA
WHERE (tp_ocorrencia_historica=1 AND B.CD_SIT=1)) N ON A.CD_ESCOLA=N.cd_unidade_educacao
WHERE A.CD_SIT = 1 AND TP_ESCOLA NOT IN (15,19,21,27)

--SELECT * FROM VW_CADASTRO_ESCOLAS_DIVULGACAO_EOL



