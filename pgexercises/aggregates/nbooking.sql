-- Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.

select mem.surname, mem.firstname, mem.memid, min(book.starttime)
from cd.members mem
inner join cd.bookings book
on mem.memid = book.memid
where starttime >= '2012-09-01'
group by mem.surname, mem.firstname, mem.memid
order by mem.memid;