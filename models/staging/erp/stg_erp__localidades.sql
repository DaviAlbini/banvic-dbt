WITH 

    fonte_localidades AS (

        SELECT *
        FROM {{ source('erp', 'localidades') }}

    )

    , renomear AS (

        SELECT 
            COD_LOCALIDADE AS PK_LOCALIDADE,
            CAST(CIDADE AS STRING) AS CIDADE,
            CAST(UF AS STRING) AS UF
        FROM fonte_localidades

    )

SELECT *
FROM renomear