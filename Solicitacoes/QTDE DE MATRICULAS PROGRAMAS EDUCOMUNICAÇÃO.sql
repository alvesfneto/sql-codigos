
--QTDE DE MATRICULAS PROGRAMAS EDUCOMUNICAÇÃO 

/*
A pedido do SECOM da prefeitura precisamos encaminhar os dados referente aos projetos de Educomunicação desenvolvidos na rede. Pedimos a gentileza de encaminhar os dados   como nome projeto, DRE, escola, nome do professor, e-mail, nº estudantes atendidos referente as seguintes propostas:

EDUCOMUNICAÇÃO - ANIMAÇÃO/STOPMOTION
EDUCOMUNICAÇÃO - BLOG/SITE
EDUCOMUNICAÇÃO - CINEMA/CINECLUBE
EDUCOMUNICAÇÃO - FAKE NEWS E DESINFORMAÇÃO 
EDUCOMUNICAÇÃO - FANZINE
EDUCOMUNICAÇÃO - FOTOGRAFIA
EDUCOMUNICAÇÃO - HISTÓRIA EM QUADRINHOS
EDUCOMUNICAÇÃO - IMPRENSA JOVEM
EDUCOMUNICAÇÃO – IMPRENSA MIRIM
EDUCOMUNICAÇÃO - JORNAL ESCOLAR
EDUCOMUNICAÇÃO - JORNAL MURAL
EDUCOMUNICAÇÃO - MÍDIAS SOCIAIS
EDUCOMUNICAÇÃO - PRODUÇÃO DE VÍDEO
EDUCOMUNICAÇÃO - RÁDIO ESCOLAR
EDUCOMUNICAÇÃO - REVISTA
EDUCOMUNICAÇÃO - VIDEOPERFORMANCE
EDUCOMUNICAÇÃO - CULTURA DIGITAL 
*********************************************************************************************/

DROP TABLE ##MATRICULAS_EDUCOM
SELECT 
B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.CD_TURMA_ESCOLA,
C.dc_tipo_programa,
A.AL_AT AS MATR,
CONVERT(VARCHAR, A.CRDATE-1, 103) AS DT_BASE
INTO ##MATRICULAS_EDUCOM

FROM SME_CLASSES_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_TIPO_PROGRAMA C ON A.CD_TIPO_PROGRAMA=C.cd_tipo_programa
WHERE A.CD_TIPO_PROGRAMA IS NOT NULL AND C.DC_tipo_programa LIKE 'EDUCOM%'
GROUP BY

B.DRE,
B.CD_ESCOLA,
B.SG_TP_ESCOLA,
B.NOMESC,
A.CD_TURMA_ESCOLA,
C.dc_tipo_programa,
A.AL_AT,
A.CRDATE
ORDER BY 2,6

--SELECT * FROM ##MATRICULAS_EDUCOM
/********************************************************************************************/



