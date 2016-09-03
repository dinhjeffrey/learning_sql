SELECT Employee.FirstName, Employee.LastName, count(*)
FROM Employee
JOIN Customer
ON Customer.SupportRepId = Employee.EmployeeId
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId
WHERE Invoice.InvoiceDate LIKE '%2010%'
GROUP BY Employee.EmployeeId
ORDER BY count(*) desc
LIMIT 1