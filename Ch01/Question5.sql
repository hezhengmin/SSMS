-- Names of students who have not yet taken any classes:

-- Answer1
select name
from students 
where id not in 
  (select studentID
   from grades);

-- Answer2
select name from grades
right join students on grades.studentId = students.id
where grades.studentId is null

-- Answer3
--差集查詢 EXCEPT 
--id 存在 students 資料表，但不存在 grades 資料表的 studentId 資料
select name from students
where id in (
select id from students
except
select studentId from grades)





