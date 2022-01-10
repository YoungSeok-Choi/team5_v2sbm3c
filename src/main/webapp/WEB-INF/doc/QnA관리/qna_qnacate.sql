/**********************************/
/* Table Name: 질문 카테고리 */
/**********************************/
CREATE TABLE qna_cate(
		qcateno                       		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(20)		 NOT NULL,
		adminno                       		NUMERIC(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE qna_cate is '질문 카테고리';
COMMENT ON COLUMN qna_cate.qcateno is '질문카테고리번호';
COMMENT ON COLUMN qna_cate.name is '카테고리이름';
COMMENT ON COLUMN qna_cate.adminno is '관리자 번호';


DROP SEQUENCE qna_cate_seq;
CREATE SEQUENCE qna_cate_seq
  START WITH 1             
  INCREMENT BY 1         
  MAXVALUE 9999999999 
  CACHE 2                     
  NOCYCLE; 


 -- forign key 해결되는대로 추가 insert
insert into qna_cate(qcateno, name, adminid) values(qna_cate_seq.nextval, '상품', 1);
insert into qna_cate(qcateno, name, adminid) values(qna_cate_seq.nextval, '기타', 1);
insert into qna_cate(qcateno, name, adminid) values(qna_cate_seq.nextval, '이용방법', 1);
insert into qna_cate(qcateno, name, adminid) values(qna_cate_seq.nextval, '삭제컬럼', 1);



select * from qna_cate;

select name from qna_cate ;

select qcateno, name, adminid
from qna_cate

update qna_cate
set name='사용방법'
where name='기타' and adminid=1;

delete from qna_cate
where qcateno=5;

delete from qna_cate;



/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE qna(
		qnano                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(30)		 NOT NULL,
		secret                        		CHAR(1)		 DEFAULT N		 NOT NULL,
		text                          		VARCHAR2(500)		 NOT NULL,
		qdate                         		DATE		 NOT NULL,
		memberno                      		NUMERIC(10)		 NULL ,
		qcateno                       		INTEGER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (qcateno) REFERENCES qna_cate (qcateno)
);

COMMENT ON TABLE qna is '질문';
COMMENT ON COLUMN qna.qnano is '질문번호';
COMMENT ON COLUMN qna.title is '제목';
COMMENT ON COLUMN qna.secret is '비밀글 여부';
COMMENT ON COLUMN qna.text is '본문';
COMMENT ON COLUMN qna.qdate is '질문생성일';
COMMENT ON COLUMN qna.memberno is '회원번호';
COMMENT ON COLUMN qna.qcateno is '질문카테고리번호';

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1             
  INCREMENT BY 1         
  MAXVALUE 9999999999 
  CACHE 2                     
  NOCYCLE; 

-- 삽입 이전에 부모키(카테고리) 에 해당하는 qcateno가 있어야 합니다. 

insert into qna(qnano, title, secret, text, qdate, qcateno, memberid)
values(qna_seq.nextval, '제 이름이 뭐죠?', 'N', '하룻밤 자고 일어났더니 기억이...', sysdate, 6, 7);
insert into qna(qnano, title, secret, text, qdate, qcateno, memberid)
values(qna_seq.nextval, '배가고파요 ', 'N', '밥을주세요', sysdate, 7, 7);
insert into qna(qnano, title, secret, text, qdate, qcateno, memberid)
values(qna_seq.nextval, '이 집 가격이 얼마죠?', 'N', '오천원이면 사나요?', sysdate, 8, 7);
insert into qna(qnano, title, secret, text, qdate, qcateno, memberid)
values(qna_seq.nextval, '저는 곧 삭제됩니다', 'N', '안녕하계세요', sysdate, 5, 7);

-- qcateno 가 없는(null) 삽입 예시
insert into qna(qnano, title, secret, text, qdate, memberid)
values(qna_seq.nextval, '제 이름이 뭐죠?', 'N', '하룻밤 자고 일어났더니 기억이...', sysdate, 7);


select * from qna;

select qnano, title, secret, text, qdate, memberid 
from qna
where memberid=7;

commit;

update qna
set title='삭제되기전 업데이트', text='업데이트 테스트', secret='Y'
where qnano = 6;

delete from qna
where qcateno=5;



