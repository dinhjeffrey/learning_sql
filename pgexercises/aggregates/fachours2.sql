-- Output the facility id that has the highest number of slots booked. For bonus points, try a version without a LIMIT clause. This version will probably look messy!
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	gorup by facid
order by sum(slots) desc
limit 1;

-- CTE Common Table Expressions. CTEs can be thought of as allowing you to define a database view inline in your query. It's really helpful in situations like this, where you're having to repeat yourself a lot.

with sum as (select facid, sum(slots) totalslots
	from cd.bookings
	group by facid
)
select facid, totalslots "Total Slots"
	from sum
	where totalslots = (select max(totalslots) from sum);