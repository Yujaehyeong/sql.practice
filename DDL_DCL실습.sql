-- DDL

-- talbe 삭제
-- drop table 테이블명;
drop table member;

-- Table 생성 
-- create table 테이블명(
-- 			필드명1 타입 [NULL | NOT NULL][DEFAULT ][AUTO_INCREMENT], 
-- 			필드명2 타입 [NULL | NOT NULL][DEFAULT ][AUTO_INCREMENT], 
-- 			필드명3 타입 [NULL | NOT NULL][DEFAULT ][AUTO_INCREMENT], 
-- 			........... 
-- 			PRIMARY KEY(필드명) 
-- 			);

create table member (
	no int not null primary key auto_increment,
    email varchar (50) not null default '', -- null 없이 빈 문자열로 디폴트값 설정
    passwd varchar(64) not null,
    name varchar(25),
    dept_name varchar(25)
    
);



desc member;

-- Table 수정 ( column 추가 /  삭제 )
-- alter table 테이블명
--     add  필드명 타입 [NULL | NOT NULL][DEFAULT ][AUTO_INCREMENT];
alter table member add juminbunho char(13) not null after no;
alter table member drop juminbunho;
alter table member add join_date datetime not null;

-- Table 수정 ( column 변경 ) 
-- alter table  테이블명
--     change  필드명  새필드명 타입 [NULL | NOT NULL][DEFAULT ][AUTO_INCREMENT];
alter table member change no no int unsigned not null primary key;
alter table member change dept_name department_name varchar(50);
alter table member change name name varchar(10);

desc member;

-- Table 이름 변경
-- alter table  테이블명 rename 변경이름
alter table member rename user;

desc user;


delete from member where no = '2';


-- DCL

insert into user -- 순서를 맞춰줘야함
values(null, '', password('1234'), '홍길동', '핵개발팀', now());


insert into user(join_date, name, passwd, dept_name) -- 순서 안맞춰도 됨
values(now(), '김유신', password('1234'), '핵개발팀');

update user
set join_date= (select now())
where no = 1;

update user
	set join_date = (now),
		name = 'YJH'
where no = 1;

delete from user where no = 1;

select * from user;







