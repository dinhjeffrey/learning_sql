-- How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name.

select distinct mem.firstname || ' ' || mem.surname as member, fac.name as facility
from cd.members mem
inner join cd.bookings book
on mem.memid = book.memid
inner join cd.facilities fac
on fac.facid = book.facid
where fac.facid in (0,1)
order by member