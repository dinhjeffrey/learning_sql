-- Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and hours, sorted by facility id.

select facid, sum(slots) "Total Slots"
from cd.bookings
group by facid
having sum(slots) > 1000
order by facid;
