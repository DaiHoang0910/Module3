use quanly_sinh_vien;
select *
from Subject
where Credit = (select max(Credit) from Subject);

select s.SubName, m.Mark
from Subject s
join Mark m on s.SubId = m.SubId
where m.Mark = (select MAX(Mark) from Mark);

select st.StudentName, avg(m.Mark) as AverageMark
from Student st
join Mark m on st.StudentId = m.StudentId
group by st.StudentName
order by AverageMark desc;
