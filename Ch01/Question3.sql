-- Names of teachers who taught Biology:

-- Answer1
select name from teachers
where id in (
	select teacherId from grades
	where subjectId = (
		select id from subjects
		where name = 'Biology'
		)
)

-- Answer2
select teachers.name
from  grades
join subjects on subjects.id = grades.subjectId
join teachers on teachers.id = grades.teacherId
where subjects.name = 'Biology'

-- Answer3
select teachers.name
from  grades , teachers , subjects 
where subjects.name = 'Biology'
and grades.teacherId = teachers.id
and grades.subjectId = subjects.id




