-- Produce a count of the number of recommendations each member has made. Order by member ID.

select mem.recommendedby, count(mems.memid)
from cd.members mem
inner join cd.members mems 
on mem.recommendedby = mems.memid
group by mem.recommendedby, mems.memid
order by mems.memid;

select recommendedby, count(*)
	from cd.members
	where recommendedby is not null
	group by recommendedby
order by recommendedby;
