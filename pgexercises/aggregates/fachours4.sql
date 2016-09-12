-- Output the facility id that has the highest number of slots booked. Ensure that in the event of a tie, all tieing results get output.

select facid, max(num_slots) total from (
 select fac.facid, sum(book.slots) num_slots from
  cd.facilities fac
  inner join cd.bookings book
  on fac.facid = book.facid
  group by fac.facid
) as foo
group by foo.facid
order by total desc
limit 1;

-- The inner query calculates the total slots booked, the middle one ranks them, and the outer one creams off the top ranked. We can actually tidy this up a little: recall that window function get applied pretty late in the select function, after aggregation. That being the case, we can move the aggregation into the ORDER BY part of the function, as shown in the approved answer.

select facid, total from (
	select facid, sum(slots) total, rank() over(order by sum(slots) desc) rank
		from cd.bookings
		group by facid
) as ranked
where rank = 1;