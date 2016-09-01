SELECT Invoice.*, InvoiceLine.InvoiceLineId FROM Invoice
INNER JOIN InvoiceLine
ON Invoice.InvoiceId = InvoiceLine.InvoiceId