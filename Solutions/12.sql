SELECT InvoiceLine.*, Track.Name
FROM Track
INNER JOIN InvoiceLine
ON InvoiceLine.TrackId = Track.TrackId