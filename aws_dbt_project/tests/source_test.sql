select  1 FROM {{source('staging', 'bookings')}}
where BOOKING_AMOUNT < 0