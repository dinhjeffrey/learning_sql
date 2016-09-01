SELECT Employee.FirstName, Employee.LastName, Invoice.*
FROM Employee INNER JOIN Invoice
WHERE Employee.Title="Sales Support Agent"
-- connected by Customer.SupportRepId