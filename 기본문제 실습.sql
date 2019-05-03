-- 1
select first_name, last_name   
from employees
where emp_no = 10944;

-- 2
select first_name as '이름', gender as '성별', hire_date  '입사일 ' 
from employees
order by hire_date;

-- 3 
select gender, count(*)
from employees
group by gender;

-- 4
select count(*)
from salaries
where to_date > curdate();

-- 5
select count(*)
from departments;

-- 6
select count(*)
from dept_manager;

-- 7
select *
from departments
order by length(dept_name) desc;

-- 8
select count(*)
from salaries
where salary >= 120000;

-- 9
select title
from titles
group by title
order by length(title) desc;

-- 10
select count(*)
from titles
where title like "%Engineer";

-- 11
select *
from salaries
where emp_no = 13250;



