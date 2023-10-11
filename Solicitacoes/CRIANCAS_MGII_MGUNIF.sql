
/*
Por gentileza, preciso de um arquivo que tenha as crianças matriculadas de MGII e Multietária com:


Endereço completo;

Data de nascimento.
*/

--DROP TABLE ##CRIANCAS_MGII_MGUNIF

SELECT 
DRE,
C.CD_ESCOLA,
SG_TP_ESCOLA,
NOMESC,
CONCAT (C.ENDERECO,', ',C.NR,' ',C.COMPL,' ',C.BAIRRO) AS END_ESCOLA,
SG_ETAPA,
SG_SERIE_ENSINO,
A.CD_ALUNO,
NM_ALUNO,
B.TP_LOGRADOURO,
B.ENDEREÇO,
B.NR,
B.COMPL,
B.BAIRRO,
CONVERT(VARCHAR,DT_NASCIMENTO_ALUNO, 103) AS DT_NASCIMENTO
INTO ##CRIANCAS_MGII_MGUNIF
 FROM SME_ALUNOS_DIARIO A
 JOIN (SELECT distinct 
	     A.cd_aluno, 
	     A.cd_escola,
	     E.dc_tp_logradouro AS TP_LOGRADOURO,
	     D.nm_logradouro AS ENDEREÇO, 
	     D.cd_nr_endereco AS NR, 
	     D.dc_complemento_endereco AS COMPL, 
	     D.nm_bairro AS BAIRRO, 
	     D.cd_cep AS CEP, 
	     D.cd_coordenada_geo_y AS LAT_ALUNO, 
	     D.cd_coordenada_geo_x AS LON_ALUNO,
	     A.qt_distancia AS DIST_ESCOLA,
	     A.qt_distancia_carro AS DIST_CARRO,
	     A.an_letivo AS ANO_LETIVO, 
	     CONVERT(VARCHAR, A.CRDATE,103) AS CRDATE
	     FROM D_MATRICULA A 
	     INNER JOIN ((D_ENDERECO_ALUNO B
	     INNER JOIN D_endereco_aluno_tipo_endereco C ON B.cd_endereco_aluno = C.cd_endereco_aluno) 
	     INNER JOIN D_endereco D ON B.ci_endereco = D.ci_endereco) ON A.cd_aluno = B.cd_aluno
	     INNER JOIN D_TIPO_LOGRADOURO E ON D.tp_logradouro= E.tp_logradouro
	     INNER JOIN TIPO_ENDERECO F ON C.ci_tipo_endereco =F.ci_tipo_endereco
	     WHERE B.dt_fim Is Null 
	     AND A.st_matricula='1'
	     AND A.cd_serie_ensino IS NOT NULL
	     AND A.an_letivo=YEAR(GETDATE())
	     AND C.dt_fim Is Null
	     AND F.ci_tipo_endereco='1')   B ON A.CD_ALUNO=B.CD_ALUNO

 JOIN SME_ESCOLA_DIARIO C ON A.CD_ESCOLA=C.CD_ESCOLA
 
 WHERE A.SG_SERIE_ENSINO IN ('MG II','MG UNIF')
 --SELECT * FROM ##CRIANCAS_MGII_MGUNIF


  