{% set cols = ['NIGHTS_BOOKED', 'BOOKING_ID', 'BOOKING_AMOUNT'] %}

SELECT {% for col in cols %}
    {{col}},
{% endfor %}

FROM {{ ref('bronze_Boooking') }}