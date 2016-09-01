SELECT Employee.FirstName, Employee.LastName, count(*) FROM Employee
JOIN Customer
ON Customer.SupportRepId = Employee.EmployeeId
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId -- Why this?
GROUP BY Employee.EmployeeId