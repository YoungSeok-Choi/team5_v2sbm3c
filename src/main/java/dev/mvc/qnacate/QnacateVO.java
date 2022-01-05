package dev.mvc.qnacate;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class QnacateVO {
    
    private int qcateno;
    private String name = ""; // for avoiding NPE
    
    private int memberid;
    private int adminid;
    
    // houseno  PK는 카테고리 보다는 질문 VO에 있는것이 적당하다고 판단됨.
    // 해당 기능이 개발이 되고, 다음 Push에 해당 주석을 삭제하겠음.
    // private int houseno;
    
    public QnacateVO(int qcateno, String name, int memberid, int adminid) {
        this.qcateno = qcateno;
        this.name = name;
        this.memberid = memberid;
        this.adminid = adminid;
    }
    
    public QnacateVO() {
        
    }

}
