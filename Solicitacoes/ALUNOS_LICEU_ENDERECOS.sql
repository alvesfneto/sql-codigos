
--LISTA DE ALUNOS DAS UNIDADES EMEF E EMEI LICEU

DROP TABLE ##ALUNOS_LICEU_ENDERECOS
SELECT  * 
INTO ##ALUNOS_LICEU_ENDERECOS
FROM TBL_ENDERECOS_ALUNOS
WHERE CD_ESCOLA IN (019676,019677)
--SELECT * FROM ##ALUNOS_LICEU_ENDERECOS