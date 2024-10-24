CREATE TABLE students (
    student_id SERIAL,
    student_name VARCHAR(30),
    age INTEGER, 
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY(student_id)
)

CREATE TABLE courses(   
    course_id SERIAL, 
    course_name VARCHAR(30),
    credits INT,
    PRIMARY KEY (course_id)
)

CREATE TABLE enrollment(

    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
)

-- - - - - - - - 

SELECT  * FROM students;
SELECT  * FROM courses;
SELECT  * FROM enrollment;

 ----- - - - - - - - - - - - 
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);


INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);


INSERT INTO enrollment(enrollment_id, student_id, course_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);


--------- -  - -- - query ------ 
-- 1. 

INSERT INTO students
(student_name, age, email, frontend_mark, backend_mark)
 VALUES( 'tanzim', 24, 'samsul@gmail.com', 40, 40);
 
-- Explanation for query 1. 
-- => here i am inserting a document with the field student_name, age, email, frontend_mark, backend_mark. i am not inserting status as i have set it to default so that even though if i dont give any value it takes as null. this is only done for avoiding task manually.  
    -- Insert into " the table name i want to insert"
    -- Set the fields i want to insert. in this case (student_name, age, email, frontend_mark, backend_mark)
    -- not what values i want to insert. values( 'tanzim', 24, 'samsul@gmail.com', 40, 40);

-- 2. 

SELECT student_name FROM students INNER JOIN enrollment ON students.student_id = enrollment.student_id INNER JOIN courses ON courses.course_id = enrollment.course_id WHERE course_name = 'Next.js';

 -- explanation for query 2. 
  -- first we joined all the tabled together based on course_id and student_id. (inner join enrollment on students.student_id = enrollment.student_id inner join courses       on courses.course_id = enrollment.course_id)
  -- This is give us a table joined all tabled together. and enrolled information. 
  -- then wrote the query that for the course_name next.js .  where course_name = 'Next.js';
  


--3. 


UPDATE students SET status  = 'Awarded' WHERE student_id=(SELECT student_id FROM (SELECT (frontend_mark+backend_mark) AS total, student_id FROM students  GROUP BY student_id ORDER BY total DESC LIMIT 1))

-- explanation of 3 
-- this query first finds the value that has maximum mark. here i used group by so that i get the name of the student that has max mark. but this return all the value of the students. so i sorted it first with the total mark and then limit the result to 1. this will give me the student that has highest mark. select student_id from (select (frontend_mark+backend_mark) as total, student_id from students  group by student_id order by total DESC limit 1))

-- then i took the student-id and set the status to awarded. update students set status  = 'Awarded' where student_id = ""


-- 4 . 


DELETE FROM courses WHERE  course_id NOT IN (SELECT course_id  FROM students INNER JOIN enrollment USING(student_id) INNER JOIN courses USING(course_id) GROUP BY course_id);

-- explanation of 4
-- in this query i have to delete the courses that has zero enrollment. so i joined the three table together. that table gives us the value od the enrolled students. 
-- then the deletion part comes. the subquery part returns the id's of the coursee that are enrolled. later on just a simple delete operation on the id that are not included  in the subquery result. 

-- 5.  

SELECT student_name FROM students ORDER BY student_id ASC LIMIT 2 OFFSET 2;

--- explanation of 5. 
-- this query is selecting all the students name . 
-- limit 2  : it is responsible for 2 results. 
-- offset 2 : the result will start from the 3rd row. 

-- 6. 
SELECT count(*) AS students_enrolled, course_name FROM students INNER JOIN enrollment USING(student_id) INNER JOIN courses USING(course_id) GROUP BY course_name;

--  explanation of 6
--  students inner join enrollment using(student_id) inner join courses using(course_id) group by course_name : this is for joining all the tables. 
--  group by course_name: this is grouping all the courses. 
-- select count(*) as students_enrolled, course_name : this part is for showing the counted studetns along with the course name. 


-- 7. 
SELECT round(avg(age), 2) AS average_age FROM students;

-- this query finds the average age from the students table. 
-- round is aggragate function. 
-- round( value  , 2 ): this is taking the fraction value up to 2.

-- 8. 

SELECT student_name FROM students WHERE email LIKE '%example.com%' ORDER BY student_id;

-- explanation of 8: 
-- this query finds  the student name that has example.com in their email. 
-- like operator is ensuring that this find the emails that contains example.com.
--  order by student_id: this only done sothat the studetn names comes in order. 


