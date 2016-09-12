-- Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. The output table should consist of the facility id, name, and hours booked, sorted by facility id. Try formatting the hours to two decimal places.

select fac.facid, fac.name, round(sum(book.slots)/2.0, 2) as "Total Hours"
from cd.facilities fac
inner join cd.bookings book
on fac.facid = book.facid
group by fac.facid
order by fac.facid;

select facs.facid, facs.name,
	trim(to_char(sum(bks.slots)/2.0, '9999999999999D99')) as "Total Hours"
	from cd.bookings bks
	inner join cd.facilities facs
		on facs.facid = bks.facid
	group by facs.facid, facs.name
order by facs.facid;