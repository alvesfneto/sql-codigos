--LISTA DAS INSTITUIÇÕES COM CNPJ

SELECT distinct
TIPO,
DESLOC,
concat(ENDERECO, ', ',NUMERO,' ',BAIRRO, ' - ',DISTRITO) AS ENDERECO,
B.*
INTO ##OSC
FROM [AJ30MMAA-COMPL] A

RIGHT JOIN (select cd_instituicao, cd_cnpj, nm_representante_legal, cd_cpf_representante_legal,CRDATE
from D_INSTITUICAO WHERE cd_situacao_instituicao=1) B ON A.CODLOC=B.cd_instituicao COLLATE Latin1_General_CI_AS
WHERE Codigo_Status=1

