CREATE TABLE emps
AS
SELECT * FROM atguigudb.employees;
#1. 创建视图emp_v1,要求查询电话号码以‘011’开头的员工姓名和工资、邮箱
CREATE VIEW emp_v1
AS 
SELECT last_name,salary,email
FROM employees
WHERE phone_number  REGEXP '^011';
#2. 要求将视图 emp_v1 修改为查询电话号码以‘011’开头的并且邮箱中包含 e 字符的员工姓名和邮箱、电话号码
CREATE OR REPLACE VIEW emp_v1
AS 
SELECT last_name,salary,email
FROM employees
WHERE phone_number REGEXP '^011' AND email LIKE '%e%';
#3. 向 emp_v1 插入一条记录，是否可以？
DESC emp_v1;

#4. 修改emp_v1中员工的工资，每人涨薪1000
UPDATE emp_v1
SET salary=salary+1000;
#5. 删除emp_v1中姓名为Olsen的员工
DELETE FROM emp_v1
WHERE last_name='Olsen';
#6. 创建视图emp_v2，要求查询部门的最高工资高于 12000 的部门id和其最高工资
CREATE VIEW emp_v2
AS
SELECT department_id,MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary)>12000;
#7. 向 emp_v2 中插入一条记录，是否可以？
#8. 删除刚才的emp_v2 和 emp_v1
DROP VIEW IF EXISTS emp_v1,emp_v2;