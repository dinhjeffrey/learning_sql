-- Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

select fac.name, 
sum (case
	when book.memid = 0 then
	book.slots * fac.guestcost
	else
	book.slots * fac.membercost
end) as revenue
from cd.facilities fac
inner join cd.bookings book
on fac.facid = book.facid
group by fac.name
order by revenue;

select facs.name, sum(slots * case
	when memid = 0 then facs.guestcost
	else facs.membercost
end) as revenue
from cd.bookings bookingsinner join cd.facilities facs
	on bks.facid = facs.facid
group by facs.name
order by revenue;