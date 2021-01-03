-- Names of students in any class taught by Adams:

-- Answer1
select name from students
where id in (
select studentId 
from grades 
where teacherId in
(select id from teachers
where name = 'Adams'))

-- Answer2
select name from students
where id in (
select studentId 
	from grades 
	where teacherId = 
		(select id from teachers
		 where name = 'Adams')
	group by studentId )

-- Answer3
SELECT distinct stu.name
FROM grades g
join students stu on stu.id = g.studentId
join teachers t on t.id = g.teacherId
join subjects sub on sub.id = g.subjectId
where t.name = 'Adams'
