{% set night_booked = 3 %}

SELECT * FROM {{ ref('bronze_Boooking') }}
WHERE NIGHTS_BOOKED > {{ night_booked }}