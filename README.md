[![Linkedin Badge](https://img.shields.io/badge/-André_Martins-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/andre-martins-3a9520201/)](https://www.linkedin.com/in/andre-martins-3a9520201)

<a>
     <img src="https://github.com/AndreMartins21/Teste_Nivelamento_IntuitiveCare/blob/main/Arquivos/logo.jpg"/>
</a>

# <> Teste de Nivelamento - Desenvolvedor de Software

- **Objetivo:** Realizar a etapa do processo seletivo para a vaga de estágio em desenvolvimento de software, que consiste na exploração de dois aspectos: Conhecimentos básicos de programação e Organização do código;

- **Candidato responsável:** André Augusto Moreira Martins

- **Recursos utilizados:** 
<br>- Testes 1 e 2: Infra Google Colab, a qual permite a utilização de Jupyter Notebooks (Em Python);
<br>- Teste 3: MySQL Workbench.


## Desafios Escolhidos:

***/> Teste 1*** - [WebScraping](https://github.com/AndreMartins21/Teste_Nivelamento_IntuitiveCare/blob/main/Teste1.ipynb) 
```
Neste teste o candidato deverá criar um código (em uma das linguagens mencionadas no fim desse email) que execute as tarefas de código abaixo.
Tarefas de código:
    - 1.1 - Acessar o site: http://www.ans.gov.br/prestadores/tiss-troca-de-informacao-de-saude-suplementar;
    - 1.2 - Buscar a versão mais recente do Padrão TISS (arquivo - padrao_tiss_componente_organizacional_201902.pdf);
    - 1.3 - Baixar o componente organizacional;
```
- **Bibliotecas usadas:** Requests - BS4
-------------------------------------------------------------------------------------------------

***/> Teste 2*** - [Transformação de dados](https://github.com/AndreMartins21/Teste_Nivelamento_IntuitiveCare/blob/main/Teste2.ipynb)
```
Neste teste o candidato deverá criar um código (em uma das linguagens mencionadas no fim desse email) que execute as tarefas de código abaixo.
Tarefas de código:
    - Extrair do pdf do teste 1 acima os dados dos Quadros 30,31,32 (Tabela de categoria do Padrão TISS);
    - Salvar dados dessas tabelas em csvs;
    - Zipar todos os csvs num arquivo "Teste_Intuitive_Care_{seu_nome}.zip".
```
- **Bibliotecas usadas:** Tabula - Pandas - Zipfile
-------------------------------------------------------------------------------------------------

***/> Teste 3*** - [Banco de dados](https://github.com/AndreMartins21/Teste_Nivelamento_IntuitiveCare/blob/main/Teste3.sql) 
```
Neste teste o candidato deverá criar scripts sql (MySQL 8.* ou Postgres >10.0) que execute as tarefas de código abaixo.
Tarefas de Preparação:
    - Baixar os arquivos dos últimos 2 anos no repositório público : http://ftp.dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/ (pode ser feito manualmente)
    - Baixar csv do link: http://www.ans.gov.br/externo/site_novo/informacoes_avaliacoes_oper/lista_cadop.asp (pode ser feito manualmente)
Tarefas de código:
    - Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação num banco MySQL ou Postgres (Atenção ao encoding dos arquivos!)
    - Montar uma query analítica que traga a resposta para as seguintes perguntas:
        - Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?
        - Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?
```

**<> Resultado Obtido (Teste 3):**

(10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no 1° trimestre de 2021)

![image](https://user-images.githubusercontent.com/64978311/126925554-84fe662c-844b-4d53-ac4f-5b5a19918830.png)


(10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano)

![image](https://user-images.githubusercontent.com/64978311/126925424-4d8f1fcd-1252-48a8-867b-ffa3c6bf65ff.png)
