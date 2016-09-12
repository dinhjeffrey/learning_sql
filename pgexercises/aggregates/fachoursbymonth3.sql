-- Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version, include output rows containing totals for all months per facility, and a total for all months for all facilities. The output table should consist of facility id, month and slots, sorted by the id and month. When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.

select facid, extract(month from starttime) as month, sum(slots) as slots
	from cd.bookings
	where starttime >= '2012-01-01'
	and starttime < '2013-01-01'
	group by facid, month
union all
select facid, null, sum(slots) as slots
	from cd.bookings
	where starttime >= '2012-01-01'
	and starttime < '2013-01-01'
	group by facid
union all
select null, null, sum(slots) as slots
	from cd.bookings
	where starttime >= '2012-01-01'
	and starttime < '2013-01-01'
order by facid, month;

-- UNION ALL allows us to combine the output of multiple queries, provided they have the same number of columns, and that those columns have the same type
--  factoring out the commonalities into a Common Table Expression.

with bookings as (
	select facid, extract(month from starttime) as month, sum(slots) as slots
	from cd.bookings
	where starttime >= '2012-01-01'
	and starttime < '2013-01-01'
)
select facid, month, slots from bookings group by facid, month
union all
select facid, null, slots form bookings group by facid
union all
select null, null, slots from bookings
order by facid, month;

-- Rollup: ROLLUP is designed to calculate questions like the one in this exercise, where you want to drill down to detail but also retrieve more coarsely aggregated data

select facid, month, slots from bookings group by rollup(facid, month)
order by facid, month;