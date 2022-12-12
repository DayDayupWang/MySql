CREATE DATABASE test04_emp;
use test04_emp;
CREATE TABLE emp2(
id INT,
emp_name VARCHAR(15)
);
CREATE TABLE dept2(
id INT,
dept_name VARCHAR(15)
);
#练习1
SELECT * FROM information_schema.table_constraints WHERE table_name = 'dept2'; 
#1.向表emp2的id列中添加PRIMARY KEY约束
ALTER TABLE emp2
ADD PRIMARY KEY (id)
#2. 向表dept2的id列中添加PRIMARY KEY约束
ALTER TABLE dept2
ADD PRIMARY KEY (id)

#3. 向表emp2中添加列dept_id，并在其中定义FOREIGN KEY约束，与之相关联的列是dept2表中的id列。
ALTER TABLE emp2
ADD COLUMN dept_id INT;
ALTER TABLE emp2 
ADD CONSTRAINT fk_dept2_emp2 FOREIGN KEY (dept_id) references dept2(id);

#练习2

# 1、创建数据库test01_library
USE test01_library;
SELECT *
FROM books;
SELECT * FROM information_schema.table_constraints WHERE table_name = 'books'; 
# 2、创建表 books，表结构如下：
# 3、使用ALTER语句给books按如下要求增加相应的约束
ALTER TABLE books
ADD PRIMARY KEY(id); 

ALTER TABLE books
MODIFY id INT(11) UNIQUE;
ALTER TABLE books MODIFY id INT AUTO_INCREMENT;
ALTER TABLE books MODIFY name VARCHAR(50) NOT NULL;

ALTER TABLE books MODIFY authors VARCHAR(100) NOT NULL;
ALTER TABLE books MODIFY price FLOAT NOT NULL;
ALTER TABLE books MODIFY pubdate YEAR NOT NULL;
ALTER TABLE books MODIFY num INT(11) NOT NULL;

#练习3
SELECT * FROM information_schema.table_constraints WHERE table_name = 'offices'; 
#1. 创建数据库test04_company
CREATE DATABASE IF NOT EXISTS test04_company;
#2. 按照下表给出的表结构在test04_company数据库中创建两个数据表offices和employees
USE test04_company;
CREATE TABLE IF NOT EXISTS offices(
officeCode INT(10) PRIMARY KEY,
city VARCHAR(50) NOT NULL,
address VARCHAR(50) ,
country VARCHAR(50) NOT NULL,
postalCode VARCHAR(15) UNIQUE

);
CREATE TABLE IF NOT EXISTS employees(
employeeNumber INT(11) PRIMARY KEY AUTO_INCREMENT ,
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL,
mobile VARCHAR(25) UNIQUE,
officeCode INT(10) ,
jobTitle VARCHAR(50) NOT NULL,
birth DATETIME NOT NULL,
note VARCHAR(255),
sex VARCHAR(5),
CONSTRAINT fk_offices_employees FOREIGN KEY (officeCode) REFERENCES offices(officeCode)

);
#3. 将表employees的mobile字段修改到officeCode字段后面
ALTER TABLE employees 
MODIFY mobile VARCHAR(25) AFTER officeCode;
#4. 将表employees的birth字段改名为employee_birth
ALTER TABLE employees
CHANGE birth employee_birth DATETIME;
#5. 修改sex字段，数据类型为CHAR(1)，非空约束
ALTER TABLE employee
MODIFY sex CHAR(1) NOT NULL;
#6. 删除字段note
ALTER TABLE employees
DROP note;
#7. 增加字段名favoriate_activity，数据类型为VARCHAR(100)
ALTER TABLE employees
ADD favoriate_activity VARCHAR(100);
#8. 将表employees名称修改为employees_info
RENAME TABLE employees TO employees_info;
SELECT * 
FROM employees_info;
SELECT * FROM information_schema.table_constraints WHERE table_name = 'employees_info'; 