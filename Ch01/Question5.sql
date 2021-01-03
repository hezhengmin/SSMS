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
--�t���d�� EXCEPT 
--id �s�b students ��ƪ�A�����s�b grades ��ƪ� studentId ���
select name from students
where id in (
select id from students
except
select studentId from grades)





