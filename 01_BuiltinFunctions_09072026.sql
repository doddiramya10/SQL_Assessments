-- -- -- select upper('data') from dual
-- -- -- select upper('oracle sql') from dual
-- -- -- select upper('hello world') from dual
-- -- -- select first_name,upper(first_name) from hr.EMPLOYEES
-- -- -- select last_name,upper(last_name) from hr.EMPLOYEES
-- -- --  select employee_id,first_name,last_name from hr.EMPLOYEES where upper(first_name)='STEVEN';

-- -- -- `LOWER()` converts alphabetic characters into lowercase letters.
-- -- -- select lower('ORACLE') from dual
-- -- -- select lower('ORACLE SQL PROGRAMMING') from dual
-- -- -- select first_name,lower(first_name) from hr.employees
-- -- -- select email,lower(email) from hr.EMPLOYEES
-- -- -- select employee_id,first_name,email from hr.employees where lower(email)='sking'

-- -- -- `INITCAP()` converts the first character of each word to uppercase and the remaining characters to lowercase.
-- -- -- select initcap('oracle sql programming') from dual
-- -- -- select initcap('hello world') from dual 
-- -- -- SELECT INITCAP('data science and machine learning')FROM dual;
-- -- -- select first_name,initcap(first_name) from hr.employees
-- -- -- select initcap(first_name ||' '|| last_name) as full_name from hr.employees
-- -- -- select concat(first_name,' ',last_name) as full_name from hr.employees

-- -- -- `LENGTH()` returns the number of characters present in a string.
-- -- -- select length('oracle') from dual
-- -- -- select length('data science') from dual
-- -- -- select first_name,length(first_name) from hr.employees
-- -- -- select employee_id,first_name,length(first_name) from hr.employees where length(first_name) <6
-- -- -- select employee_id,last_name from hr.employees where length(last_name)=5


-- -- -- `SUBSTR()` extracts a portion of a string.
-- -- -- select substr('oracle',1,3) from dual
-- -- -- select substr('oracle',2,3) from dual
-- -- -- select substr('oracle',3,2) from dual
-- -- -- select substr('oracle',3) from dual
-- -- -- select substr('oracle',-3) from dual
-- -- -- select substr('oracle',-2) from dual
-- -- -- select first_name,substr(first_name,1,3) from hr.EMPLOYEES
-- -- -- select first_name ,substr(first_name,1,1) from hr.employees
-- -- -- select first_name,substr(first_name,-3) from hr.EMPLOYEES
-- -- -- select email,substr(email,1,3) from hr.EMPLOYEES


-- -- --`CONCAT()` joins two strings together.
-- -- -- select concat('oracle','programming') from dual
-- -- -- select concat('oracle ','programming') from dual
-- -- -- select first_name,last_name, concat(first_name,' ',last_name) as full_name from hr.employees 
-- -- -- select concat(first_name,concat(' ',last_name)) AS full_name from hr.employees
-- -- -- select first_name || ' ' ||last_name as full_name from hr.employees
-- -- -- select employee_id || '-'|| first_name ||' '|| last_name  from hr.employees

-- -- --`REPLACE()` searches for a particular string and replaces it with another string.
-- -- -- select replace('hello world','world','oracle') from dual
-- -- -- -- select replace('oracle database','database','sql') from dual
-- -- -- select replace('123-456-789','-','') from dual
-- -- -- select replace('oracle sql developer',' ','_') from dual
-- -- -- select first_name,replace(first_name,'a','@') from hr.EMPLOYEES
-- -- -- select email,replace(email,'A','@') from hr.employees

-- -- --`TRIM()` removes unwanted characters, commonly spaces, from the beginning and end of a string.
-- -- -- select trim('  oracle  ') from dual
-- -- -- select first_name,trim(first_name) from hr.employees
-- -- -- select * from hr.employees where trim(first_name)='Steven'
-- -- -- select trim('  oracle sql ') from dual

-- -- --`LTRIM()` removes characters from the left side of a string.
-- -- -- select ltrim('  oracle') from dual
-- -- -- select ltrim('*****oracle','*')  from dual
-- -- -- select ltrim('000123','0') from dual
-- -- -- select ltrim('AAAAOracle','A') from dual
-- -- -- select first_name,ltrim(first_name) from hr.employees

-- -- --`RTRIM()` removes characters from the right side of a string.
-- -- -- select rtrim('oracle  ') from dual
-- -- -- select rtrim('1230000','0') from dual
-- -- -- select rtrim('oracle****','*') from dual
-- -- -- -- select rtrim('oracleAAA','A') from dual
-- -- -- select first_name,rtrim(first_name) from hr.employees

-- -- -- `LPAD()` adds characters to the LEFT side of a value until the required total length is reached.
-- -- -- select lpad('123','5','0') from dual
-- -- -- select lpad('oracle','7','-') from dual
-- -- -- select lpad('100','8','0') from dual
-- -- -- select lpad('sql','10','*') from dual
-- -- -- -- select lpad('123','10','AB') from dual
-- -- -- -- select employee_id,lpad(employee_id,6,'0') as formatted_employee_id from hr.employees
-- -- -- select salary,lpad(salary,10,'*') from hr.employees
-- -- -- select Lpad('Oracle','4','0') from dual

-- -- --`RPAD()` adds characters to the RIGHT side until the specified total length is reached.
-- -- -- select rpad('oracle',10,'*') from dual
-- -- -- select rpad('123','5','0') from dual
-- -- -- select rpad('SQL','10','.') from dual
-- -- -- select first_name,rpad(first_name,15,'.') from hr.employees
-- -- -- select rpad('orace','4','*') from dual
-- -- -- select lpad('123','5','0'),rpad('123','5','0') from dual

-- -- --`ASCII()` returns the numeric code of the first character of a string.
-- -- -- select ASCII('A') from dual
-- -- -- select ascii('B') from dual
-- -- -- select ascii('C') from dual
-- -- -- select ascii('a') from dual
-- -- -- select ascii('0') from dual
-- -- -- select ascii('ABC') FROM dual
-- -- -- select first_name,ascii(first_name) from hr.employees


-- -- --`CHR()` performs the opposite operation of `ASCII()`.
-- -- --select chr(65) from dual
-- -- -- select chr(66) from dual
-- -- -- select chr(67) from dual
-- -- -- select chr(97) from dual
-- -- -- select ascii('A'),chr(65) from dual


-- -- --Numeric functions operate on numerical data and return numerical results.

-- -- --`CEIL()` returns the smallest integer that is greater than or equal to the given number.
-- -- -- select ceil(10.1) from dual
-- -- -- select ceil(10.9) from dual
-- -- -- select ceil(10) from dual
-- -- -- select ceil(15.01) from dual
-- -- -- select ceil(99.99) from dual
-- -- -- select salary,salary/12,ceil(salary/12) as per_month from hr.employees 

-- -- --`FLOOR()` returns the largest integer that is less than or equal to the given number.
-- -- -- select floor(10.1) from dual
-- -- -- select floor(10.9) from dual
-- -- -- select floor(10) from dual
-- -- -- select floor(15.99) from dual
-- -- -- select floor(99.01) from dual
-- -- --select salary,salary/12,floor(salary/12) from hr.employees
-- -- -- select ceil(10.7),floor(10.7) from dual


-- -- --`MOD()` returns the remainder after division.
-- -- -- select mod(10,3) from dual
-- -- -- select mod(20,5) from dual
-- -- -- select mod(11,2) from dual
-- -- -- select employee_id,first_name from hr.employees where mod(employee_id,2)=0
-- -- -- select employee_id,first_name from hr.employees where mod(employee_id,2)=1
-- -- --select employee_id,mod(employee_id,10) from hr.employees

-- -- ---`ABS()` returns the absolute value of a number.
-- -- -- select abs(-10.3) from dual
-- -- -- select abs(-100) from dual
-- -- -- select abs(100) from dual
-- -- -- select abs(0) from dual
-- -- -- select employee_id,salary,abs(salary-10000) from hr.employees

-- -- --`POWER()` raises a number to a specified power.
-- -- -- select power(2,3) from dual
-- -- -- select power(5,3) from dual
-- -- -- select power(10,3) from dual

-- -- -- # Fractional Powers

-- -- -- Fractional powers can be used to calculate roots.

-- -- -- select power(2,0.5) from dual
-- -- -- select sqrt(2) from dual
-- -- -- select power(16,0.5) from dual
-- -- -- select power(2,1/2) from dual
-- -- -- select power(3,3) from dual
-- -- -- select employee_id,salary,power(salary,2) from hr.employees


-- -- --`SQRT()` calculates the square root of a number.
-- -- select sqrt(16) from dual
-- -- select sqrt(25) from dual
-- select sqrt(2) from dual
-- select sqrt(100) from dual

--# COMPLETE CHARACTER FUNCTION PRACTICE USING DUAL

--  SELECT UPPER('oracle') FROM dual;

-- SELECT LOWER('ORACLE') FROM dual;

-- SELECT INITCAP('oracle sql programming') FROM dual;

-- SELECT LENGTH('oracle') FROM dual;

-- SELECT LENGTH('data science') FROM dual;

--SELECT SUBSTR('oracle',1,3) FROM dual;

-- SELECT SUBSTR('oracle',2,3) FROM dual;

-- SELECT SUBSTR('oracle',3) FROM dual;

-- SELECT SUBSTR('oracle',-3) FROM dual;

-- SELECT CONCAT('oracle','programming') FROM dual;

-- SELECT CONCAT('oracle ','programming') FROM dual;

-- SELECT REPLACE('hello world','world','oracle') FROM dual;

-- SELECT REPLACE('123-456-789','-','') FROM dual;

-- SELECT TRIM('   oracle   ')  FROM dual;

-- SELECT LTRIM('   oracle') FROM dual;

-- SELECT RTRIM('oracle   ') FROM dual;

-- SELECT LTRIM('****oracle','*') FROM dual;

--SELECT RTRIM('1230000','0') FROM dual;

--SELECT LPAD('123',5,'0') FROM dual;

--SELECT LPAD('oracle',7,'_')  FROM dual;

--SELECT RPAD('123',5,'0')  FROM dual;

-- SELECT RPAD('oracle',10,'*') FROM dual;

--SELECT ASCII('A')  FROM dual;

--SELECT CHR(65)  FROM dual;

-- # COMPLETE CHARACTER FUNCTION PRACTICE USING HR.EMPLOYEES

-- SELECT first_name, UPPER(first_name) FROM hr.employees;

-- ## LOWER

-- SELECT first_name, LOWER(first_name) FROM hr.employees;

-- ## INITCAP

-- SELECT first_name, INITCAP(first_name) FROM hr.employees;

-- ## LENGTH

--SELECT first_name,  LENGTH(first_name) FROM hr.employees;

-- ## SUBSTR

--SELECT first_name, SUBSTR(first_name,1,3) FROM hr.employees;

-- ## First Character

--SELECT first_name, SUBSTR(first_name,1,1) FROM hr.employees;

-- ## Last 3 Characters

--SELECT first_name, SUBSTR(first_name,-3) FROM hr.employees;

-- ## CONCAT

--SELECT first_name, last_name,CONCAT(first_name,last_name) FROM hr.employees;

-- ## Full Name

--SELECT first_name || ' ' || last_name AS full_name FROM hr.employees;

-- ## REPLACE

--SELECT first_name, REPLACE(first_name,'a','@') FROM hr.employees;

-- ## TRIM

--SELECT first_name, TRIM(first_name) FROM hr.employees;

-- ## LTRIM

--SELECT first_name, LTRIM(first_name) FROM hr.employees;

-- ## RTRIM

--SELECT first_name, RTRIM(first_name) FROM hr.employees;

-- ## LPAD Employee ID

--SELECT employee_id, LPAD(employee_id,6,'0') FROM hr.employees;

-- ## RPAD Employee Name

--SELECT first_name, RPAD(first_name,15,'.') FROM hr.employees;

-- ## ASCII

--SELECT first_name,ACII(first_name) FROM hr.employees;

-- # COMPLETE NUMERIC FUNCTION PRACTICE USING DUAL

-- ## CEIL

-- SELECT CEIL(10.1) FROM dual;

--SELECT CEIL(10.9) FROM dual;

--SELECT CEIL(10) FROM dual;

--SELECT CEIL(99.01) FROM dual;

--## FLOOR

-- SELECT FLOOR(10.1) FROM dual;

-- SELECT FLOOR(10.9) FROM dual;

-- SELECT FLOOR(10) FROM dual;

-- SELECT FLOOR(99.99) FROM dual;


--## MOD

-- SELECT MOD(10,3) FROM dual;

-- SELECT MOD(20,5) FROM dual;

-- SELECT MOD(11,2) FROM dual;

-- SELECT MOD(100,7) FROM dual;

-- ## ABS

-- SELECT ABS(-10.3) FROM dual;

--SELECT ABS(-100) FROM dual;

--SELECT ABS(100) FROM dual;

--SELECT ABS(0) FROM dual;


-- ## POWER

--SELECT POWER(2,3) FROM dual;

--SELECT POWER(5,2) FROM dual;

--SELECT POWER(10,3) FROM dual;

--SELECT POWER(2,0.5) FROM dual;

--SELECT POWER(2,1/2) FROM dual;



-- ## SQRT

--SELECT SQRT(2) FROM dual;

--SELECT SQRT(16) FROM dual;

--SELECT SQRT(25) FROM dual;

--SELECT SQRT(100) FROM dual;


-- ## CEIL
-- SELECT employee_id,salary,salary / 12 AS divided_salary,CEIL(salary / 12) AS ceil_value FROM hr.employees;

-- ## FLOOR

--SELECT employee_id,salary,salary / 12 AS divided_salary,FLOOR(salary / 12) AS floor_value FROM hr.employees;

-- ## MOD

--SELECT employee_id,MOD(employee_id,2) AS remainder FROM hr.employees;

-- ## Even Employee IDs

--SELECT employee_id,first_name FROM hr.employees WHERE MOD(employee_id,2) = 0;

-- ## Odd Employee IDs

--SELECT employee_id,first_name FROM hr.employees WHERE MOD(employee_id,2) = 1;

-- ## ABS

-- --SELECT employee_id,salary, ABS(salary - 10000) AS salary_difference FROM hr.employees;

-- ## POWER

--SELECT employee_id,salary,POWER(salary,2) AS salary_square FROM hr.employees;

-- ## SQRT

--SELECT employee_id, salary,SQRT(salary) AS salary_square_root FROM hr.employees;

--# IMPORTANT DIFFERENCES


-- # FINAL PRACTICE SET
-- select upper('data engineering ') from dual
-- select lower('DATA ENGINEERING') from dual
-- select initcap('oracle database administrator') from dual
-- select length('machine learning') from dual
-- select substr('artificial intelligence',1,10) from dual
-- select concat('oracle ','SQL') from dual
-- -- select replace('hello python','python','oracle') from dual
-- select trim('  oracle  ') from dual
-- select ltrim('0000050',0) from dual
-- select rtrim('5000000',0) from dual
-- select lpad('500',8,0) from dual
-- -- select rpad('SQL',10,'.') from dual
-- select ascii('A') from dual
-- select chr(65) from dual

-- ## Numeric Functions

--SELECT CEIL(25.01) FROM dual;

--SELECT FLOOR(25.99) FROM dual;

--SELECT MOD(25,4) FROM dual;

--SELECT ABS(-999.50) FROM dual;

--SELECT POWER(3,4) FROM dual;

--SELECT SQRT(81) FROM dual;

--## HR.EMPLOYEES Practice

-- select first_name,upper(first_name) from hr.employees
 
--SELECT first_name, UPPER(first_name) FROM hr.employees;

--SELECT first_name, LOWER(first_name) FROM hr.employees;

--SELECT first_name, INITCAP(first_name) FROM hr.employees;

--SELECT first_name, LENGTH(first_name) FROM hr.employees;

--SELECT first_name, SUBSTR(first_name,1,3)  FROM hr.employees;

--SELECT first_name || ' ' || last_name AS full_name FROM hr.employees;

--SELECT employee_id, LPAD(employee_id,6,'0') AS formatted_id FROM hr.employees;

--SELECT first_name, RPAD(first_name,20,'.') AS formatted_name FROM hr.employees;

--SELECT employee_id, salary,CEIL(salary / 12) AS ceil_monthly_salary FROM hr.employees;

--SELECT employee_id, salary,  FLOOR(salary / 12) AS floor_monthly_salary FROM hr.employees;

--SELECT employee_id,  MOD(employee_id,2) AS remainder  FROM hr.employees;

--SELECT employee_id, salary,ABS(salary - 10000) AS difference_from_10000  FROM hr.employees;

--SELECT employee_id,salary, POWER(salary,2) AS salary_square FROM hr.employees;

--SELECT employee_id,salary,SQRT(salary) AS salary_square_root FROM hr.employees;





















