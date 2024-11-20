create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table classes(
id int primary key auto_increment,
name_class varchar(10)
);
create table teachers (
id int primary key auto_increment,
name_teacher varchar (50) not null,
age int not null,
country varchar(100)
);