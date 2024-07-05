/*
* mysql이 기본적으로 사용하는 데이터베이스다~

information_schema
mysql
performance_schema
sys
*/
SHOW DATABASES;

#* DB 생성
CREATE DATABASE my_data;

#* 데이터베이스 목록 확인
SHOW DATABASES;

#* DB 삭제 - IF EXISTS: DB가 없어도 에러내지않고 다음 SQL을 실행하게 해준다.
DROP DATABASE IF EXISTS mydata;

#* 사용할 DB를 설정
USE my_data;

/*
? unsigned: - 가 들어가지 않게함. -만큼 양수범위를 더 늘려준다.
? not null: 컬럼에 null값을 넣을 수 없다.
? auto_increment: 자동 증분
*/

#* 테이블 만들어보기 - 기본적인 사용법
create table my_product (
    mykey int unsigned not null auto_increment,
    productid text not null ,
    title text,
    opi_price INT,
    discount_price INT,
    discount_percent INT,
    delivery text,
    PRIMARY KEY (mykey)
);

#* 테이블 확인하기
show tables ;

#* 테이블 구조보기
desc my_product;

#* 테이블 삭제하기
drop table if exists myproduct;

# 실습
create database customer_db;
use customer_db;
create table my_table (
    no int unsigned not null auto_increment,
    name char(20) not null,
    age tinyint,
    phone varchar(20),
    email varchar(30) not null,
    address varchar(50),

    primary key (no)
);
drop database if exists customer_db;
desc my_table;

#* 테이블에 컬럼 추가
alter table my_table add column model_type varchar(10) not null;

#* 컬럼 타입 변경
alter table my_table modify column name varchar(20) not null;

#* 컬럼명 변경
alter table my_table change column name model_name varchar(10);

#* 컬럼 삭제
alter table my_table drop column age;

# 실습
create table my_table2 (
    id int unsigned not null PRIMARY KEY auto_increment,
    name varchar(50) not null,
    modelnumber varchar(15) not null,
    series varchar(30) not null
);
desc my_table2;
alter table my_table2 modify name varchar(20) not null;
alter table my_table2 change modelnumber model_num varchar(10) not null;
alter table my_table2 add column model_type varchar(10) not null;
alter table my_table2 drop column series;
desc my_table2;
drop table my_table2;

create table model_info (
    id int unsigned not null auto_increment,
    name varchar(20) not null,
    model_num varchar(10) not null,
    model_type varchar(10) not null,
    primary key (id)
);
show tables;
