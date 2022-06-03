SELECT COUNT(DISTINCT cancao.cancao_id) AS cancoes, COUNT(DISTINCT artista.artista_id) AS artistas, COUNT(DISTINCT album.album_id) AS albuns
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album
ON artista.artista_id = album.artista_id
INNER JOIN SpotifyClone.cancao AS cancao
ON cancao.album_id = album.album_id;