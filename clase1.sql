CREATE DATABASE IF NOT EXISTS IMDB;
USE IDMB;

CREATE TABLE IF NOT EXISTS film (film_id BIGINT() NOT NULL AUTOINCREMENT,title VARCHAR(20) NOT NULL,descripcion VARCHAR(30) NOT NULL,release_year DATETIME() NOT NULL,CONSTRAINT film_pk PRIMARY KEY(film_id));
CREATE TABLE IF NOT EXISTS actor(actor_id INT(11) NOT NULL AUTOINCREMENT,first_name VARCHAR(20) NOT NULL,last_name VARCHAR(20),CONSTRAINT actor_pk PRIMARY KEY(actor_id));
CREATE TABLE IF NOT EXISTS film_actor(film_actor_id BIGINT() NULL AUTOINCREMENT,actor_id INT(11)NOT NULL,film_id INT(11)NOT NULL;

ALTER TABLE film ADD last_update DATE NOT NULL;
ALTER TABLE actor ADD last_update DATE NOT NULL;
ALTER TABLE film_actor ADD CONSTRAINT film_fk FOREIGN KEY(film_id) REFERENCES film (film_id);
ALTER TABLE film_actor ADD CONSTRAINT actor_fk FOREIGN KEY(actor_id) REFERENCES actor (actor_id);

INSERT INTO film (title, description, release_year, last_update) VALUES('Rapidos y furiosos', 'Reto tokio', 2003, CURDATE());
INSERT INTO film (title, description, release_year, last_update) VALUES('Reecursos Humanos', 'La vida de los adolecentes', 2022, CURDATE());

INSERT INTO actor (first_name, last_name, last_update) VALUES('Bin', 'Disel', CURDATE());
INSERT INTO actor (first_name, last_name, last_update) VALUES('Nick', 'Berch', CURDATE());

INSERT INTO film_actor (actor_id, film_id) VALUES(1, 1);
INSERT INTO film_actor (actor_id, film_id) VALUES(2, 2);