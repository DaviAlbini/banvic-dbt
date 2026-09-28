WITH 

    fonte_clientes AS (

        SELECT *
        FROM {{ source('erp', 'clientes') }}

    )

    , renomear AS (

        SELECT 
            CAST(COD_CLIENTE AS INT) AS PK_CLIENTE,
            CAST(COD_LOCALIDADE AS INT) AS FK_LOCALIDADE,
            PRIMEIRO_NOME || ' ' || ULTIMO_NOME AS NOME_CLIENTE,
            EMAIL AS EMAIL_CLIENTE,
            TIPO_CLIENTE,
            CAST(DATA_INCLUSAO AS TIMESTAMP) AS DT_INCLUSAO,
            regexp_replace(CPFCNPJ, '[^a-zA-Z0-9]', '') AS CPFCNPJ_CLIENTE,
            CAST(DATA_NASCIMENTO AS DATE) AS DT_NASCIMENTO_CLIENTE,
            ENDERECO AS ENDERECO_CLIENTE,
            regexp_replace(CEP, '[^a-zA-Z0-9]', '') AS CEP_CLIENTE
        FROM fonte_clientes

    )

SELECT *
FROM renomear