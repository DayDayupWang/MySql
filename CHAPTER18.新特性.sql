#1. 创建students数据表，如下
CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT,
student VARCHAR(15),
points TINYINT
);
#2. 向表中添加数据如下
INSERT INTO students(student,points)
VALUES
('张三',89),
('李四',77),
('王五',88),
('赵六',90),
('孙七',90),
('周八',88);
#3. 分别使用RANK()、DENSE_RANK() 和 ROW_NUMBER()函数对学生成绩降序排列情况进行显示


SELECT RANK() OVER w AS RANKgrates,
DENSE_RANK()OVER w AS DENSE_RANKgrates,
ROW_NUMBER()OVER w AS ROW_NUMBERgrates,
student,points
FROM students WINDOW  w AS (ORDER BY points DESC);

