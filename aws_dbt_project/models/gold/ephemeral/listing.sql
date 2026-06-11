{{ config( 
    materialized='ephemeral'
)}}

WITH listing AS (
    SELECT DISTINCT
        LISTING_ID,
        HOST_ID,
        COUNTRY,
        ACCOMMODATES,
        BEDROOMS,
        BATHROOMS,
        PRICE_PER_NIGHT,
        TOTAL_CAPACITY_PRICE,
        MONTHLY_PRICE
    FROM {{ ref('obt') }}
)

SELECT * FROM listing