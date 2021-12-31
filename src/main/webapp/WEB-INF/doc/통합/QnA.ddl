/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberid NUMERIC(10) DEFAULT 1 NOT NULL IDENTITY PRIMARY KEY,
		id VARCHAR(20) NOT NULL,
		passwd VARCHAR(50) NOT NULL,
		name VARCHAR(30) NOT NULL,
		phone VARCHAR(20) NOT NULL,
		email VARCHAR(80) NOT NULL,
		address VARCHAR(150) NOT NULL,
		grade NUMERIC(3) NOT NULL,
		hdate DATE NOT NULL,
		houseno NUMERIC(10)
);

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE Admin(
		adminid NUMERIC(10) DEFAULT 1 NOT NULL IDENTITY PRIMARY KEY,
		id VARCHAR(20) NOT NULL,
		hdate DATE NOT NULL,
		houseno NUMERIC(10)
);

/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE group(
		groupno NUMERIC(10) NOT NULL PRIMARY KEY,
		grpname VARCHAR(50) NOT NULL,
		goryno NUMERIC(10)
);

/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		noticeno NUMERIC(10) NOT NULL PRIMARY KEY,
		memberid NUMERIC(30) NOT NULL,
		adminid NUMERIC(10) NOT NULL,
  FOREIGN KEY (memberid) REFERENCES member (memberid),
  FOREIGN KEY (adminid) REFERENCES Admin (adminid)
);

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE gory(
		goryno NUMERIC(10) NOT NULL PRIMARY KEY,
		groupno NUMERIC(10) NOT NULL,
		name VARCHAR(30) NOT NULL,
		houseno NUMERIC(10),
		notice VARCHAR(100) NOT NULL,
		location VARCHAR(50) NOT NULL,
		noticeno NUMERIC(10),
  FOREIGN KEY (groupno) REFERENCES group (groupno),
  FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
);

/**********************************/
/* Table Name: 주택정보 */
/**********************************/
CREATE TABLE house(
		houseno NUMERIC(10) NOT NULL PRIMARY KEY,
		nomination VARCHAR(30) NOT NULL,
		area INTEGER NOT NULL,
		terrain VARCHAR(30),
		price INT NOT NULL,
		hdate DATE NOT NULL,
		likes INT NOT NULL,
		goryno NUMERIC(10) NOT NULL,
		himage VARCHAR(100) NOT NULL,
		loca VARCHAR(100) NOT NULL,
		adminid NUMERIC(10) NOT NULL,
		hname VARCHAR(100) NOT NULL,
  FOREIGN KEY (goryno) REFERENCES gory (goryno),
  FOREIGN KEY (adminid) REFERENCES Admin (adminid)
);

/**********************************/
/* Table Name: 질문 카테고리 */
/**********************************/
CREATE TABLE Qna_cate(
		qnano NUMERIC(10) DEFAULT 1 NOT NULL IDENTITY PRIMARY KEY,
		name VARCHAR(20) NOT NULL,
		memberid NUMERIC(10),
		adminid NUMERIC(10),
		houseno NUMERIC(10),
  FOREIGN KEY (memberid) REFERENCES member (memberid),
  FOREIGN KEY (adminid) REFERENCES Admin (adminid),
  FOREIGN KEY (houseno) REFERENCES house (houseno)
);

/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE QnA(
		qnaid NUMERIC(10) DEFAULT 1 NOT NULL IDENTITY PRIMARY KEY,
		title VARCHAR(30) NOT NULL,
		secret CHAR(1) DEFAULT N NOT NULL,
		text VARCHAR(500) NOT NULL,
		qdate DATE NOT NULL,
		qnano NUMERIC(10) NOT NULL,
  FOREIGN KEY (qnano) REFERENCES Qna_cate (qnano)
);

/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE answer(
		answerno NUMERIC(10) NOT NULL PRIMARY KEY,
		qnaid NUMERIC(10) NOT NULL,
		adminid NUMERIC(10) NOT NULL,
  FOREIGN KEY (qnaid) REFERENCES QnA (qnaid),
  FOREIGN KEY (adminid) REFERENCES Admin (adminid)
);

/**********************************/
/* Table Name: 추천 */
/**********************************/
CREATE TABLE reco(
		recono NUMERIC(10) NOT NULL PRIMARY KEY,
		memberid NUMERIC(10) NOT NULL,
		houseno NUMERIC(10) NOT NULL,
  FOREIGN KEY (houseno) REFERENCES house (houseno),
  FOREIGN KEY (memberid) REFERENCES member (memberid)
);

