show databases;

USE bestproducts;

/*
    * JOIN? - JOIN은 두 개 이상의 테이블로부터 필요한 데이터를 연결해 하나의 포괄적인 구조로 결합시키는 연산

    ? INNER JOIN: 두 테이블에 해당 필드값이 매칭되는 (두 테이블의 모든 필드로 구성된) 레코드만 가져옴

    ? OUTER JOIN
    ?   - LEFT OUTER JOIN: 왼쪽 테이블에서 모든 레코드와 함께, 오른쪽 테이블에 왼쪽 테이블 레코드와 매칭되 는 레코드를 붙여서 가져옴
    ?   - RIGHT OUTER JOIN: 오른쪽 테이블에서 모든 레코드와 함께, 왼쪽 테이블에 왼쪽 테이블 레코드와 매칭되 는 레코드를 붙여서 가져옴
*/

SELECT
    *
FROM items
INNER JOIN ranking ON ranking.item_code = items.item_code # 여기까지로 하나의 테이블이 되는것
WHERE ranking.main_category = 'ALL'; # JOIN으로 만든 테이블에 조건을 건다.

# 테이블 이름 다음에 한칸 띄고 새로운 이름을 쓰면 그 이름으로 해당 테이블을 가리킬 수 있다.
SELECT
    *
FROM items it
JOIN ranking r on it.item_code = r.item_code
WHERE r.main_category = 'ALL';

#* select에서 사용하기 - 제목만 뽑기
SELECT
    it.title
FROM items it
JOIN ranking r on it.item_code = r.item_code
WHERE r.main_category = 'ALL';

#* 카테고리 확인해보기 - DISTINCT
SELECT DISTINCT main_category FROM ranking;

#* 전체 베스트상품(ALL 메인 카테고리)에서 판매자별 베스트상품 갯수 출력하기
SELECT
    provider AS `판매자`,
    COUNT(*) AS `집계`
FROM items i
JOIN ranking r ON i.item_code = r.item_code
WHERE r.main_category = 'ALL'
GROUP BY `판매자`
ORDER BY `집계` DESC, `판매자`;

SELECT * FROM ranking WHERE main_category LIKE '%패션%';

#* 메인 카테고리가 패션의류인 서브 카테고리 포함, 패션의류 전체 베스트 상품에서 판매자별 베스트 상품 갯수가 5 이상인 판매자와 베스트 상품 갯수 출력하기
SELECT
    i.provider AS 판매자,
    COUNT(*) AS 상품_갯수
FROM items i
JOIN ranking r ON i.item_code = r.item_code
WHERE r.main_category = '패션의류'
GROUP BY 판매자 HAVING 상품_갯수 >= 5;

#* 메인 카테고리가 신발/잡화인 서브 카테고리 포함, 전체 베스트상품에서 판매자별 베스트상품 갯 수가 10이상인 판매자와 베스트상품 갯수를 베스트상품 갯수 순으로 출력해보기
SELECT
    i.provider AS 판매자,
    COUNT(*) AS 상품_갯수
FROM items i
JOIN ranking r ON i.item_code = r.item_code
WHERE r.main_category = '신발/잡화'
GROUP BY 판매자 HAVING 상품_갯수 >= 10
ORDER BY 상품_갯수 DESC;

#* 메인 카테고리가 화장품/헤어인 서브 카테고리 포함, 전체 베스트상품의 평균, 최대, 최소 할인 가격 출력해보기
SELECT
    AVG(i.dis_price) AS 할인가평균,
    MAX(i.dis_price) AS 할인가최대,
    MIN(i.dis_price) AS 할인가최소
FROM ranking r
JOIN items i ON r.item_code = i.item_code
WHERE r.main_category = '화장품/헤어';
