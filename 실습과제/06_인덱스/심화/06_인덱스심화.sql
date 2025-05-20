-- sqldb에서 usertbl 테이블에서 다음 내용들을 확인하세요
-- 1. usertbl의 내용 확인
select * from usertbl;
-- 2. usertbl의 인덱스 목록 확인
show index from usertbl;
-- 3. usertbl의 데이터 크기와 인덱스의 크기 확인
show table status like 'usertbl';

-- usertbl의 addr 컬럼에 대해 idx_usertbl_addr이름으로 인덱스를 만들고,인덱스 목록을 확인하세요.
create index idx_usertbl_addr on usertbl(addr);
show index from usertbl;

-- usertbl의 상태를 출력하여 인덱스의 내용이 만들어졌는지 확인하고, 내용이 없다면 실제 적용되도록 한 후, 인덱스의 크기를 확인하세요.
show table status like 'usertbl';
analyze table usertbl;
show table status like 'usertbl';

-- usertbl에 대해 다음을 처리하세요.
-- 1. birthYear 컬럼에 대해 idx_usertbl_birthYear 이름의 인덱스를 만드세요 (에러가 난다면 그 이유를 설명하세요)
create index idx_usertbl_birthYear on usertbl(birthYear);
-- 2. name 컬럼에 대해 idx_uesrtbl_nam 이름의 인덱스를 만드세요
create index idx_uesrtbl_nam on usertbl(name);
-- 3. 생성된 인덱스의 목록을 확인하세요
show index from usertbl;

-- usertbl에 대해 다음을 처리하세요
-- 1. name 컬럼에 대한 보조 인덱스를 삭제하세요
drop index idx_uesrtbl_nam on usertbl;
-- 2. name과 birthYear 컬럼 조합으로 idx_usertbl_name_birthYear 이름의 인덱스를 생성하세요.
create unique index idx_usertbl_name_birthYear on usertbl(name,birthYear);
-- 3. 인덱스의 목록을 확인하세요
show index from usertbl;

-- usertbl에서 앞에서 만든 인덱스를 삭제하세요.
drop index idx_usertbl_name_birthYear on usertbl;
drop index idx_usertbl_birthYear on usertbl;

-- 다음과 같이 실습 데이터베이스 및 사용자를 생성하고, 해당 데이터베이스에 대해 모든 권한을 부여하세요.
DROP DATABASE  scoula_db;
CREATE DATABASE scoula_db;

DROP USER IF EXISTS 'scoula'@'%';
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%';
FLUSH PRIVILEGES;
