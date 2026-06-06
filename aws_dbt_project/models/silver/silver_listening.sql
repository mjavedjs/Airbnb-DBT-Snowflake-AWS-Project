{{ config(
    materialized='incremental',
    unique_key='LISTING_ID'
) }}

SELECT 
    LISTING_ID,
    HOST_ID,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{ multiply('PRICE_PER_NIGHT', 'ACCOMMODATES', 2) }} AS TOTAL_CAPACITY_PRICE,
    {{ multiply('PRICE_PER_NIGHT', 30, 2) }} AS MONTHLY_PRICE,
    CREATED_AT
FROM {{ ref('bronze_listinings') }}

{% if is_incremental() %}
    WHERE CREATED_AT > (
        SELECT COALESCE(MAX(CREATED_AT), '1900-01-01')
        FROM {{ this }}
    )
{% endif %} 