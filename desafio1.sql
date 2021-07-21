-- 1.Crear una base de datos con nombre “Posts”.
--2.Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contenido y descripción.

DROP DATABASE POSTS;

CREATE DATABASE POSTS;

\c posts;

CREATE TABLE posts (
    id INT,
    username VARCHAR(30),
    created_at DATE,
    contenido VARCHAR(80),
    descripcion VARCHAR,
    PRIMARY KEY(id)
);

-- (\d) -> revisar tabla posts - (\d) posts  para ver los atributos de la tabla posts.

-- 3.Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".

INSERT INTO posts(id, username, created_at, contenido, descripcion) VALUES (1,'Pamela','2021/07/19','Hola mundo','soy un post de Pamela');
INSERT INTO posts(id, username, created_at, contenido, descripcion) VALUES (2,'Pamela2','2021/07/19','Hola mundo2','soy un post de Pamela2');
INSERT INTO posts(id, username, created_at, contenido, descripcion) VALUES (3,'Carlos','2021/07/19','Hola mundo','soy un post de Carlos');

-- -> SELECT * FROM posts; selecciona todo desde post para mostrar la tabla con los registros.\

-- -> 4.Modificar la tabla post, agregando la columna título.
ALTER TABLE posts ADD titulo VARCHAR(150);

-- -> 5.Agregar título a las publicaciones ya ingresadas.
UPDATE posts SET titulo = 'Chef' WHERE id = 1;
UPDATE posts SET titulo = 'Desarrollador' WHERE id = 2;
UPDATE posts SET titulo = 'Fotografo' WHERE id = 3;
-- -> SELECT * FROM posts
-- -> 6.Insertar 2 post para el usuario "Pedro".
INSERT INTO posts(id, username, created_at, contenido, descripcion,titulo) VALUES (4,'Pedro','2021/07/19','Hola mundo','soy un post de Pedro','Doctor');
INSERT INTO posts(id, username, created_at, contenido, descripcion, titulo) VALUES (5,'Pedro2','2021/07/19','Hola mundo','soy un post de Pedro','Doctor');

-- 7.Eliminar el post de Carlos. like es para los string.
DELETE FROM posts WHERE username like 'Carlos'; 

-- Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO posts(id, username, created_at, contenido, descripcion, titulo) VALUES (6,'Carlos','2021/07/19','Hola mundo','soy un post de Carlos', 'Desarrollador');

-- 1.Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora decreación y contenido, que se relacione con la tabla posts

CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    created_at DATE,
    created_at_hour TIME,
    contenido VARCHAR(100),
    post_id INT,
    FOREIGN KEY(post_id) REFERENCES posts(id)
);

-- 2.Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/07/21', '13:00:00','Hola soy un comentario de Pamela',1);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/07/21', '13:01:30','Hola soy el segundo comentario de Pamela',1);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/07/21', '13:01:30','Hola soy el primer comentario de Carlos',6);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/08/21', '16:01:30','Hola soy el segundo comentario de Carlos',6);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/09/21', '14:01:30','Hola soy el segundo comentario de Carlos',6);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/10/21', '15:01:30','Hola soy el segundo comentario de Carlos',6);

-- 3.Crear un nuevo post para "Margarita".

INSERT INTO posts(id, username, created_at, contenido, descripcion, titulo) VALUES (7,'Margarita','2021/10/01','Hola mundo','soy un post de Margarita','Astronauta');

-- 4.Ingresar 5 comentarios para el post de Margarita._  
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/10/01', '15:01:30','Hola soy un comentario de Margarita',7);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/10/01', '15:02:30','Hola soy el segundo comentario de Margarita',7);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/10/01', '15:05:30','Hola soy el tercer comentario de Margarita',7);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/10/01', '15:07:30','Hola soy el cuarto comentario de Margarita',7);
INSERT INTO comentarios(created_at, created_at_hour, contenido, post_id) VALUES ('2021/10/01', '15:09:30','Hola soy el quinto comentario de Margarita',7);

-- SELECT * FROM comentarios;