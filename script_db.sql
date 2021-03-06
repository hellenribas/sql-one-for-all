DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano(
	plano_id INT AUTO_INCREMENT NOT NULL,
    plano VARCHAR(20) NOT NULL,
    valor_plano DOUBLE NOT NULL,
    CONSTRAINT PRIMARY KEY(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
	artista_id INT AUTO_INCREMENT NOT NULL,
    artista VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
	album_id INT AUTO_INCREMENT NOT NULL,
    album VARCHAR(200) NOT NULL,
    ano_lancamento VARCHAR(4) NOT NULL,
    CONSTRAINT PRIMARY KEY(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
	usuario_id INT AUTO_INCREMENT NOT NULL,
    usuario VARCHAR(10) NOT NULL,
    idade INT NOT NULL,
    plano_id INT DEFAULT NULL,
    data_assinatura DATE NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id),
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancao(
	cancao_id INT AUTO_INCREMENT NOT NULL,
    cancao VARCHAR(200) NOT NULL,
    album_id INT NOT NULL,
    duracao INT NOT NULL,
    CONSTRAINT PRIMARY KEY(cancao_id),
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista_favorito(
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
	historico_id INT NOT NULL AUTO_INCREMENT,
	cancao_id INT NOT NULL,
    usuario_id INT NOT NULL,
    data DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(historico_id),
	FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
	FOREIGN KEY (cancao_id) REFERENCES cancao (cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (plano, valor_plano)
VALUES 
('gratuito', '0.00'),
('universitario', '5.99'),
('pessoal', '6.99'),
('familiar', '7.99');

INSERT INTO SpotifyClone.artista (artista)
VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

INSERT INTO SpotifyClone.album (album, ano_lancamento)
VALUES 
('Envious', '1990'),
('Exuberant','1993'),
('Hallowed Steam', '1995'),
('Incandescent', '1998'),
('Temporary Culture', '2001'),
('Library of liberty', '2003'),
('Chained Down', '2007'),
('Cabinet of fools', '2012'),
('No guarantees', '2015'),
('Apparatus', '2015');

INSERT INTO SpotifyClone.usuario (usuario, idade, plano_id, data_assinatura)
VALUES 
('Thati', 23, 1, '2019-10-20'),
('Cintia', 35, 4,'2017-12-30'),
('Bill', 20, 2,'2019-06-05'),
('Roger', 45, 3, '2020-05-13'),
('Norman', 58, 3,'2017-02-17'),
('Patrick', 33, 4, '2017-01-06'),
('Vivian', 26, 2, '2018-01-05'),
('Carol', 19, 2, '2018-02-14'),
('Angelina', 42, 4, '2018-04-29'),
('Paul', 46, 4, '2017-01-17');

INSERT INTO SpotifyClone.cancao (cancao, album_id, duracao)
VALUES 
('Soul For Us', 1, 200),
('Reflections Of Magic', 1,163),
('Dance With Her Own', 1, 116),
('Troubles Of My Inner Fire', 2, 203),
('Time Fireworks', 2, 152),
('Magic Circus', 3, 105),
('Honey, So Do I', 3, 207),
("Sweetie, Let's Go Wild", 3, 139),
('She Knows', 3, 244),
('Fantasy For Me', 4, 100),
('Celebration Of More', 4, 146),
('Rock His Everything', 4, 223),
('Home Forever', 4, 231),
('Diamond Power', 4, 241),
("Let's Be Silly", 4, 132),
('Thang Of Thunder', 5, 240),
('Words Of Her Life', 5, 185),
('Without My Streets', 5, 176),
('Need Of The Evening', 6, 190),
('History Of My Roses', 6, 222),
('Without My Love', 6, 111),
('Walking And Game', 6, 123),
('Young And Father', 6, 197),
('Finding My Traditions', 7, 179),
('Walking And Man', 7, 229),
('Hard And Time', 7, 135),
("Honey, I'm A Lone Wolf", 7, 150),
("She Thinks I Won't Stay Tonight", 8, 166),
("He Heard You're Bad For Me", 8, 154),
("He Hopes We Can't Stay", 8, 210),
('I Know I Know', 8, 117),
("He's Walking Away", 9, 159),
("He's Trouble", 9, 138),
('I Heard I Want To Bo Alone', 9,120),
('I Ride Alone', 9, 151),
('Honey', 10, 79),
('You Cheated On Me', 10, 95),
("Wouldn't It Be Nice", 10, 213),
('Baby', 10, 136),
('You Make Me Feel So..', 10, 83);

INSERT INTO SpotifyClone.historico (cancao_id, usuario_id, data)
VALUES 
(1, 1, '2020-02-28 10:45:55'),
(2, 1, '2020-05-02 05:30:35'),
(3, 1, '2020-03-06 11:22:33'),
(4, 1, '2020-08-05 08:05:17'),
(5, 1, '2020-09-14 16:32:22'),
(6, 2, '2020-01-02 07:40:33'),
(7, 2, '2020-05-16 06:16:22'),
(8, 2, '2020-10-09 12:27:48'),
(9, 2, '2020-09-21 13:14:46'),
(10, 3, '2020-11-13 16:55:13'),
(11, 3, '2020-12-05 18:38:30'),
(12, 3, '2020-07-30 10:00:00'),
(13, 4, '2021-08-15 17:10:10'),
(14, 4, '2021-07-10 15:20:30'),
(15, 4, '2021-01-09 01:44:33'),
(16, 5, '2020-07-03 19:33:28'),
(17, 5, '2017-02-24 21:14:22'),
(18, 5, '2020-08-06 15:23:43'),
(19, 5, '2020-11-10 13:52:27'),
(20, 6, '2019-02-07 20:33:48'),
(21, 6, '2017-01-24 00:31:17'),
(22, 6, '2017-10-12 12:35:20'),
(23, 6, '2018-05-29 14:56:41'),
(24, 7, '2018-05-09 22:30:49'),
(25, 7, '2020-07-27 12:52:58'),
(26, 7, '2018-01-16 18:40:43'),
(27, 8, '2018-03-21 16:56:40'),
(28, 8, '2020-10-18 13:38:05'),
(29, 8, '2019-05-25 08:14:03'),
(30, 8, '2021-08-15 21:37:09'),
(31, 9, '2021-05-24 17:23:45'),
(32, 9, '2018-12-07 22:48:52'),
(33, 9, '2021-03-14 06:14:26'),
(34, 9, '2020-04-01 03:36:00'),
(35, 10, '2017-02-06 08:21:34'),
(36, 10, '2017-12-04 05:33:43'),
(37, 10, '2017-07-27 05:24:49'),
(38, 10, '2017-12-25 01:03:57');



