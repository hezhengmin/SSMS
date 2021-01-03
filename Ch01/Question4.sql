-- Namaes of teachers who have not yet taught:

-- Answer1
select name
from teachers
where id not in (
	select teacherId from grades
) 

-- Answer2
select name 
from grades
right join teachers 
on grades.teacherId = teachers.id
where grades.teacherId is null

