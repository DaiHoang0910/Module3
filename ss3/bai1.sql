use quanly_sinh_vien;
select * 
from Student
where StudentName like 'h%';

select * 
from Class
where month(StartDate) = 12;

select * 
from Subject
where Credit between 3 and 5;

update Student
set ClassId = 2
where StudentName = 'Hung';

select s.StudentName, sub.SubName, m.Mark
from Mark m
join Student s on m.StudentId = s.StudentId
join Subject sub on m.SubId = sub.SubId
order by m.Mark desc, s.StudentName asc;
