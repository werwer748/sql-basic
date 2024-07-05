show databases;

use sakila;

/*
    * ORDER BY? - 특정 컬럼값을 기준으로 데이터 정렬하기

    ? SELECT * FROM film ORDER BY rating DESC
    ? rating 값을 기준으로 내림차순으로 정렬해서 데이 터를 가져와라

    ? SELECT * FROM film ORDER BY rating ASC
    ? rating 값을 기준으로 올림차순으로 정렬해서 데이터 를 가져와라

    ? SELECT * FROM film WHERE 조건문 ORDER BY rating ASC
    ? 특정 조건에 맞는 데이터를 rating 값 을 기준으로 올림차순으로 정렬해서 데이터를 가져와라

    ? SELECT COUNT(*) FROM film WHERE 조건문 GROUP BY 컬럼 ORDER BY COUNT(*) ASC
    ? 특정 조건에 맞는 데이터를 특정 컬럼값을 기준으로 그룹핑하되, rating 값을 기준으로 올림차순으로 정렬해서 데이터를 가져와라

    * SQL 조건 순서
    * SELECT 컬럼
    * FROM 테이블명
    * WHERE 조건
    * GROUP BY 컬럼
    * ORDER BY 컬럼
    * LIMIT
*/

/*
    * film테이블에서 rating (등급)으로 그룹을 묶어서,
    * 각 등급별 영화 갯수와 각 등급별 평균 렌탈 비용 출력하기,
    * 단 평균 렌 탈비용이 높은 순으로 출력하기 (등급과 각 등급별 갯수, 각 등급별 평균 렌탈 비용 출력하기)
*/
SELECT
    rating,
    COUNT(*),
    AVG(rental_rate)
FROM film
GROUP BY rating
ORDER BY AVG(rental_rate) DESC;

/*
    * AS? - 표시할 컬럼명도 다르게 하기

    ? SELECT COUNT(*) AS total FROM film
    ? film의 전체 데이터 갯수를 COUNT(*) 로 표시하지 말고, total 로 표시하기
*/

/*
    * film테이블에서 rating (등급)으로 그룹을 묶어서, 각 등급별 영화 갯수와 rating (등급), 각 그룹별 평균 rental_rate (렌 탈 비용) 출력하되,
    * 영화 갯수와 평균 렌탈 비용은 각각 total_films, avg_rental_rate 으로 출력하고,
    * avg_rental_rate 이 높은 순으로 출력하시오
*/
SELECT
    rating,
#     COUNT(*) AS total_films,
    COUNT(*) total_films, #? AS 안써도 되긴한데 명시적으로 써주면 보기 편할듯
#     AVG(rental_rate) AS avg_rental_rate
    AVG(rental_rate) avg_rental_rate
FROM film
GROUP BY rating
ORDER BY avg_rental_rate DESC;

#* 각 등급별 영화 길이가 130분 이상인 영화의 갯수와 등급을 출력해보세요
SELECT
    rating AS 등급,
    COUNT(*) AS 편수
FROM film
WHERE length >= 130
GROUP BY 등급
ORDER BY 편수 DESC;
