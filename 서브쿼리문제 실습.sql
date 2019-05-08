

-- 문제1. 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?

select count(emp_no) as '평균연봉초과 인원수'
from salaries
where salary > (select avg(salary)
				from salaries
				where to_date = '9999-01-01');
                
-- 문제2.  현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서, 연봉을 조회하세요. 
-- 					단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 

select a.emp_no, a.first_name, c.dept_name, d.salary
from employees a, dept_emp b, departments c, salaries d
where a.emp_no = b.emp_no
and a.emp_no =d.emp_no
and b.dept_no = c.dept_no
and b.to_date ='9999-01-01'
and d.to_date ='9999-01-01'
and (b.dept_no, d.salary) =any (
								select  b.dept_no, max(c.salary)
								from employees a, dept_emp b, salaries c
								where a.emp_no = b.emp_no
								and a.emp_no =c.emp_no
								and b.to_date ='9999-01-01'
								and c.to_date ='9999-01-01'
								group by b.dept_no)
order by d.salary desc;

-- 문제3. 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 

select a.emp_no, a.first_name,  b.salary
from employees a,  salaries b
where a.emp_no = b.emp_no
and b.to_date ='9999-01-01'
and b.salary >any (
					select avg(c.salary)
					from employees a, dept_emp b, salaries c
					where a.emp_no = b.emp_no
					and a.emp_no =c.emp_no
					and b.to_date ='9999-01-01'
					and c.to_date ='9999-01-01'
					group by b.dept_no);

-- 문제4. 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요

-- SELECT 
--     a.emp_no,
--     CONCAT(a.first_name, ' ', a.last_name),
--     CONCAT(d.first_name, ' ', d.last_name),
--     e.dept_name
-- FROM
--     employees a,
--     dept_emp b,
--     dept_manager c,
--     employees d,
--     departments e
-- WHERE
--     a.emp_no = b.emp_no
--         AND b.dept_no = c.dept_no
--         AND d.emp_no = d.emp_no
--         AND c.dept_no = e.dept_no
--         AND b.to_date = '9999-01-01'
--         AND c.to_date = '9999-01-01'
-- and e.dept_name= 'Marketing';

select a.emp_no as '번호', a.first_name as '이름', b.first_name '매니저이름', e.dept_name'부서'
from employees a, employees b, dept_emp c, dept_manager d, departments e
where a.emp_no = c.emp_no
and c.dept_no = e.dept_no
and b.emp_no = d.emp_no
and d.dept_no = e.dept_no
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and e.dept_name = 'Marketing';


-- select b.dept_name, c.first_name
-- from dept_manager a, departments b, employees c
-- where c.emp_no = a.emp_no
-- and a.dept_no = b.dept_no
-- and a.to_date = '9999-01-01';


-- 문제5. 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name),
    e.title,
    b.salary
FROM
    employees a,
    salaries b,
    dept_emp c,
    (SELECT 
        c.dept_no, max(b.salary) AS max_salary
    FROM
        employees a, salaries b, dept_emp c
    WHERE
        a.emp_no = b.emp_no
            AND a.emp_no = c.emp_no
            AND b.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) d,
    titles e
WHERE a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND c.dept_no = d.dept_no
        AND a.emp_no = e.emp_no
        AND b.salary = d.max_salary
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01';



-- 문제6. 평균 연봉이 가장 높은 부서는? 

SELECT 
    d.dept_name, ROUND(AVG(b.salary)) AS avg_salary
FROM
    employees a,
    salaries b,
    dept_emp c,
    departments d
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND c.dept_no = d.dept_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
GROUP BY c.dept_no
HAVING avg_salary = (SELECT 
        MAX(avg_salary)
    FROM
        (SELECT 
            ROUND(AVG(b.salary)) AS avg_salary
        FROM
            employees a, salaries b, dept_emp c
        WHERE
            a.emp_no = b.emp_no
                AND a.emp_no = c.emp_no
                AND b.to_date = '9999-01-01'
                AND c.to_date = '9999-01-01'
        GROUP BY c.dept_no) a);
                                

-- 문제7. 평균 연봉이 가장 높은 직책?

SELECT 
    c.title, ROUND(AVG(b.salary)) AS avg_salary
FROM
    employees a,
    salaries b,
    titles c
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
GROUP BY c.title
HAVING avg_salary = (SELECT 
        MAX(avg_salary)
    FROM
        (SELECT 
            ROUND(AVG(b.salary)) AS avg_salary
        FROM
            employees a, salaries b, titles c
        WHERE
            a.emp_no = b.emp_no
                AND a.emp_no = c.emp_no
                AND b.to_date = '9999-01-01'
                AND c.to_date = '9999-01-01'
        GROUP BY c.title) a);


-- 문제8. 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 			부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

SELECT 
    f.dept_name AS '부서이름',
    a.first_name AS '사원이름',
    d.salary AS '연봉',
    g.first_name AS '매니저 이름',
    e.salary AS '매니저 연봉'
FROM
    employees a,
    dept_emp b,
    dept_manager c,
    salaries d,
    salaries e,
    departments f,
    employees g
WHERE
    a.emp_no = b.emp_no
        AND c.dept_no = b.dept_no
        AND a.emp_no = d.emp_no
        AND c.emp_no = e.emp_no
        AND c.dept_no = f.dept_no
        AND c.emp_no = g.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND e.to_date = '9999-01-01'
        AND d.salary > e.salary;



                      

