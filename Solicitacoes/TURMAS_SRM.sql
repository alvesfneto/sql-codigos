
--lista de turmas SRM
--SELECT * FROM D_PROGRAMA_ESCOLA
--
--SELECT * FROM D_TIPO_PROGRAMA WHERE sg_tipo_programa LIKE '%SRM%'


SELECT DRE,B.CD_ESCOLA,B.SG_TP_ESCOLA, NOMESC,CD_TURMA_ESCOLA, C.dc_tipo_programa,(A.CRDATE -1) AS DT_BASE


INTO ##TURMAS_SRM

FROM 


SME_CLASSES_DIARIO A
JOIN SME_ESCOLA_DIARIO B ON A.CD_ESCOLA=B.CD_ESCOLA
JOIN D_TIPO_PROGRAMA C ON A.CD_TIPO_PROGRAMA=C.cd_tipo_programa


WHERE A.CD_TIPO_PROGRAMA IN (94,95,96,97,403,408)