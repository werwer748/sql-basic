# ecommerce - 실 데이타 기반 DB 만들어보기
create database ecommerce;
use ecommerce;

show databases;

create table product(
    product_code varchar(20) not null,
    title varchar(200) not null,
    ori_price int,
    discount_price int,
    discount_percent int,
    delivery varchar(2),
    primary key (product_code)
);

desc product;

create table ranking(
    id int unsigned not null auto_increment,
    category varchar(50),
    subcategory varchar(50),
    ranking int not null,
    product_code varchar(20) not null,
    primary key (id)
);
desc ranking;

insert into product values ('215673140', '스위트바니~~', 23000, 6900, 70, 'F');
select * from product;

insert into ranking values (default, '패션의류', 'ALL', 1, '215673140');
insert into ranking values (default, '패션의류', '여성의류', 1, '215673140');
select * from ranking;