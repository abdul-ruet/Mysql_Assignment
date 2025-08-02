CREATE DATABASE student_management;

USE student_management;

CREATE TABLE students (
student_id int auto_increment primary key,
student_name char(100),
student_mail varchar(100),
phone double

 
);

create table courses(
course_id int auto_increment primary key,
course_name varchar(100),
credits varchar(100)

);

create table enrollments (
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
enroll_date date,
FOREIGN KEY (student_id) references students (student_id) on delete cascade,
foreign key (course_id) references courses(course_id) on delete cascade


);

INSERT INTO students (student_name, student_mail, phone) VALUES
('Alice Rahman', 'alice@example.com', '01710000001'),
('Babar Khan', 'babar@example.com', '01710000002'),
('Chaiti Das', 'chaiti@example.com', '01710000003'),
('Dipto Ahmed', 'dipto@example.com', '01710000004'),
('Elina Khatun', 'elina@example.com', '01710000005');

INSERT INTO courses (course_name, credits) VALUES
('Database Systems', 3),
('Introduction to Programming', 4),
('English Composition', 2);

INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES
(1, 1, '2025-08-01'),
(1, 2, '2025-08-01'),
(2, 1, '2025-08-01'),
(2, 3, '2025-08-01'),
(3, 2, '2025-08-01');


SELECT 
    students.student_id,
    students.student_name AS student_name,
    courses.course_name,
    enrollments.enroll_date
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;


SELECT 
    students.student_id,
    students.student_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
WHERE enrollments.enrollment_id IS NULL;

UPDATE students
SET phone = '01719998888'
WHERE students.student_id = 3;

DELETE FROM enrollments
WHERE enrollments.enrollment_id = 5;


