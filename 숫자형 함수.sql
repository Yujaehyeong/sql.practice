-- 숫자형 함수

select abs(1), abs(-1) ; 
select mod(234, 10), 234% 10; -- 나머지 수 구하기
select floor(1.2345), floor(-1.2345); -- 1출력 , -2 출력
select ceiling(1.2345), ceiling(-1.2345); -- 2 출력, -1 출력
select round(-1.23), round(-1.58), round(1.58), round(1.48); -- -1, -2, 2출력
select pow(2, 3), pow(2, -3); -- 첫번째 인자의 두번째인자승 2의 3승 2의 -3승 
select sign(-10), sign(10), sign(0);
select greatest(98, 60 ,30); -- 가장 큰수 출력
select greatest('B', 'A' ,'CB', 'CA'); -- 가장 큰수 출력
select least(98, 60, 30), least('B', 'A', 'CB', 'CA');
