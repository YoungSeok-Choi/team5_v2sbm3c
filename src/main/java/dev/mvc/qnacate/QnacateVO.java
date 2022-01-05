package dev.mvc.qnacate;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class QnacateVO {
    
    private int qcateno;
    private String name = ""; // for avoiding NPE
    private int adminid;
    
    //   카테고리는 관리자만 접근 가능하도록 하여 관리하도록 변경예정..
    // 다음 번 push에 코드삭제 예정
    // private int memberid; 
 
    // houseno  PK는 카테고리 보다는 QnaVO에 있는것이 적당하다고 판단됨.
    // 해당 기능이 개발이 되고, 다음 Push에 해당 주석 + 프로퍼티 을 삭제하겠음.
    // private int houseno;
    
    public QnacateVO(int qcateno, String name, int adminid) {
        this.qcateno = qcateno;
        this.name = name;
        this.adminid = adminid;
    }
    
    public QnacateVO() {
        
    }

}
