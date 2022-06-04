SELECT artista AS artista, album AS album 
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS album
ON a.artista_id = album.artista_id
WHERE artista = 'Walter Phoenix';