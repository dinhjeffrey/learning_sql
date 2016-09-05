-- How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

select mem.firstname as memfname, mem.surname as memsname, rec.firstname as recfname, rec.surname as recsname
from cd.members mem
left outer join cd.members rec
on rec.memid = mem.recommendedby 
order by mem.surname, mem.firstname