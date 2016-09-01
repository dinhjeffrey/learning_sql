SELECT Track.Name, Track.Composer
FROM Track INNER JOIN InvoiceLine
ON InvoiceLine.TrackId = Track.TrackId