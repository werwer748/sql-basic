show databases;

USE sakila;

/*
    * JOIN? - JOIN은 두 개 이상의 테이블로부터 필요한 데이터를 연결해 하나의 포괄적인 구조로 결합시키는 연산

    ? INNER JOIN: 두 테이블에 해당 필드값이 매칭되는 (두 테이블의 모든 필드로 구성된) 레코드만 가져옴

    ? OUTER JOIN: OUTER JOIN은 조인하는 테이블의 ON 절의 조건 중 한쪽의 데이터를 모두 가져옴
    ?   - LEFT OUTER JOIN: 왼쪽 테이블에서 모든 레코드와 함께, 오른쪽 테이블에 왼쪽 테이블 레코드와 매칭되 는 레코드를 붙여서 가져옴
    ?   - RIGHT OUTER JOIN: 오른쪽 테이블에서 모든 레코드와 함께, 왼쪽 테이블에 왼쪽 테이블 레코드와 매칭되 는 레코드를 붙여서 가져옴
    ?   - INNER JOIN 과는 다르게 어떤 테이블이 어떤 위치에 있는가에 따라 결과가 조금 다름(결측표시를 어디다 두는가...?)
*/

SHOW COLUMNS FROM address;

#* address 테이블에는 address_id 가 있지만, customer 테이블에는 없는 데이터의 갯수 출력하기
SELECT
    COUNT(*)
FROM address a
LEFT JOIN customer c ON a.address_id = c.address_id
WHERE customer_id IS NULL;

SELECT
    COUNT(*)
FROM customer c
RIGHT JOIN address a ON a.address_id = c.address_id
WHERE customer_id IS NULL;

