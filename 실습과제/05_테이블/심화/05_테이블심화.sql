USE tabledb;
DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL(
    uesrID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) NOT NULL ,
    brithyear INT NOT NULL
);

CREATE TABLE buyTBL(
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    userID CHAR(8) NOT NULL ,
    prodName CHAR(6) NOT NULL ,
    FOREIGN KEY (userID) REFERENCES userTBL(userID)
);

DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) NOT NULL ,
    birthyear INT NOT NULL ,
    email CHAR(30) NULL UNIQUE
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) ,
    birthYear INT CHECK ( birthYear >= 1900 AND birthYear <= 2023 ),
    mobile CHAR(3) NOT NULL
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthyear INT NOT NULL DEFAULT -1,
    addr CHAR(2) NOT NULL DEFAULT '서울',
    mobile1 CHAR(3) NULL,
    mobi1e2 CHAR(8) NULL,
    height SMALLINT NULL DEFAULT 170,
    mDate DATE NULL
);

INSERT INTO userTBL VALUES('LHL', '이혜리', default, default,'011', '1234567',
                           default, '2023.12.12');
INSERT INTO userTBL(userID, name) VALUES('KAY', '김아영');
INSERT INTO usertbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');

ALTER TABLE userTBL DROP COLUMN mobile1;
ALTER TABLE userTBL CHANGE COLUMN name uName VARCHAR(20) NULL;
ALTER TABLE userTBL DROP PRIMARY KEY ;

-- 다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요
USE employees;
DROP VIEW IF EXISTS EMPLOYEES_INFO;
CREATE VIEW EMPLOYEES_INFO AS
SELECT
    A.emp_no,
    A.birth_date,
    A.first_name,
    A.last_name,
    A.gender,
    A.hire_date,
    B.title,
    B.from_date AS t_from,
    B.to_date AS t_to,
    C.salary,
    C.from_date AS s_from,
    C.to_date AS s_to
FROM employees A
         JOIN titles B ON A.emp_no = B.emp_no
         JOIN salaries C ON B.emp_no = C.emp_no;

SELECT *
FROM employees_info

-- EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요.
DROP VIEW IF EXISTS EMPLOYEES_INFO;
CREATE VIEW EMPLOYEES_INFO AS
SELECT
    A.emp_no,
    A.birth_date,
    A.first_name,
    A.last_name,
    A.gender,
    A.hire_date,
    B.title,
    B.from_date AS t_from,
    B.to_date AS t_to,
    C.salary,
    C.from_date AS s_from,
    C.to_date AS s_to
FROM employees A
         JOIN titles B ON A.emp_no = B.emp_no
         JOIN salaries C ON B.emp_no = C.emp_no
WHERE C.to_date >= CURRENT_DATE();

SELECT *
FROM employees_info;

-- 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요
DROP VIEW IF EXISTS EMP_DEPT_INFO;
CREATE VIEW EMP_DEPT_INFO AS
SELECT
    A.emp_no,
    B.dept_no,
    C.dept_name,
    B.from_date,
    B.to_date
FROM employees A
         JOIN dept_emp B ON A.emp_no = B.emp_no
         JOIN departments C ON B.dept_no = C.dept_no
ORDER BY A.emp_no;

SELECT *
FROM EMP_DEPT_INFO;

-- EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.
DROP VIEW IF EXISTS EMP_DEPT_INFO;
CREATE VIEW EMP_DEPT_INFO AS
SELECT
    A.emp_no,
    B.dept_no,
    C.dept_name,
    B.from_date,
    B.to_date
FROM employees A
         JOIN dept_emp B ON A.emp_no = B.emp_no
         JOIN departments C ON B.dept_no = C.dept_no
WHERE B.to_date >= CURRENT_DATE()
ORDER BY A.emp_no;

SELECT *
FROM EMP_DEPT_INFO;

