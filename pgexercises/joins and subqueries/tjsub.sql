select member, facility, cost from (
  select mem.firstname || ' ' || mem.surname as member, fac.name as facility, 
  case 
   when mem.memid = 0 then
  	book.slots * fac.guestcost
   else 
  	book.slots * fac.membercost
  end as cost
  from cd.members mem
  inner join cd.bookings book
  	on mem.memid = book.memid
  inner join cd.facilities fac
  	on fac.facid = book.facid
  where book.starttime >= '2012-09-14' and
  	book.starttime < '2012-09-15'
  ) as bookings
  where cost > 30
order by cost desc;