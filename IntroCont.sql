INSERT INTO Song (AlbumId, ArtistId, GenreId, Title, ReleaseDate, SongLength) VALUES (22, 2, 3, 'Girls', '11/01/2007', 635)

SELECT * FROM Song

SELECT * FROM Artist

SELECT * FROM Album

INSERT INTO Song (AlbumId, ArtistId, GenreId, Title, ReleaseDate, SongLength) VALUES (2, 28, 3, 'Girls', '11/01/2007', 635)
INSERT INTO Song (AlbumId, ArtistId, GenreId, Title, ReleaseDate, SongLength) VALUES (2, 28, 3, 'Red Eye', '11/01/2007', 234)
INSERT INTO Song (AlbumId, ArtistId, GenreId, Title, ReleaseDate, SongLength) VALUES (2, 28, 3, 'By Design', '11/01/2007', 173)

SELECT * FROM Song

DELETE FROM Song WHERE Id = 24

SELECT a.Title, s.Title FROM Album a
LEFT JOIN Song s ON s.AlbumId = a.Id


SELECT s.Title, al.Title, ar.ArtistName FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.Id
LEFT JOIN Artist ar ON s.ArtistId = ar.Id
WHERE s.AlbumId = 2

-- Number of songs per album
SELECT al.Title, COUNT(*) AS Songs
FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.Id
GROUP BY al.Title

-- Number of songs per artist
SELECT ar.ArtistName, COUNT(*) AS Songs
FROM Song s
LEFT JOIN Artist ar ON s.ArtistId = ar.Id
GROUP BY ar.ArtistName

-- Number of songs per genre
SELECT g.[Label], COUNT(*) AS Songs
FROM Song s
LEFT JOIN Genre g ON s.GenreId = g.Id
GROUP BY g.Label

-- Longest album duration
SELECT Title, AlbumLength AS Duration
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

-- Longest song duration
SELECT s.Title, s.SongLength AS Duration, al.Title AS Album
FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.Id
WHERE s.SongLength = (SELECT MAX(s.SongLength) FROM Song s)