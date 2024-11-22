use bai_tap_ss4;
create table Class(
Class_Id int not null auto_increment primary key,
Class_Name varchar(60) not null,
Start_Date datetime not null,
Status BIT
);

create table Student(
Student_Id int not null auto_increment primary key,
Student_Name varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status BIT,
Class_Id int not null,
foreign key(Class_Id) references Class (Class_ID)
);

create table Subject(
Sub_Id int not null auto_increment primary key,
Sub_Name varchar(30) not null,
Credit TINYINT not null default 1 check (Credit >=1),
Status BIT default 1
);

create table Mark(
Mark_Id int not null auto_increment primary key,
Sub_Id int not null,
Student_Id int not null,
Mark FLOAT default 0 check (Mark between 0 and 100),
Exam_Times TINYINT default 1,
UNIQUE (Sub_Id, Student_Id),
foreign key (Sub_Id) references Subject (Sub_Id),
foreign key (Student_Id) references Student (Student_Id)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (Student_Name, Address, Phone, Status, Class_Id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);

INSERT INTO Student (Student_Name, Address, Status, Class_Id)
VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO Student (Student_Name, Address, Phone, Status, Class_Id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES 
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);
 
 INSERT INTO Mark (Sub_Id, Student_Id, Mark, Exam_Times)
VALUES 
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);
select *
from Subject
where Credit = (select max(Credit) from Subject);

select s.Sub_Name, m.Mark
from Subject s
join Mark m on s.Sub_Id = m.Sub_Id
where m.Mark = (select MAX(Mark) from Mark);

select st.Student_Id,st.Student_Name, avg(m.Mark) as Average_Mark
from Student st
join Mark m on st.Student_Id = m.Student_Id
group by st.Student_Id
order by Average_Mark desc;
