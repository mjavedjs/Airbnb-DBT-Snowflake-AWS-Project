{{ config(
    materialized='incremental',
    unique_key='BOOKING_ID'
) }}

{% set increment_column = 'CREATED_AT' %}

SELECT * FROM {{ source('staging', 'bookings') }}

{% if is_incremental() %}
    WHERE {{ increment_column }} > (
        SELECT COALESCE(MAX({{ increment_column }}), '1900-01-01')
        FROM {{ this }}
    )
{% endif %}