show databases;

/*
    * FOREIGN KEY? - 외래키(일종의 제약사항), 데이터의 정합성, 신뢰성이 올라간다.
*/

DROP DATABASE IF EXISTS sqlDB;
USE sqlDB;
DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl (
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) UNIQUE NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDate  DATE,
    UNIQUE INDEX idx_userTbl_name (name),
    INDEX idx_userTbl_addr (addr)
);
DROP TABLE IF EXISTS buyTbl;
CREATE TABLE buyTbl (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(4),
    groupName CHAR(4),
    price  INT NOT NULL,
    amount  SMALLINT NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTbl(userID)
);


INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO buyTbl (userID, prodName, groupName, price, amount) VALUES('LSG', '운동화', '의류', 30, 2);

#! Cannot add or update a child row: a foreign key constraint fails (`sqldb`.`buytbl`, CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`))
INSERT INTO buyTbl (userID, prodName, groupName, price, amount) VALUES('STJ', '운동화', '의류', 30, 2);
/*
    위 예제는 에러가 나면 정상 => userTbl에 userID가 STJ인 데이터가 없기 때문에 발생하는 에러
        - FOREIGN KEY (userID) REFERENCES userTbl(userID)
        - buyTbl 테이블의 userID 컬럼은 userTbl 테이블의 userID를 참조할 때, userTbl 테이블에 userID가 STJ인 데 이터가 없으면, 입력이 안됨
        - 데이터 무결성 (두 테이블간 관계에 있어서, 데이터의 정확성을 보장하는 제약 조건을 넣는 것임)
        - 현업에서는 꼭 필요한 경우만 사용하는 경우가 많음 (비즈니스 로직이 다양하기 때문에, 제약을 걸어놓을 경우, 예 외적인 비즈니스 로직 처리가 어렵기 때문)
*/

# 유저 데이터가 존재하기 떄문에 데이터가 등록됨.
INSERT INTO buyTbl (userID, prodName, groupName, price, amount) VALUES ('LSG', '운동화', '의류', 30, 2);

INSERT INTO userTbl VALUES('STJ', '서태지', 1975, '경기', '011', '00000000', 171, '2014-4-4');
INSERT INTO buyTbl (userID, prodName, groupName, price, amount) VALUES('STJ', '운동화', '의류', 30, 2);

#!  Cannot delete or update a parent row: a foreign key constraint fails (`sqldb`.`buytbl`, CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`))
DELETE FROM userTbl WHERE userID = 'STJ';
# 에러가 나면 정상 - buyTbl에 해당 userID를 참조하고있는 데이터가 존재하기 떄문에...

# 삭제하려한다면 순차적으로!
DELETE FROM buyTbl WHERE userID = 'STJ';
DELETE FROM userTbl WHERE userID = 'STJ';

SELECT * FROM buyTbl;
SELECT * FROM userTbl;