# sql-codigos
 Códigos sql de consultas a base de dados de SME-SP <br>
Neste diretório estão as rotinas para baixar as tabelas das bases Prodam/EOL, dados do dia anterior.<br>
Para acesso a estas tabelas tem que ter permissionamento.<br>
A sequencia para atualização diaria das bases deve seguir os passos seguintes:<br>
1 - Baixa_tabelas_base_dia_anterior;<br>
2 - EXEC PROCEDURES<br>
    Procedure-gera-alunos-diario;<br>
    Procedure-gera-classes-diario;<br>
    Procedure-gera-escolas-diario<br>
------------------------------------------------------------<br>
Disponibilizo também neste diretório as queries para atendimento das solicitações dos diversos setores/departamentos de SME.<br>
Todas as solicitações são baseadas nas tabelas base diárias.<br>
-------------------------------------------------------------<br>
No primeiro dia de cada mês as tabelas diarias devem ser guardadas como base do final do mês anterior.<br>
-----------------------------------------------------------------
