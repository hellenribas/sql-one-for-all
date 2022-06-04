SELECT cancao AS cancao, COUNT(usuario_id) AS reproducoes FROM SpotifyClone.historico AS historico
INNER JOIN SpotifyClone.cancao AS cancao
ON historico.cancao_id = cancao.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;