-- Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

select fac.name,
sum(book.slots * case
	when book.memid = 0
		then fac.guestcost
	else
		fac.membercost
	end) as revenue
from cd.facilities fac
inner join cd.bookings book
	on fac.facid = book.facid
group by fac.name
having 
	sum(book.slots * case
	when book.memid = 0
		then fac.guestcost
	else
		fac.membercost
	end) < 1000
order by revenue;

select name, revenue from (
	select facs.name, sum(case
			when memid = 0 then slots * facs.guestcost
			else slots * membercost
		end) as revenue
	from cd.bookings bookings
	inner join cd.facilities facs
		on bks.facid = facs.facid
	group by facs.name
) as agg where revenue < 1000
order by revenue;