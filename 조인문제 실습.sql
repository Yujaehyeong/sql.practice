-- 1
select a.emp_no, a.last_name, b.salary 
from employees a , salaries b
where a.emp_no = b.emp_no 
and  b.to_date = '9999-01-01'
order by b.salary desc;

-- 2
select a.emp_no as '사번', a.last_name as '이름', title as '직책'
from employees a, titles b
where a.emp_no = b.emp_no 
and b.to_date='9999-01-01'
order by a.emp_no;

-- 3
select a.emp_no as '사번', a.last_name as '이름', c.dept_name as '부서'
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no 
and b.dept_no = c.dept_no 
and b.to_date ='9999-01-01'
order by a.emp_no;

-- 4
select a.emp_no as '사번', a.last_name as '이름', 
b.salary as '연봉', c.title as '직책', e.dept_name as '부서'
from employees a, salaries b, titles c, dept_emp d, departments e
where a.emp_no = b.emp_no 
and a.emp_no = c.emp_no
and a.emp_no = d.emp_no
and d.dept_no = e.dept_no 
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
and d.to_date='9999-01-01'
order by a.emp_no;

-- 5
select a.emp_no, a.last_name
from employees a, titles b
where a.emp_no = b.emp_no
and b.to_date != '9999-01-01' 
and b.title = 'Technique Leader';

-- 6
select a.last_name, c.dept_name, d.title
from employees a, dept_emp b, departments c, titles d
where a.emp_no = b.emp_no
and a.emp_no = d.emp_no
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01' 
and d.to_date = '9999-01-01' 
and a.last_name like "S%";

-- 7
select a.emp_no, a.last_name, b.salary, c.title
from employees a, salaries b, titles c
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and b.salary >= 40000
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and c.title = 'Engineer'
order by b.salary;

-- 8
select a.emp_no, b.title, c.salary
from employees a ,titles b, salaries c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.salary > 50000
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
order by c.salary desc;

-- 9
select  d.dept_name, avg(b.salary)
from employees a ,salaries b, dept_emp c, departments d
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and c.dept_no = d.dept_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
group by d.dept_name
order by b.salary desc;

-- 10
select c.title, avg(b.salary)
from employees a, salaries b, titles c
where a.emp_no = b.emp_no 
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
group by c.title
order by b.salary desc;
