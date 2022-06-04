SELECT usuario, COUNT(DISTINCT historico.cancao_id) AS 'qtde_musicas_ouvidas', ROUND((SUM(cancao.duracao)/60), 2) AS 'total_minutos'
FROM SpotifyClone.cancao AS cancao
INNER JOIN SpotifyClone.historico AS historico
ON cancao.cancao_id = historico.cancao_id
INNER JOIN SpotifyClone.usuario AS usuario
ON usuario.usuario_id = historico.usuario_id
GROUP BY usuario
ORDER BY usuario.usuario;