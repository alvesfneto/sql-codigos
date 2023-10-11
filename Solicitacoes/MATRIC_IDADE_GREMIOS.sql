--LISTA UNIDADES CIEJA, EMEBS E EMEFM COM QTDE DE ALUNOS POR FAIXAS ET�RIAS

/*
A fim de oferecer informa��es atualizadas para o N�cleo de Transpar�ncia (NUTAC), 
no que diz respeito aos Gr�mios Estudantis e o p�blico contemplado com faixa 
et�ria entre 15 e 29 anos, solicitamos, por gentileza, os nomes das
 EMEFMs, EMEBSs, CIEJAs e EJAs, bem como o quantitativo de 
 estudantes correspondentes a cada ano/s�rio.
 */
SELECT
DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.SG_ETAPA,
A.SG_SERIE_ENSINO,
--COUNT (DISTINCT CASE WHEN (C.IDADE = 15 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '15 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 16 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '16 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 17 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '17 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 18 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '18 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 19 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '19 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 20 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '20 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 21 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '21 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 22 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '22 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 23 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '23 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 24 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '24 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 25 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '25 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 26 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '26 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 27 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '27 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 28 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '28 ANOS',
--COUNT (DISTINCT CASE WHEN (C.IDADE = 29 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '29 ANOS',
COUNT (DISTINCT CASE WHEN (C.IDADE BETWEEN 0 AND 14 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS 'AT� 14 ANOS',
COUNT (DISTINCT CASE WHEN (C.IDADE BETWEEN 15 AND 29 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS '15 A 29',
COUNT (DISTINCT CASE WHEN (C.IDADE > 29 AND A.SG_ETAPA IS NOT NULL) THEN A.CD_ALUNO ELSE NULL END) AS 'MAIS DE 29',
COUNT (DISTINCT CASE WHEN A.SG_ETAPA IS NOT NULL THEN A.CD_ALUNO ELSE NULL END) AS TOT_MATR
INTO ##MATRIC_IDADE_GREMIOS
FROM 
SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN(
     SELECT 
     CD_ALUNO, 
     DATEDIFF(year, DT_NASCIMENTO_ALUNO, GETDATE()) AS IDADE
     FROM SME_ALUNOS_DIARIO
     WHERE SG_ETAPA IS NOT NULL) C ON A.CD_ALUNO=C.CD_ALUNO
WHERE 
B.TP_ESCOLA IN(3,4,13) 
AND SG_ETAPA IS NOT NULL
GROUP BY 
DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.SG_ETAPA,
A.SG_SERIE_ENSINO
--SELECT * FROM ##MATRIC_IDADE_GREMIOS
---




