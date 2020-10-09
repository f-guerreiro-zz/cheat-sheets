/* 4. Basic SELECT Queries */

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > 10000 AND (department_id = 100 OR department_id = 80);

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE first_name LIKE 'E%'; --case sensitive

--between
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary between 500 and 10000;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE (salary between 500 and 10000) and (department_id between 50 and 80);

--where in/not in
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id in ('IT_PROG', 'AD_VP'); --not in also same statement

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id not in (90, 100, 80, 70);

--select dates
SELECT * FROM employees
WHERE hire_date > to_date('01-JAN-2000', 'DD-MON-YYYY');

--exact Strings
SELECT first_name, last_name
FROM employees
WHERE last_name = 'King' and first_name = 'Steven'; -- case sensitive

--distinct
SELECT distinct department_id
FROM employees;
--for both department_id and salary
SELECT distinct department_id, salary
FROM employees;

--calculations
SELECT first_name, last_name, salary, salary*1.15,salary*1.15-salary
FROM employees;

--Aliases
SELECT first_name as "Employee First Name", last_name as "Employee Last Name", salary, salary*1.15 as "Salary plus bonus",salary*1.15-salary as "Bonus"
FROM employees;

--describe table structure
desc employees;

--order by
SELECT first_name, last_name, salary, department_id
FROM employees
order by salary asc, department_id desc; -- asc or desc


/* 5. FUNCTIONS in SQL -- Scalar Functions and Aggregate Functions */

--SUBSTRING - truncates character result
SELECT substr(job_title,1,5) FROM jobs; -- sees only the 5 characters from job_title starting on the 1st character

--LENGHT - returns lenght of result
SELECT first_name, last_name, lenght(first_name), lenght(last_name)
FROM employees;

--CONCAT - merges results
SELECT concat (first_name, last_name)
FROM employees;

SELECT concat ('First Name:', first_name), concat('Last Name:'last_name)
FROM employees;
--using pipes concatenates in a single collumn
SELECT 'First Name:'|| first_name || '-----'||'Last Name:'||last_name
FROM employees;

--LOWER and UPPER

SELECT upper(first_name), lower(last_name)
FROM employees;

SELECT first_name, last_name
FROM employees
where upper(first_name) = 'DAVID';

--INSTR searches inside strings
SELECT first_name, last_name, phone_number, instr(phone_number,'5')
FROM employees;

SELECT first_name, instr(first_name,'a')
FROM employees;

--RPAD and LPAD - makes the total lenght of the string to reach the pad value
SELECT lpad(first_name,10,'*')
FROM employees;

--TO_CHAR NUMBERS - applies mask to result
SELECT TO_CHAR(salary,'L99G999') --L means currency, G999 means ,000
FROM employees;

--TO_CHAR DATE
SELECT first_name, to_char(hire_date, 'DD/MM/YYYY')
FROM employees;

--TO_CHAR filter dates
SELECT first_name, hire_date
FROM employees
WHERE to_char(hire_date,'MON') = 'JAN';

-- DUAL table
SELECT upper('Hello World')
FROM DUAL;

--ROUND - will round the result up
SELECT round(999,98765,2)
from DUAL;

--TRUNC - chops the result
SELECT trunc(999.98765,3)
from DUAL;

--SYSDATE
SELECT sysdate FROM DUAL;

SELECT to_char(sysdate,'DD-MON-YYYY HH24:MI:SS')

--SYSTIMESTAMP
SELECT systimestamp FROM DUAL;

--MONTHS_BETWEEN
SELECT sysdate, hire_date, round(months_between(sysdate, hire_date)/12,0) as Years_employed
FROM employees;

--ADD_MONTHS
SELECT sysdate, add_months(sysdate,1), add_months(sysdate,2),add_months(sysdate,3)
FROM DUAL;

/* 6. Joining Table Data 
INNER JOIN = Selects values that have matching values in both tables ONLY IF THEY EXIST IN BOTH TABLES
LEFT JOIN = Selects records from the left table with matching values in the right table IF THEY EXIST IN THE LEFT TABLE
AND EVEN IF THEY DO NOT EXIST IN THE LEFT TABLE
RIGHT JOIN = Selects records from the right table with matching values in the left table IF THEY EXIST IN THE RIGHT TABLE
AND EVEN IF THEY DO NOT EXIST IN THE LEFT TABLE
FULL OUTER JOIN = Select all records that match from all of the tables
*/

--JOIN / INNER JOIN - selects if there are matches in both
SELECT employees.first_name, employees.last_name, departments.departments_name
FROM employees join departments on employees.department_id = departments.department_id;

--LEFT JOIN selects if they exist on left table even if no record in the right table
SELECT employees.first_name, employees.last_name, departments.departments_name
FROM employees left join departments on employees.department_id = departments.department_id;

--RIGHT JOIN selects if they exist on the right table even if no record in the left table
SELECT employees.first_name, employees.last_name, departments.departments_name
FROM employees right join departments on employees.department_id = departments.department_id;

--FULL JOIN selects if records exist in any of the tables
SELECT employees.first_name, employees.last_name, departments.departments_name
FROM employees full join departments on employees.department_id = departments.department_id;

--ALIAS
SELECT first_name, departments_name
FROM employees emp join departments emp on emp.department_id = dep.department_id;

--ORACLE ONLY SYNTAX
SELECT first_name, last_name, departments_name
FROM employees, departments
WHERE employees.department_id = departments.department_id; -- (+) to side to make a join besides table id name

/*7. Manipulating Data
DML = Data modification language i.e:insert/update/delete
DDL = Data definition language i.e: create table
COMMIT or ROLLBACK
*/

--CREATE A TABLE
create table test_table1(col1 varchar2(100), col2 number(5));

--INSERT
insert into test_table1 values ('Hello',4);
insert into test_table1 values ('World',5);
insert test_table1 (col1,col2) values ('Foo',6);
insert test_table1 (col1) values ('Bar');
insert into test_table1 values ('Test!',7);

--DELETE
delete from test_table1 where col2=7;
delete from test_table1 where col='hello';