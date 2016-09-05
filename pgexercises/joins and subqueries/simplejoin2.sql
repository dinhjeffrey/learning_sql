-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.

select book.starttime as start, fac.name
from cd.bookings book
inner join cd.facilities fac
on book.facid = fac.facid
where book.starttime >= '2012-09-21'
and book.starttime < '2012-09-22'
and fac.name like '%Tennis Court%'
order by book.starttime

select bks.starttime as start, facs.name as name
	from 
		cd.facilities facs
		inner join cd.bookings bks
			on facs.facid = bks.facid
	where
		facs.facid in (0,1) and
		bks.starttime >= '2012-09-21' and
		bks.starttime < '2012-09-22'
order by bks.starttime;