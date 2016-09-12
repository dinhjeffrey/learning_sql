-- Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.

select fac.facid, SUM(book.slots) "Total Slots"
from cd.facilities fac
inner join cd.bookings book
on fac.facid = book.facid
group by fac.facid
order by fac.facid;

select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
order by facid;