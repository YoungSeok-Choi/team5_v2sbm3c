CREATE TABLE admin(
    adminno         NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                   VARCHAR2(20)     NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.id is '아이디';

DROP SEQUENCE admin_seq;

CREATE SEQUENCE admin_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 9999999999
  CACHE 2
  NOCYCLE;

INSERT INTO admin(adminno, id)
VALUES(admin_seq.nextval, 'admin1');

INSERT INTO admin(adminno, id)
VALUES(admin_seq.nextval, 'admin2');

INSERT INTO admin(adminno, id)
VALUES(admin_seq.nextval, 'admin3');

-- 조회
SELECT adminno, id FROM admin ORDER BY adminno ASC;

-- 수정
UPDATE admin
SET id='admin11'
WHERE adminno=1;

-- 삭제
DELETE FROM admin
WHERE memberno=1;