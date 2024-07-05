use my_data;

show create table model_info;
desc model_info;

#* 데이터 삽입 - 컬럼 순서대로 넣기
insert into model_info values (1, 'i7', 7700, 'Kaby Lake');
#* 데이터 삽입 - 특정 필드만 넣기
insert into model_info (name, model_num, model_type)
values ('i7', '7700K', 'Kaby Lake');
insert into model_info (name, model_num, model_type)
values ('i5', '14400F', 'Coffe Lake');
insert into model_info (name, model_num, model_type)
values ('i7', '12700', 'Elder Lake');
insert into model_info (name, model_num, model_type)
values ('i5', '12400F', 'Elder Lake');
insert into model_info (name, model_num, model_type)
values ('i5', '14400F', 'Lapter Lake Refresh');
insert into model_info (name, model_num, model_type)
values ('i7', '12700', 'Sky Lake');

#* 모델타입 자료형 늘리기
alter table model_info modify model_type varchar(30) not null;

#* 데이터 가져오기 - *은 모든 컬럼을 읽겠다는 뜻
select * from model_info;

#* 특정 컬럼 데이터 가져오기
select name from model_info;
select name, model_num, model_type from model_info;
select name, model_num, model_type, id from model_info;


#* as 로 컬럼 제목 변경
select name as `이름` from model_info;
select
    name as cpu_name,
    model_num as CPU_NUM
from model_info;

#* order by: 원하는 순서로 정렬하기
select id from model_info
order by id desc;
select id, name from model_info
order by name desc;

#* where: 조건에 맞는 데이터 검색
select * from model_info
where id < 3;

select * from model_info
where id = 3;
#* and
select * from model_info
where id > 3 and id < 7;
select * from model_info
where id < 3 and name = 'i7';
#* or
select * from model_info
where id < 3 or id > 6;
select * from model_info
where id < 3 or name = 'i7';

#* LIKE 원하는 일부 정보로 데이터를 조회
#* 특정단어로 시작하는 데이터 검색: select * from model_info where name like '7%';
#* 특정단어를 포함하는 데이터 검색: select * from model_info where name like '%7%';
#* 특정단어를 포함하고 뒤에 2갈자가 더 있을 경우 데이터 검색: select * from model_info where name like '7__'; <- _ 2개
select * from model_info where name like '%7%';
select * from model_info where model_type like 'Kaby%';
select * from model_info where model_type like 'Kaby_____'; # 공백 포함
select * from model_info where model_type like '_____Lake'; # 공백 포함
select * from model_info where model_type like '_____Lake' and id = 1;
select * from model_info where model_type like '_____Lake' or name = 'i7';

#* LIMIT 결과중 일부의 데이터만 가져오기
#* 데이터 5개만
select * from model_info limit 5;
#* 0번째로 시작한 2번째 데이터부터 2개
select * from model_info limit 2, 2;

#* 조건 합쳐서 써보기 - 조건걸리는 순서 잘 봐놓기
select
    id, name
from model_info
where id < 4
and name like '%i%'
order by name desc
limit 2;

# 실습
select * from model_info where model_num like '7700%';
select * from model_info where name = 'i7';
select * from model_info where model_type = 'Kaby Lake' limit 1;

#* UPDATE - 데이터 수정
update model_info
set name = 'i3'
where id = 3; #where없으면 테이블의 컬럼값이 모두 업데이트 됨
#* 여러 컬럼 업데이트
update model_info
set name = 'i3', model_num = '5500K'
where id = 3;

select * from model_info;

#* DELETE - 데이터 삭제
delete from my_product; # 테이블에 모든 데이터 삭제
delete from model_info where id = 1; # 조건에 부합하는 데이터 삭제
select * from model_info;

# 실습
alter table model_info add column lowest_price int unsigned;
desc model_info;

update model_info
set
    lowest_price = 257340
where id = 2;
update model_info
set
    lowest_price = 305290
where id = 3;
update model_info
set
    lowest_price = 323490
where id = 4;
update model_info
set
    lowest_price = 151680
where id = 5;
update model_info
set
    lowest_price = 171330
where id = 6;

select name, model_num from model_info where lowest_price <= 300000;
select * from model_info where lowest_price >= 400000;



