{{ config(materialized='table', schema='gold') }}

{% set tables = [
    {
        'table': ref('silver_booking'),
        'alias': 'silver_booking',
        'join': none
    },
    {
        'table': ref('silver_listening'),
        'alias': 'silver_listening',
        'join': 'silver_booking.LISTING_ID = silver_listening.LISTING_ID',
        'join_type': 'LEFT'
    },
    {
        'table': ref('silver_host'),
        'alias': 'silver_host',
        'join': 'silver_listening.HOST_ID = silver_host.HOST_ID',
        'join_type': 'LEFT'
    }
] %}

SELECT
    silver_booking.*,
    silver_listening.HOST_ID,
    silver_listening.COUNTRY,
    silver_listening.ACCOMMODATES,
    silver_listening.BEDROOMS,
    silver_listening.BATHROOMS,
    silver_listening.PRICE_PER_NIGHT,
    silver_listening.TOTAL_CAPACITY_PRICE,
    silver_listening.MONTHLY_PRICE,
    silver_host.HOST_NAME,
    silver_host.HOST_NAME_CLEAN,
    silver_host.IS_SUPERHOST,
    silver_host.RESPONSE_RATE,
    silver_host.CREATED_AT AS HOST_CREATED_AT
FROM
{% for t in tables %}
    {% if loop.first %}
        {{ t.table }} AS {{ t.alias }}
    {% else %}
        {{ t.join_type }} JOIN {{ t.table }} AS {{ t.alias }}
        ON {{ t.join }}
    {% endif %}
{% endfor %}