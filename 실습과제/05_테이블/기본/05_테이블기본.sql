DROP DATABASE tabledb;
CREATE DATABASE tabledb;
USE tabledb;

CREATE TABLE usertbl(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile1 CHAR(3) NULL,
    mobile2 CHAR(8) NULL,
    height SMALLINT NULL,
    mDate DATE NULL
);

CREATE TABLE buytbl(
    num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4) NULL,
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY(userid) REFERENCES  usertbl(userID)
);

INSERT INTO usertbl VALUE ('LSG', '이승기',1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUE ('KBS', '김범수',1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUE ('KKH', '김경호',1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- userid 컬럼이 참조하는 usertbl테이블의 userID 컬럼에 'JYP'가 없음
# INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

DROP TABLE IF EXISTS buytbl;
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL ,
    birthyear INT NOT NULL
);

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl(
    prodCode CHAR(3) NOT NULL,
    prodID char(4) NOT NULL,
    prodDate DATE NOT NULL ,
    proCur CHAR(10) NULL,
    CONSTRAINT pk_prodtbl_prodCode_prodID PRIMARY KEY (prodCode, prodID)
);

USE sqldb;
CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
JOIN buytbl b on U.userID = b.userid;

SELECT * FROM v_userbuytbl WHERE name = '김범수';
