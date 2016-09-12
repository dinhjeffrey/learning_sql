-- Produce a monotonically increasing numbered list of members, ordered by their date of joining. Remember that member IDs are not guaranteed to be sequential.

select count(*) over(order by joindate) as row_number,
firstname,
surname
from cd.members
order by joindate;

select row_number() over(order by joindate), firstname, surname
from cd.members
order by joindate;

-- In this query, we don't define a partition, meaning that the partition is the entire dataset. Since we define an order for the window function, for any given row the window is: start of the dataset -> current row.