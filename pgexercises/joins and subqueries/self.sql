-- How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

select distinct rec.firstname, rec.surname
from cd.members mem
inner join cd.members rec
on rec.memid = mem.recommendedby
order by surname, firstname