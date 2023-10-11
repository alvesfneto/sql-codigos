
/*

1- a relação das Unidades Educacionais (endereço) que atendam o EJA e o CIEJA;

2- o nº total dos estudantes matriculados no EJA  e CIEJA; 

3- o nº de estudantes acima de 60 anos dessas Unidades acima elencadas;


*/
DROP´TABLE ##ESCOLAS_EJA_MATRICULAS
SELECT
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
B.ENDERECO,
B.NR,
B.COMPL,
B.BAIRRO,
A.SG_ETAPA,
COUNT(DISTINCT CASE WHEN SG_ETAPA LIKE  'eja%' THEN A.CD_ALUNO ELSE NULL END) AS MT_EJA,
C.[MT60+],
CONVERT(varchar,A.CRDATE-1, 103) AS DT_BASE
INTO ##ESCOLAS_EJA_MATRICULAS


FROM SME_ALUNOS_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
LEFT JOIN  (SELECT
			CD_ESCOLA,
			COUNT (DISTINCT CASE WHEN DATEDIFF(year, DT_NASCIMENTO_ALUNO, GETDATE())>=60 AND SG_ETAPA LIKE  'eja%' THEN CD_ALUNO ELSE NULL END)  AS [MT60+]
			
            FROM SME_ALUNOS_DIARIO
		    WHERE SG_ETAPA LIKE  'eja%'
		    AND DATEDIFF(year, DT_NASCIMENTO_ALUNO, GETDATE())>=60 GROUP BY CD_ESCOLA) C ON A.CD_ESCOLA=C.CD_ESCOLA
WHERE A.SG_ETAPA LIKE  'eja%'
GROUP BY 
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
B.ENDERECO,
B.NR,
B.COMPL,
B.BAIRRO,
A.SG_ETAPA,
A.CRDATE,
C.[MT60+]
--SELECT * FROM ##ESCOLAS_EJA_MATRICULAS
--------------------------------------------------------------------------------------------------------------

