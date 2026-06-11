{{ config( 
    materialized='ephemeral'
)}}

WITH booking AS (
    SELECT
        BOOKING_ID,
        BOOKING_STATUS,
        CREATED_AT
    FROM {{ ref('obt') }}
)

SELECT * FROM booking