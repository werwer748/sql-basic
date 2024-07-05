show databases;

use sakila;
show tables;

#* 상위 10개 데이터 가져오기
select * from film limit 10;
#* 결과의 수를 세어보기
select count(*) from film;

#* 특정 컬럼 종복값 제거해서 데이터 확인 - 종류 파악시 많이 쓰임
#! select distinct rating from film; - 대문자로 쓰는 습관 들이기!!
SELECT DISTINCT rating FROM film;
#* 등급별로 그룹화하고 갯수체크
SELECT
    rating AS `등급`,
    count(*) AS`카운팅`
FROM film fl
GROUP BY rating;

#* release_year 종류 알아내기
SELECT DISTINCT release_year FROM film;
#* rental 테이블에서 상위데이터 10개 가져오기
SELECT * FROM rental LIMIT 10;
#* rental 테이블에서 inventory_id가 367인 데이터 출력
SELECT * FROM rental WHERE inventory_id = 367;
#* customer 테이블에서 customer 수 알아내기
SELECT COUNT(*) FROM customer;

SHOW CREATE TABLE rental;
