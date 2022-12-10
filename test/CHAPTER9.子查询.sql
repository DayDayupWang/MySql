SELECT salary
FROM employees
WHERE last_name = 'Abel';

SELECT last_name,salary
FROM employees
WHERE salary > (
								SELECT salary
								FROM employees
								WHERE last_name = 'Abel');

SELECT employee_id,last_name,CASE department_id WHEN (SELECT department_id 
FROM departments WHERE location_id = 1800) 
THEN 'CANADA'ELSE 'USA' END'location'
FROM employees;

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE job_id<>'IT_PROG'
AND salary< ALL(SELECT salary
FROM employees
WHERE job_id='IT_PROG'
);


#找到平均工资最小的部门ID
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary)=(SELECT MIN(avg_sal)
FROM(SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id) avgSalary);


SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary)<=ALL(
SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id
)
#查询所有的管理者
SELECT last_name,employee_id
FROM employees
WHERE employee_id NOT IN(#NOT IN 不等于其中任意一个
				SELECT manager_id #查员工表中的manager_id
				FROM employees
				where manager_id is not null #//去掉注释可以把子查询中的NULL值manager_id去除
);
#题目：查询员工的id,salary,按照department_name 排序
SELECT e.employee_id,e.salary
FROM employees e
ORDER BY (
SELECT department_name
FROM departments d
WHERE e.department_id=d.department_id
);

#题目：若employees表中employee_id与job_history表中employee_id相同的数目不小于2，
#输出这些相同id的员工的employee_id，last_name和其job_id 
#相当于调岗
SELECT employee_id,last_name,job_id
FROM employees e
WHERE 2<=(
SELECT COUNT(*)
FROM job_history j
WHERE j.employee_id=e.employee_id
);

#题目：查询公司管理者的employee_id,last_name,job_id,department_id信息
#方式1：自连接
SELECT mgr.employee_id,mgr.last_name,mgr.job_id,mgr.department_id
FROM employees e JOIN employees mgr
ON e.manager_id=mgr.employee_id;
#方式2：子查询
SELECT employee_id,last_name,job_id,department_id
FROM employees
WHERE employee_id IN(
SELECT DISTINCT manager_id
FROM employees 
);
#方式3：EXISTS
SELECT employee_id,last_name,job_id,department_id
FROM employees e1
WHERE EXISTS(
SELECT *
FROM employees e2
WHERE e1.employee_id=e2.manager_id
);

#题目：查询departments表中，不存在于employees表中的部门的department_id和department_name
#方式1：
SELECT d.department_id,d.department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id=d.department_id
WHERE e.department_id IS NULL; #右中图形式
#方式2：
SELECT department_id,department_name
FROM departments d
WHERE EXISTS (
SELECT *
FROM employees e
WHERE d.department_id=e.department_id
);

SELECT COUNT(*)
FROM departments;


