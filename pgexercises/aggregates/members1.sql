-- Find the total number of members who have made at least one booking.

select count(distinct memid)
from cd.bookings;