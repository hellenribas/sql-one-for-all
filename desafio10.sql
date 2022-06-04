SELECT cancao AS nome, COUNT(cancao) FROM SpotifyClone.plano AS plano
INNER JOIN SpotifyClone.usuario AS us
ON us.plano_id = plano.plano_id
INNER JOIN SpotifyClone.historico AS his
ON his.usuario_id = us.usuario_id
INNER JOIN SpotifyClone.cancao AS cancao
ON his.cancao_id = cancao.cancao_id
WHERE plano = 'gratuito' OR plano = 'pessoal'
GROUP BY cancao;
