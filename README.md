# sql-codigos
 <h4>
 Códigos sql de consultas a base de dados de SME-SP <br>
Neste diretório estão as rotinas para baixar as tabelas das bases Prodam/EOL, dados do dia anterior.<br>
Para acesso a estas tabelas tem que ter permissionamento.<br>
Pode ser criada uma conexão Linked Server para o provedor PRODAM. Para tanto tem que solicitar acesso. É requerido usuário e senha.<br>
A sequencia para atualização diaria das bases deve seguir os passos seguintes:<br>
1 - Baixa_tabelas_base_dia_anterior;<br>
2 - EXEC PROCEDURES<br>
<blockquote>
<h4>
EXEC GERA_ALUNOS_DIARIO, <br>
EXEC GERA_CLASSES_DIARIO, <br>
EXEC GERA_ESCOLAS_DIARIO<br></h4>
</blockquote>
<hr>
Disponibilizo também neste diretório as queries para atendimento das solicitações dos diversos setores/departamentos de SME.<br>
Todas as solicitações são baseadas nas tabelas base diárias.<br>
<hr>
No primeiro dia de cada mês as tabelas diarias devem ser guardadas como base do final do mês anterior.<br>
<hr>
</h4>
