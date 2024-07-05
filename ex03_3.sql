show databases;

use sakila;

/*
    * GROUP BY? - 특정 컬럼값을 기반으로 그룹핑하기

    ? SELECT rating FROM film GROUP BY rating
    ? film 테이블의 rating 값을 그룹핑해라, 즉 rating 값별로 출력하므로, rating 값 종류를 확인할 수 있음

    ? SELECT COUNT(*) FROM film GROUP BY rating
    ? 각 rating 값 종류별로, 몇 개의 데이터가 있는지를 확 인

    ? SELECT COUNT(*) FROM film WHERE 조건문 GROUP BY rating
    ? 특정 조건에 맞는 데이터 중 rating 값 종류별로, 몇 개의 데이터가 있는지를 확인
*/

DESC film;
#* film 테이블에 등급 종류를 모두 출력
SELECT rating
FROM film
GROUP BY rating;
#* film 종류에 따른 영화 갯수 출력
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;
#* 등급이 PG, G인 데이터를 등급별로 갯수 출력
SELECT rating, COUNT(rating)
FROM film
# WHERE rating IN ('PG', 'G')
WHERE rating = 'PG' OR rating = 'G'
GROUP BY rating;
#* 등급이 G인 영화 제목 출력
SELECT
    title
#     (SELECT COUNT(*) from film WHERE rating = 'G')
FROM film f
WHERE rating = 'G';
#* 등급이 PG 또는 G인 영화 제목 출력
SELECT title, rating
FROM film
# WHERE rating IN ('PG', 'G');
WHERE rating ='PG' OR rating = 'G';
#* release 연도가 2006 또는 2007이고, 등급이 PG 또는 G 등급인 영화 제목
SELECT title,
       rating,
       release_year
FROM film
WHERE
#     rating IN ('PG', 'G')
    (rating ='PG' OR rating = 'G')
#     AND release_year BETWEEN '2006' AND '2007';
    AND (release_year = '2006' OR release_year = '2007');

#* film에서 rating (등급)으로 그룹을 묶어서, 각 등급별 영화 갯수와 rating (등급), 각 그룹별 평균 rental_rate (렌탈 비용) 출력하세요
SELECT
    rating as `등급`,
    COUNT(*) `카운팅`,
    AVG(rental_rate) `평균`
FROM film
GROUP BY `등급`;