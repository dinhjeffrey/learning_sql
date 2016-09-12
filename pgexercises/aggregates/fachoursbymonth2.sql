-- Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.

select facid,
extract(month from starttime) "month",
sum(slots) "Total Slots"
from cd.bookings
where starttime >= '2012-01-01'
and starttime < '2013-01-01'
group by facid, extract(month from starttime)
order by facid, extract(month from starttime);

select facid,
extract(month from starttime) "month",
sum(slots) "Total Slots"
from cd.bookings
where starttime >= '2012-01-01'
and starttime < '2013-01-01'
group by facid, month
order by facid, month;