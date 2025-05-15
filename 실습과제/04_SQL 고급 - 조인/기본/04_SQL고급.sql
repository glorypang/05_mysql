USE sqldb;
-- sqldb 데이터베이스에서 다음 조건을 처리하세요.
SELECT *
FROM buytbl
WHERE prodName is not null
ORDER BY userID;

-- 앞의 결과에서 userID가 'JYP'인 데이터만 출력하세요.
SELECT *
FROM buytbl
WHERE prodName is not null AND userID = 'JYP';

-- sqldb 데이터베이스에서 다음 조건을 처리하세요.

SELECT A.userID, B.name, A.prodName, B.addr, CONCAT(B.mobile1, B.mobile2)
FROM buytbl A
         JOIN usertbl B ON A.userID = B.userID

ORDER BY A.userID;

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요.
SELECT *
FROM usertbl
WHERE mobile2 is not null and mobile1 is not null;


-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력하세요.
SELECT *
FROM usertbl
WHERE mobile2 is null and mobile1 is null;






