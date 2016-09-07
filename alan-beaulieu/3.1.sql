-- Retrieve the employee ID, first name, and last name for all bank employees. Sort by last name and then by first name.

select emp_id, fname, lname
from employee
order by lname, fname;

-- test