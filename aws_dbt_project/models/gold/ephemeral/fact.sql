{{ config(materialized='table', schema='gold') }}

{% set fact_columns = [
    'BOOKING_ID',
    'LISTING_ID',
    'HOST_ID',
    'NIGHTS_BOOKED',
    'BOOKING_AMOUNT',
    'CLEANING_FEE',
    'SERVICE_FEE',
    'TOTAL_AMOUNT',
    'BOOKING_STATUS',
    'CREATED_AT'
] %}

SELECT
{% for col in fact_columns %}
    {{ col }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM {{ ref('obt') }}