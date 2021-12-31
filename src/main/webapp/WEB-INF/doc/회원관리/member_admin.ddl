/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno NUMERIC(10) NOT NULL PRIMARY KEY,
		id VARCHAR(20) NOT NULL,
		passwd VARCHAR(50) NOT NULL,
		name VARCHAR(30) NOT NULL,
		phone VARCHAR(20) NOT NULL,
		email VARCHAR(80) NOT NULL,
		address VARCHAR(150),
		grade NUMERIC(3) NOT NULL
);

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno NUMERIC(10) NOT NULL PRIMARY KEY,
		id VARCHAR(20) NOT NULL
);

