-- 문자형 함수

select upper('Seoul'), ucase('seoul');

select lower('Seoul'), lcase('seoul'); -- seoul seoul 출력 

select substring('Happy Day', 3, 2); -- pp 출력

select lpad('hi', 5, '?'); -- 글씨 5개가 나오도록 부족한 개수만듬 3번째 인자의 문자로 left에 채운다 ???hi 출력

select lpad(123, 5, '?'); -- int형태도 가능

SELECT emp_no, LPAD(salary, 10, '*')      
  FROM salaries     
 WHERE from_date like '2001-%'       
   AND salary < 70000;

select concat('---', ltrim('     hello     '), '---'), -- 왼쪽 공백 없애는 함수
	concat('---', rtrim('     hello     '), '---'), -- 오른쪽 공백 없애는 함수
    concat('---', trim('     hello     '), '---'), -- 모든 공백 없애는 함수
    concat('---', trim(both 'x' from 'xxxxhelloxxxxx'), '---'); -- 모든 공백 및 both 'x' 라면 x문자까지 없애는 함수