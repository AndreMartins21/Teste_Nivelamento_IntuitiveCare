# Criando o banco de dados e usando-o
CREATE DATABASE IF NOT EXISTS intuitivecare_andre;

use intuitivecare_andre;

# -> QUERIE DE LOAD (Relatório Cadop):

CREATE TABLE IF NOT exists relatorio (
`Registro` varchar(50) PRIMARY KEY,
`CNPJ` varchar(255),
`Razão Social` varchar(255),
`Nome Fantasia` varchar(255),
`Modalidade` varchar(255),
`Logradouro` varchar(255),
`Número` varchar(50),
`Complemento` varchar(255),
`Bairro` varchar(255),
`Cidade` varchar(50),
`UF` varchar(2),
`CEP` varchar(255),
`DDD` varchar(5),
`Telefone` varchar(50),
`FAX` varchar(255),
`Endereco Eletronico` varchar(255),
`Representante` varchar(255),
`Cargo Representante` varchar(255),
`Data Registro ANS` varchar(50)
);	
# P.S: A maioria das atribuições às colunas dessa tabela estava gerando erro ao colocar valores como INT. Para evitá-los atribui VARCHAR() em tais. 

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Intuitive Care/Relatorio_cadop.csv"
INTO TABLE relatorio
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*) from relatorio;

# -> QUERIE DE LOAD 2 (Demonstrações Contabeis):

CREATE TABLE IF NOT EXISTS demo (
`DATA` varchar(50),
`REG_ANS` varchar(50) NOT NULL,
`CD_CONTA_CONTABIL` varchar(150),
`DESCRICAO` varchar(255),
`VL_SALDO_FINAL` varchar(50)
);
# <> OBSERVAÇÕES: 
# Não tem Key Primária;
# O tipo primitivo do campo `VL_SALDO_FINAL` passará a ser DOUBLE na Query Analítica. Isso porque estava ocorrendo alguns erros ao tentar setar tal tipo primitivo 


# 1T2021 - 688.887 rows
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Intuitive Care/1T2021.csv"
INTO TABLE demo
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


# 4T2020 - 865.171 rows
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Intuitive Care/4T2020.csv"
INTO TABLE demo
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


# 3T2020 - 686.756 rows
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Intuitive Care/3T2020.csv"
INTO TABLE demo
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS; 


# 2T2020 - 672.239 rows
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Intuitive Care/2T2020.csv"
INTO TABLE demo
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


# 1T2020 - 679.640
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Intuitive Care/1T2020.csv"
INTO TABLE demo
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


# TOTAL DE DADOS => 3.592.694 
select count(*) as `TOTAL_DE_DADOS` from demo;


# -> QUERIE ANALÍTICA

# 1°) 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre
SELECT demo.`REG_ANS`, relatorio.`Razão Social` as `Operadoras`, demo.`VL_SALDO_FINAL` as `VALOR_TOTAL_TRIM`, demo.descricao from demo 
JOIN relatorio 
ON demo.`REG_ANS` = relatorio.Registro
WHERE `DESCRICAO` = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' and `DATA` = "01/01/2021"
ORDER BY CAST(REPLACE(`VL_SALDO_FINAL`, ',', '.') AS DOUBLE)
limit 10;

# 2°) 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?
SELECT demo.`REG_ANS`, relatorio.`Razão Social` as `Operadoras`, demo.`VL_SALDO_FINAL` as `VALOR_TOTAL_TRIM`, demo.descricao from demo 
JOIN relatorio 
ON demo.`REG_ANS` = relatorio.Registro
WHERE `DESCRICAO` = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' and `DATA` LIKE "%2020"
ORDER BY CAST(REPLACE(`VL_SALDO_FINAL`, ',', '.') AS DOUBLE)
limit 10;
