#1. 创建数据库dbtest11
CREATE DATABASE IF NOT EXISTS dbtest11 CHARACTER SET 'utf8';
#2. 运行以下脚本创建表my_employees
USE dbtest11;
CREATE TABLE my_employees(
id INT(10),
first_name VARCHAR(10),
last_name VARCHAR(10),
userid VARCHAR(10),
salary DOUBLE(10,2)
);
CREATE TABLE users(
id INT,
userid VARCHAR(10),
department_id INT
);
#3. 显示表my_employees的结构
SELECT *
FROM my_employees
#4. 向my_employees表中插入下列数据
ID FIRST_NAME LAST_NAME USERID SALARY
1 patel Ralph Rpatel 895
2 Dancs Betty Bdancs 860
3 Biri Ben Bbiri 1100
4 Newman Chad Cnewman 750
5 Ropeburn Audrey Aropebur 1550
INSERT INTO my_employees
VALUES
(1,' patel ','Ralph ','Rpatel ',895),
(2,' Dancs ','Betty ','Bdancs ',860),
(3,' Biri ','Ben ','Bbiri ',1100),
(4,'Newman ','Chad ','Cnewman ',750),
(5 ,'Ropeburn ','Audrey ','Aropebur ',1550);
#5. 向users表中插入数据
1 Rpatel 10
2 Bdancs 10
3 Bbiri 20
4 Cnewman 30
5 Aropebur 40
INSERT INTO users VALUES
(1,'Rpatel',10),
(2,'Bdancs',10),
(3,'Bbiri',20),
(4,'Cnewman',30),
(5,'Aropebur',40)

#6. 将3号员工的last_name修改为“drelxer”
UPDATE my_employees
SET last_name='drelxer'
WHERE id=3;
#7. 将所有工资少于900的员工的工资修改为1000
UPDATE my_employees
SET salary=1000
WHERE salary<900
#8. 将userid为Bbiri的user表和my_employees表的记录全部删除
DELETE FROM my_employees
WHERE userid='Bbiri';
DELETE FROM users
WHERE userid='Bbiri';

#方式2 
#建立内连接并删除
DELETE m,u
FROM my_employees m
JOIN users u
ON m.userid=u.userid
WHERE m.userid='Bbiri';
#9. 删除my_employees、users表所有数据
SELECT * FROM my_employees;
SELECT * FROM users;
#10. 检查所作的修正


#11. 清空表my_employees

TRUNCATE TABLE my_employees

# 1. 使用现有数据库dbtest11
USE dbtest11;
# 2. 创建表格pet
CREATE TABLE pet(
`name` VARCHAR(20),
`owner` VARCHAR(20),
species VARCHAR(20),
sex CHAR(1),
birth YEAR,
death YEAR
);
# 3. 添加记录
INSERT INTO pet VALUES('Fluffy','harold','Cat','f','2013','2010');
INSERT INTO pet(`name`,`owner`,species,sex,Birth)
VALUES('Claws','gwen','Cat','m','2014');
INSERT INTO pet(`name`,species,sex,Birth) VALUES('Buffy','Dog','f','2009');
INSERT INTO pet(`name`,`owner`,species,sex,Birth)
VALUES('Fang','benny','Dog','m','2000');
INSERT INTO pet VALUES('bowser','diane','Dog','m','2003','2009');
INSERT INTO pet(`name`,species,sex,birth) VALUES('Chirpy','Bird','f','2008');


SELECT * FROM pet;
# 4. 添加字段:主人的生日owner_birth DATE类型。
ALTER TABLE pet
ADD COLUMN owner_birth DATE;
# 5. 将名称为Claws的猫的主人改为kevin
UPDATE pet
SET owner='kevin'
WHERE name='Claws';
# 6. 将没有死的狗的主人改为duck
UPDATE pet
SET owner='duck'
WHERE death IS NULL AND species='Dog';
# 7. 查询没有主人的宠物的名字；
SELECT NAME
FROM pet
WHERE owner IS NULL;
# 8. 查询已经死了的cat的姓名，主人，以及去世时间；
SELECT name,owner,death
FROM pet
WHERE species='Cat' AND death IS NOT NULL;
# 9. 删除已经死亡的狗
DELETE p
#SELECT *
FROM pet p
WHERE species='Dog' AND death IS NOT NULL;
# 10. 查询所有宠物信息
SELECT * FROM pet;

# 1. 使用dbtest11数据库
USE dbtest11;
# 2. 创建employee表
CREATE TABLE employee(
id INT,
`name` VARCHAR(20),
sex VARCHAR(2),
tel VARCHAR(20),
addr VARCHAR(50),
salary DOUBLE
);
# 添加信息
INSERT INTO employee(id,`name`,sex,tel,addr,salary)VALUES
(10001,'张一一','男','13456789000','山东青岛',1001.58),
(10002,'刘小红','女','13454319000','河北保定',1201.21),
(10003,'李四','男','0751-1234567','广东佛山',1004.11),
(10004,'刘小强','男','0755-5555555','广东深圳',1501.23),
(10005,'王艳','男','020-1232133','广东广州',1405.16);
# 3. 查询出薪资在1200~1300之间的员工信息。
SELECT 
# 4. 查询出姓“刘”的员工的工号，姓名，家庭住址。
# 5. 将“李四”的家庭住址改为“广东韶关”
# 6. 查询出名字中带“小”的员工

