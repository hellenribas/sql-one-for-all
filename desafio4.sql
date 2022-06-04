SELECT usuario AS usuario, IF(
	MAX(YEAR(data)) = '2021', 'Usuário ativo', 'Usuário inativo'
) AS condicao_usuario FROM SpotifyClone.usuario AS usuario
INNER JOIN SpotifyClone.historico AS historico
ON historico.usuario_id = usuario.usuario_id
GROUP BY usuario
ORDER BY usuario.usuario;