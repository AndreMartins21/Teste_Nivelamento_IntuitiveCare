# Criando o banco de dados e usando-o
CREATE DATABASE IF NOT EXISTS intuitivecare_andre;

use intuitivecare_andre;

# Criação da tabela correspondente ao 'relatorio_cadop'
CREATE TABLE IF NOT exists relatorio (
`Registro` int PRIMARY KEY,
`CNPJ` varchar(50),
`Razão Social` varchar(255),
`Nome Fantasia` varchar(255),
`Modalidade` varchar(150),
`Logradouro` varchar(255),
`Número` varchar(150),
`Complemento` varchar(255),
`Bairro` varchar(150),
`Cidade` varchar(150),
`UF` varchar(2),
`CEP` int,
`DDD` int,
`Telefone` varchar(100),
`FAX` varchar(50),
`Endereco Eletronico` varchar(150),
`Representante` varchar(255),
`Cargo Representante` varchar(255),
`Data Registro ANS` varchar(255)
);

# Criação da tabela para o preenchimento do CSV com as informações do Trimestre
CREATE TABLE IF NOT EXISTS demo(
`DATA` varchar(50),
`REG_ANS` varchar(50) NOT NULL,
`CD_CONTA_CONTABIL`varchar(150),
`DESCRICAO` varchar(255),
`VL_SALDO_FINAL` varchar(100)
); # Não tem Key Primária


# QUERIE DE LOAD:
-- Devido ao comando `LOAD DATA INFILE` não estar funcionando em minha máquina, importei os arquivos CSV'S através da ferramenta "Table Data Import Wizard " 
--do MySQL Workbench. Com ela, os dados já são automaticamente inseridos na tabela selecionada
# Relatorio_cadop = OK
# CSV 1T2021 = Uma amostra dos dados OK
SELECT * FROM relatorio;
SELECT * FROM demo;


-- Observação: DO CSV 1T2021 consegui obter 75131 dados, haja vista alguns problemas que tive para inserir o restante dos dados... 
select count(*) from demo;


# QUERIE ANALÍTICA
# 1° Questão: 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre
SELECT demo.`REG_ANS`, relatorio.`Razão Social`, SUM(demo.`VL_SALDO_FINAL`) AS `VALOR_TOTAL_TRIM`, demo.descricao from demo 
JOIN relatorio 
ON demo.`REG_ANS` = relatorio.Registro
WHERE descricao LIKE 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
GROUP BY demo.`REG_ANS`
ORDER BY `VALOR_TOTAL_TRIM` DESC
limit 10;
