{{ config( 
    materialized='ephemeral'
)}}

WITH host AS (
    SELECT
        HOST_ID,
        HOST_NAME,
        IS_SUPERHOST,
        RESPONSE_RATE,
        HOST_CREATED_AT AS CREATED_AT
    FROM {{ ref('obt') }}
)

SELECT * FROM host