SELECT Invoice.Total, Customer.Firstname, Customer.Lastname, Customer.Country, Employee.FirstName, Employee.LastName
FROM Employee 
INNER JOIN Invoice
INNER JOIN Customer