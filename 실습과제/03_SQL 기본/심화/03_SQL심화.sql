 -- 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요
USE sqldb;
SELECT userID as "사용자 아이디",
       sum(amount) as "총 구매 개수"
FROM buytbl
GROUP BY userID;

SELECT userID as "사용자 아이디",
       sum(amount * price) as "총 구매 개수"
FROM buytbl
GROUP BY userID;

-- 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.
SELECT userID,
    avg(amount) as "평균 구매 개수"
FROM buytbl
GROUP BY userID;

-- 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
SELECT name, height
FROM usertbl
WHERE height = (select max(height) from  usertbl) OR
      height = (select min(height) from usertbl) ;

-- 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요.
SELECT COUNT(*) AS `휴대폰이 있는 사용자`
FROM usertbl
WHERE mobile2 IS NOT NULL;

-- 사용자별 총 구매액을 출력하세요.
SELECT userID as 사용자, sum(price*amount) as 총구매액
FROM buytbl
GROUP BY userID;

-- 총 구매액이 1,000이상인 사용자만 출력하세요.
SELECT userID as 사용자, sum(price*amount) as 총구매액
FROM buytbl
GROUP BY userID
HAVING sum(price*amount) >= 1000;

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.
USE world;
SELECT sum(Population)
FROM city
WHERE CountryCode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오. 단 결과를 나타내는 테이블의 필드는 "최소값"으로 표시하시오.
 SELECT min(Population) as "최솟값"
 FROM city
 WHERE CountryCode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오.
 SELECT avg(Population)
 FROM city
 WHERE CountryCode = 'KOR'
 GROUP BY CountryCode

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오. 단 결과를 나타내는 테이블의 필드는 "최대값"으로 표시하시오.
 SELECT max(Population) as "최댓값"
 FROM city
 WHERE CountryCode = 'KOR';

-- country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.
 SELECT length(name)
 FROM country

-- country테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.
 SELECT CONCAT(UPPER(substring(name, 1,3)), substring(name, 4,length((name))))
 FROM country;

-- country테이블의 기대수명(LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오.
SELECT  ROUND(LifeExpectancy,1)
FROM country;

-- 모든 문제는 employees 데이터베이스에서 수행한다.
use employees;

-- employees db에서 각 부서별 관리자를 출력하세요. 단, 현재직자만 출력한다.
SELECT *
from dept_manager
WHERE to_date >= CURRENT_DATE;

-- 부서번호 d005 부서의 핸재 관리자 정보를 출력하세요.
 SELECT *
 from dept_manager
 WHERE dept_no = 'd005' AND to_date >= CURRENT_DATE;

-- employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다. 다음 조건하에서 8번 페이지의 데이터를 출력하세요.
SELECT *
FROM employees
order by hire_date desc
LIMIT 20 offset 140;

-- employees db에서 재직자의 총 수를 구하시오
SELECT count(*)
FROM dept_emp
WHERE to_date > current_date;

-- employees db에서 재직자의 평균 급여를 출력하시오.
 SELECT emp_no,avg(salary)
 FROM salaries
 group by emp_no;

-- 재직자 전체 평균 급여 보다 급여를 더 많이 받는 재직자를 출력하세요.
 SELECT emp_no
 FROM salaries
 WHERE  salary > ( SELECT avg(salary)
                   FROM salaries)
group by emp_no;

-- employees db에서 각 부서별 재직자의 수를 구하시오
 SELECT dept_no, count(*)
 FROM dept_emp
 group by dept_no
 order by dept_no;
