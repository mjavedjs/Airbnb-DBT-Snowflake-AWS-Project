{% set flag = 2 %}

SELECT * FROM {{ ref('bronze_Boooking') }}
{% if flag > 1 %}
    WHERE NIGHTS_BOOKED > {{ flag }}
{% else %}
    WHERE NIGHTS_BOOKED = 1
{% endif %}