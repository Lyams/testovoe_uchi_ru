--seeds DB for excerces 6.
DROP TABLE IF EXISTS students;
DROP TABLE IF exists parents;

CREATE TABLE parents (
id int NOT NULL PRIMARY KEY,
name varchar NOT NULL,
created_at TIMESTAMP );

CREATE TABLE students (
id int NOT NULL ,
name varchar NOT NULL,
created_at TIMESTAMP ,
parent_id int

--,FOREIGN KEY (parent_id)  REFERENCES parents(id)
);

INSERT INTO parents (id, name,created_at)
VALUES ('1', 'Ura', '2020-04-26 02:04:24' ), 
('2', 'Марина', '2019-04-26 02:04:24' );

INSERT INTO students(id, name, created_at, parent_id )
VALUES ('1', 'Иван', '2020-04-26 02:04:24', '1'),
('2', 'Masha', '2019-03-16 10:14:00', '2'),
('3', 'Anatolii', '2015-01-01 10:14:00', '2')
,('4', 'Ефим', '2021-01-01 10:14:00', NULL)
;


