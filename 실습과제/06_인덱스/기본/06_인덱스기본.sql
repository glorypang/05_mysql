USE sqldb;
-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl1을 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl1(
    a INT PRIMARY KEY ,
    b INT,
    C INT
);

SHOW INDEX FROM tbl1;

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl2를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl2(
    a INT PRIMARY KEY ,
    b INT UNIQUE ,
    c INT UNIQUE ,
    d INT
);

SHOW INDEX FROM tbl2;

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl3를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl3 (
    a INT UNIQUE,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);
SHOW INDEX FROM tbl3;

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl4를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl4 (
    a INT UNIQUE NOT NULL,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT
);
SHOW INDEX FROM tbl4;

-- sqldb 데이터베이스에 다음과 같은 컬럼을 가지는 테이블 tbl5를 생성하고, 자동 생성된 인덱스 목록을 확인하세요.
CREATE TABLE tbl5 (
    a INT UNIQUE NOT NULL,
    b INT UNIQUE,
    c INT UNIQUE,
    d INT PRIMARY KEY
);
SHOW INDEX FROM tbl5;

-- testdb에 다음 컬럼 목록을 가지는 usertbl을 만드세요.
CREATE DATABASE testdb;
USE testdb;

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr NCHAR(2) NOT NULL
);

INSERT INTO usertbl VALUES ('LSG', '이승기', 1987,'서울');
INSERT INTO usertbl VALUES ('KBS', '김범수', 1979,'경남');
INSERT INTO usertbl VALUES ('KKH', '김경호', 1971,'전남');
INSERT INTO usertbl VALUES ('JYP', '조용필', 1950,'경기');
INSERT INTO usertbl VALUES ('SSK', '성시경', 1979,'서울');

ALTER TABLE usertbl DROP PRIMARY KEY ;
ALTER TABLE usertbl ADD CONSTRAINT pk_name PRIMARY KEY(userID);
SELECT  * FROM usertbl;
SHOW INDEX FROM usertbl;