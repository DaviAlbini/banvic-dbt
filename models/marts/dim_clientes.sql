WITH
    clientes AS (

        SELECT * 
        FROM {{ ref('int_dim_clientes') }}

    )

SELECT *
FROM clientes