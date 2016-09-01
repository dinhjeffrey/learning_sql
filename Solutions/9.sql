SELECT count(*) FROM Invoice 
WHERE InvoiceDate LIKE '%2009%'
OR InvoiceDate LIKE '%2011%'
-- 166 invoices total in 2009 and 2011

SELECT SUM(total) FROM Invoice 
WHERE InvoiceDate LIKE '%2009%'
-- 449.46 sales total in 2009

SELECT SUM(total) FROM Invoice 
WHERE InvoiceDate LIKE '%2011%'
-- 469.58 sales total in 2011