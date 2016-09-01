SELECT Playlist.Name, count(*)
FROM Playlist INNER JOIN PlaylistTrack
ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
GROUP BY Playlist.Name