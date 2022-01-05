/**********************************/
/* Table Name: admin */
/**********************************/
CREATE TABLE TABLE_2(
		adminid                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE TABLE_2 is 'admin';
COMMENT ON COLUMN TABLE_2.adminid is '관리자번호';


/**********************************/
/* Table Name: 자주묻는질문(FAQ) */
/**********************************/
CREATE TABLE faq(
		faqno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(50)		 NOT NULL,
		text                          		VARCHAR2(500)		 NOT NULL,
		Cdate                         		DATE		 NOT NULL,
		adminid                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminid) REFERENCES TABLE_2 (adminid)
);

COMMENT ON TABLE faq is '자주묻는질문(FAQ)';
COMMENT ON COLUMN faq.faqno is 'FAQ번호';
COMMENT ON COLUMN faq.title is 'FAQ제목';
COMMENT ON COLUMN faq.text is 'FAQ본문';
COMMENT ON COLUMN faq.Cdate is '생성일자';
COMMENT ON COLUMN faq.adminid is '관리자번호';


