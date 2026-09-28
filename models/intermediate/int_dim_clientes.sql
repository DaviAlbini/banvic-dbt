WITH
    clientes AS (

        SELECT *
        FROM {{ ref('stg_erp__clientes') }}

    ),
    
    localidades AS (

        SELECT *
        FROM {{ ref('stg_erp__localidades') }}

    ),

    clientes_enriquecido AS (

        SELECT 
            c.PK_CLIENTE,
            c.NOME_CLIENTE,
            c.EMAIL_CLIENTE,
            c.TIPO_CLIENTE,
            c.DT_INCLUSAO,
            c.CPFCNPJ_CLIENTE,
            c.DT_NASCIMENTO_CLIENTE,
            c.ENDERECO_CLIENTE,
            c.CEP_CLIENTE,
            l.CIDADE AS CIDADE_CLIENTE,
            l.UF AS UF_CLIENTE
        FROM clientes c
        LEFT JOIN localidades l ON c.FK_LOCALIDADE = l.PK_LOCALIDADE

    )

    SELECT *
    FROM clientes_enriquecido