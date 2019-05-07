
-- 1
select max(salary) as "최고임금" , min(salary) as "최저임금", (max(salary) - min(salary)) as "최고임금 - 최저임금"
from  salaries;

-- 2
select date_format(max(hire_date), '%Y년 %c월 %d일') as "입사일"
from employees;

-- 3 
select min(a.hire_date)
from employees a, titles b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

-- 4
select avg(a.salary)
from salaries a , titles b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

-- 5
select max(salary) as '최고연봉', min(salary) as '최저연봉'
from salaries a , titles b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

-- 6
select TIMESTAMPDIFF(YEAR, max(a.hire_date), now())
as '최고 어린 사원', TIMESTAMPDIFF(YEAR, min(a.hire_date), now())
as '최 연장자'
from employees a, titles b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01';




