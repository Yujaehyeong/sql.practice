-- 날짜형 함수

select curdate(), current_date; -- 오늘날짜 yyyy-mm-dd 출력 
select curtime(), current_time; -- 현재 시간:분:초 출력
select now(), sysdate(), current_timestamp; -- yyyy-mm-dd 시간:분:초 출력alter

select now(), sleep(2), now(); -- now는 실행되기전에 계산하고 출력 같은 시간출력 
select sysdate(), sleep(2), sysdate(); -- 쿼리를 실행하면서 진행됨 다른 시간출력

select date_format(now(), '%Y년-%c월-%d일 %h:%i:%s');


select first_name,
		hire_date , date_add(hire_date, interval 5 MONTH)
from employees;

select now(), cast(now() as date); -- now는 시간 까지 같이 나오지면 date로 형변화하면 날짜만나옴
select cast(1-2 as unsigned);
select cast(cast(1-2 as unsigned) as signed); 
        
