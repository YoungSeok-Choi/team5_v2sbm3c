package dev.mvc.notice;

/*
CREATE TABLE notice(
  noticeno            NUMERIC(10)   NOT NULL    PRIMARY KEY,
  memberid        NUMERIC(30)   NOT NULL,
  adminid            NUMERIC(10)   NOT NULL,
  noticetitle         VARCHAR(50)   NOT NULL,
  noticecontent       VARCHAR(225)   NOT NULL, 
  rdate               DATE   NOT NULL,
    FOREIGN KEY (memberid) REFERENCES member (memberid),
    FOREIGN KEY (adminid) REFERENCES admin (adminid)
);
 */
public class noticeVO {
	  /** 공지사항 번호 */
	  private int noticeno;  
	  /** 회원 번호 */
	  private int memberid;
	  /** 관리자 번호 */
	  private int adminid;
	  /** 공지사항 제목 */
	  private String noticetitle;
	  /** 공지사항 내용 */
	  private String noticecontent;
	  /** 날짜*/
	  private String rdate;
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	  
	  
}
