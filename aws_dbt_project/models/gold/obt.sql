{% set tables = [
    {
        'table': ref('bronze_Boooking'),
        'columns': '*',
        'alias': 'bronze_Boooking'
    },
    {
        'table': ref('bronze_listinings'),
        'columns': '*',
        'alias': 'bronze_listinings',
        'join_condition': 'bronze_Boooking.LISTING_ID = bronze_listinings.LISTING_ID'
    },
    {
        'table': ref('bronze_host'),
        'columns': '*',
        'alias': 'bronze_host',
        'join_condition': 'bronze_Boooking.HOST_ID = bronze_host.HOST_ID'
    }
] %}

SELECT
    bronze_Boooking.*,
    bronze_listinings.LISTING_ID,
    bronze_listinings.COUNTRY,
    bronze_listinings.ACCOMMODATES,
    bronze_listinings.BEDROOMS,
    bronze_listinings.BATHROOMS,
    bronze_listinings.PRICE_PER_NIGHT,
    silver_listening.TOTAL_CAPACITY_PRICE,
    silver_listening.MONTHLY_PRICE,
    bronze_host.HOST_ID,
    bronze_host.HOST_NAME,
    silver_host.HOST_NAME_CLEAN,
    bronze_host.IS_SUPERHOST,
    bronze_host.RESPONSE_RATE
FROM {{ tables[0].table }} AS bronze_Boooking
JOIN {{ tables[1].table }} AS bronze_listinings
    ON {{ tables[1].join_condition }}
JOIN {{ tables[2].table }} AS bronze_host
    ON {{ tables[2].join_condition }}