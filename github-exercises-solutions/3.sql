SELECT Customer.Firstname, Customer.Lastname, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Customer INNER JOIN Invoice
WHERE Customer.Country="Brazil"