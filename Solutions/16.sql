SELECT Track.Name, Genre.Name, MediaType.Name
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId