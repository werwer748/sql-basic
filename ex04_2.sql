show databases;

USE bestproducts;

/*
    * GROUP BY와 HAVING
    ** HAVING절은 집계함수를 가지고 조건비교를 할 때 사용한다.
    ** HAVING절은 GROUP BY절과 함께 사용
    ? SELECT provider FROM items GROUP BY provider HAVING COUNT(*) >= 100;
*/
SELECT provider FROM items GROUP BY provider;

SELECT
    provider, COUNT(*) as 집계
FROM items
WHERE COUNT(*) >= 100 # 집계함수는 WHERE절에서 사용 불가
GROUP BY provider;

SELECT
    provider, COUNT(*) as 집계
FROM items
WHERE
    provider != '스마일배송'
    AND provider != ''
GROUP BY provider HAVING 집계 >= 100
ORDER BY 집계 DESC
LIMIT 10;
