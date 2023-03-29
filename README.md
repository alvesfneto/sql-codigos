# sql-codigos
 Códigos sql de consultas a base de dados de SME-SP
Neste diretório estão as rotinas para baixar as tabelas das bases Prodam/EOL, dados do dia anterior.
Para acesso a estas tabelas tem que ter permissionamento.
A sequencia para atualização diaria das bases deve seguir os passos seguintes:
1 - Baixa_tabelas_base_dia_anterior;
2 - EXEC PROCEDURES
    Procedure-gera-alunos-diario;
    Procedure-gera-classes-diario;
    Procedure-gera-escolas-diario
------------------------------------------------------------
Disponibilizo também neste diretório as queries para atendimento das solicitações dos diversos setores/departamentos de SME.
Todas as solicitações são baseadas nas tabelas base diárias.
-------------------------------------------------------------
No primeiro dia de cada mês as tabelas diarias devem ser guardadas como base do final do mês anterior.
-----------------------------------------------------------------
