-- 집계(통계) 함수


select avg(salary), sum(salary), from_date
from salaries
group by emp_no
having avg(salary) > 1000;