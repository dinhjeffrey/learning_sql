-- Produce a list of member names, with each row containing the total member count. Order by join date.

with mem as (
	select firstname, surname, joindate from cd.members  
)

select count(*) over(), mem.firstname, mem.surname 
from mem
order by joindate;

-- Window functions operate on the result set of your (sub-)query, after the WHERE clause and all standard aggregation. They operate on a window of data. By default this is unrestricted: the entire result set, but it can be restricted to provide more useful results. For example, suppose instead of wanting the count of all members, we want the count of all members who joined in the same month as that member