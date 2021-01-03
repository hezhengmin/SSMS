create database School 

use School

create table students(
	id int not null,
	name text not null,
	birth date not null
	primary key (id)
)

create table teachers(
	id int not null primary key,
	name text not null, 
)

create table subjects(
	id int not null primary key,
	name text not null, 
)

create table grades(
	studentId int not null references students(id),
	teacherId int not null references teachers(id),
	subjectId int not null references subjects(id),
	grade varchar(3)
	primary key (studentId,teacherId,subjectId)
)

insert into students (id , name , birth) values (1,'Simon','1996-09-18')
insert into students (id , name , birth) values (2,'Alvin','1998-03-13')
insert into students (id , name , birth) values (3,'Theo','1992-06-21')
insert into students (id , name , birth) values (4,'Brittany','1993-11-07')
insert into students (id , name , birth) values (5,'Jenette','1994-12-05')
insert into students (id , name , birth) values (6,'Elenor','1995-10-18')
insert into students (id , name , birth) values (7,'Stu','1991-06-05')

insert into teachers (id, name) values (1, 'Washington');
insert into teachers (id, name) values (2, 'Adams');
insert into teachers (id, name) values (3, 'Jefferson');
insert into teachers (id, name) values (4, 'Lincoln');

insert into subjects (id, name) values (1, 'History');
insert into subjects (id, name) values (2, 'Biology');
insert into subjects (id, name) values (3, 'SF');

insert into grades (studentId, teacherId, subjectId, grade) values (1, 2, 1, 'A');
insert into grades (studentId, teacherId, subjectId, grade) values (1, 2, 2, 'B');
insert into grades (studentId, teacherId, subjectId, grade) values (7, 4, 3, 'C+');
insert into grades (studentId, teacherId, subjectId, grade) values (7, 3, 2, 'F');
insert into grades (studentId, teacherId, subjectId, grade) values (6, 2, 1, 'B+');
insert into grades (studentId, teacherId, subjectId, grade) values (2, 4, 3, 'C');
insert into grades (studentId, teacherId, subjectId, grade) values (3, 4, 3, 'B');