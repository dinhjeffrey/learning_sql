-- How can you produce a list of the start times for bookings by members named 'David Farrell'?

SELECT bookings.starttime
FROM cd.bookings
JOIN cd.members
ON bookings.memid = members.memid
WHERE members.firstname = 'David' AND members.surname = 'Farrell';

select bks.starttime
	from
		cd.bookings bks
		inner join cd.members mems
			on mems.memid = bks.memid
	where
		mems.firstname = 'David'
		and mems.surname = 'Farrell';