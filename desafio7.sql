SELECT 
    artista AS artista,
    album AS album,
    COUNT(favorito.artista_id) AS seguidores
FROM
    SpotifyClone.artista AS artista
        INNER JOIN
    SpotifyClone.album AS album ON album.artista_id = artista.artista_id
      INNER JOIN
    SpotifyClone.favorito AS favorito ON artista.artista_id = favorito.artista_id
    GROUP BY artista.artista, album.album
    ORDER BY seguidores DESC, artista ASC, album ASC;