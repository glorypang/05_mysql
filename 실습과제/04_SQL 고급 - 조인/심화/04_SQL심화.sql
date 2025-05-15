-- 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/ 동아리방을 출력하세요.
use sqldb;

select B.stdName, B.addr, A.clubName, C.roomNo
from stdclubtbl A
    join stdtbl B on A.stdName = B.stdName
join clubtbl C on A.clubName = C.clubName;

-- 동아리를 기준으로 가입한 학생의 목록을 출력하세요
select  A.clubName,C.roomNo,B.stdName, B.addr
from stdclubtbl A
         join stdtbl B on A.stdName = B.stdName
         join clubtbl C on A.clubName = C.clubName
ORDER BY C.clubName, B.stdName;

-- 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.
select  B.emp, B.manager, A.empTel
from emptbl A join emptbl B on A.emp = B.manager
WHERE B.emp = '우대리';

-- 현재 재직 중인 직원의 정보를 출력하세요
use employees;
select A.emp_no, A.first_name, A.last_name, B.title
from employees A join titles B on A.emp_no = B.emp_no
WHERE B.to_date > current_date