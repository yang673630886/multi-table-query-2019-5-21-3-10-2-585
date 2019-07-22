/* Formatted on 2019/7/5 16:22:43 (QP5 v5.252.13127.32847) */
 --1.查询同时存在1课程和2课程的情况

SELECT *
  FROM student a, student_course b
 WHERE a.id = B.STUDENTID AND B.COURSEID IN ('1', '2');

--2.查询同时存在1课程和2课程的情况

SELECT *
  FROM student a, student_course b
 WHERE a.id = B.STUDENTID AND B.COURSEID IN ('1', '2');

-- 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

  SELECT a.id, a.name, CAST (AVG (b.score) AS DECIMAL (18, 2)) avg_score
    FROM student a, student_course b
   WHERE A.ID = B.STUDENTID
GROUP BY A.ID, A.NAME
  HAVING CAST (AVG (b.score) AS DECIMAL (18, 2)) >= 60
ORDER BY A.ID;

--4.查询在student_course表中不存在成绩的学生信息的SQL语句

SELECT *
  FROM student a LEFT JOIN student_course b ON A.ID = B.STUDENTID
 WHERE B.STUDENTID IS NULL;

--5.查询所有有成绩的SQL

SELECT *
  FROM student a, student_course b
 WHERE A.ID = B.STUDENTID;

--6.查询学过编号为1并且也学过编号为2的课程的同学的信息

SELECT a.*
  FROM student a,
       student_course b
       INNER JOIN student_course c ON B.STUDENTID = C.STUDENTID
 WHERE A.ID = B.STUDENTID AND b.COURSEID = '1' AND c.COURSEID = '2';

-- 7.检索1课程分数小于60，按分数降序排列的学生信息

  SELECT *
    FROM student a, student_course b
   WHERE A.ID = B.STUDENTID AND (B.COURSEID = '1' AND B.SCORE <= 60)
ORDER BY B.SCORE;

-- 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

  SELECT A.NAME, A.ID, AVG (SCORE) AS pingjun
    FROM course a, student_course b
   WHERE A.ID = B.COURSEID
GROUP BY a.id, A.NAME
ORDER BY pingjun;

-- 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数

SELECT a.name, B.SCORE
  FROM student a, student_course b
 WHERE A.ID = B.STUDENTID AND B.COURSEID = '2' AND B.SCORE < 60;
