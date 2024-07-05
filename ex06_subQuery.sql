show databases;

USE bestproducts;

/*
    * 서브 쿼리 (MySQL SubQuery): SQL문 안에 포함되어 있는 SQL문
    *   - SQL문 안에서 괄호() 를 사용해서, 서브쿼리문을 추가할 수 있음
    *   - 테이블과 테이블간의 검색시, 검색 범위(테이블 중 필요한 부분만 먼저 가져오도록)를 좁히는 기능에 주로 사용

    ? JOIN은 출력 결과에 여러 테이블의 열이 필요한 경우 유용
    ? 대부분의 서브쿼리(Sub Query) 는 JOIN 문으로 처리가 가능
    ? 성능상의 이슈로 많이 사용하지는 않는다.(쿼리를 여러개 실행하는게 되기 때문에...)
*/

# JOIN을 사용하는 경우
SELECT title
FROM items
         JOIN ranking ON items.item_code = ranking.item_code
WHERE sub_category = '여성신발';

# Sub Query 사용하는 경우
SELECT
    title
FROM items
 #WHERE item_code IN (코드1, 코드2, 코드3....); 이런식으로 변하는 것
WHERE item_code IN (
    SELECT # ranking의 sub_category = '여성신발' 인 아이템코드들을 반환
        item_code
    FROM ranking
    WHERE sub_category = '여성신발'
    );

# 할인가 최대인 상품~
SELECT
    MAX(dis_price)
FROM items
WHERE item_code IN (
    SELECT
        item_code
    FROM ranking
    WHERE sub_category = '여성신발'
    );
# JOIN으로 만들면?
SELECT
    MAX(dis_price)
FROM items
JOIN ranking on items.item_code = ranking.item_code
WHERE sub_category = '여성신발';

# 다양한 위치에 서브 쿼리 써보기 - sakila
USE sakila;

DESC film_category;
SELECT * FROM film_category LIMIT 1;
DESC category;
SELECT * FROM category LIMIT 1;
# 비교
SELECT
    category_id,
    COUNT(*) AS film_count
FROM film_category fc
WHERE fc.category_id > (
    SELECT c.category_id FROM category c WHERE c.name = 'Comedy'
    )
GROUP BY fc.category_id;

# FROM절 - 그냥 참고용!
SELECT
a, b, c
FROM
(SELECT * FROM  atoz_table);

USE bestproducts;
#* 메인 카테고리별로 할인 가격이 10만원 이상인 상품이 몇개 있는지 출력하기
##* JOIN
SELECT
    r.main_category AS 메인카테고리,
    COUNT(*) AS 집계
FROM items i
JOIN ranking r ON i.item_code = r.item_code
WHERE i.dis_price >= 100000
GROUP BY 메인카테고리# HAVING 집계 >= 100
ORDER BY 집계 DESC;
##* Sub Query
SELECT
    main_category AS 메인카테고리,
    COUNT(*) AS 집계
FROM ranking r
WHERE r.item_code IN
(SELECT i.item_code FROM items i WHERE dis_price >= 100000)
GROUP BY 메인카테고리
ORDER BY 집계 DESC;

#* items에서 dis_price가 200000 이상인 아이템들 중, 각 sub_category별 아이템 수
##* JOIN
SELECT
    r.sub_category AS 서브카테고리,
    COUNT(*) AS 상품갯수
FROM items i
JOIN ranking r ON i.item_code = r.item_code
WHERE i.dis_price >= 200000
GROUP BY 서브카테고리
ORDER BY 상품갯수 DESC;
##* SUB Query
SELECT
    r.sub_category AS 서브카테고리,
    COUNT(*)
FROM ranking r
WHERE item_code IN (
    SELECT
        i.item_code
    FROM items i
    WHERE i.dis_price >= 200000
    )
GROUP BY 서브카테고리;
