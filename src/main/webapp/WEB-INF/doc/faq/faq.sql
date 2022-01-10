/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminid                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminid is '관리자번호';


/**********************************/
/* Table Name: 자주묻는질문(FAQ) */
/**********************************/
CREATE TABLE faq(
		faqno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(50)		 NOT NULL,
		text                          		VARCHAR2(500)		 NOT NULL,
		cdate                         		DATE		 NOT NULL,
		adminid                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminid) REFERENCES admin (adminid)
);

COMMENT ON TABLE faq is '자주묻는질문(FAQ)';
COMMENT ON COLUMN faq.faqno is 'FAQ번호';
COMMENT ON COLUMN faq.title is 'FAQ제목';
COMMENT ON COLUMN faq.text is 'FAQ본문';
COMMENT ON COLUMN faq.Cdate is '생성일자';
COMMENT ON COLUMN faq.adminid is '관리자번호';


