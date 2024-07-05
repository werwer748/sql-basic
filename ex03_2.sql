show databases;

use sakila;

#? 문제가 복잡할수록 단계별로 접근하자!

#* 합계, 평균, 컬럼내 최대값, 컬럼내 최솟값 구하기
SELECT
    SUM(amount) `합계`,
    AVG(amount) `평균`,
    MAX(amount) `최대`,
    MIN(amount) `최소`
FROM payment;

#* 영화 렌탈 테이블(rental) 에서 inventory_id 가 367 이고, staff_id가 1인 로우(Row) 전체 출력하기
SELECT * FROM rental
         WHERE inventory_id = 367 AND staff_id = 1;
#          WHERE inventory_id = 367 OR staff_id = 1;

