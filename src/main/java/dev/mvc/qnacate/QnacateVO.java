package dev.mvc.qnacate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class QnacateVO {
    
    private int qcateno;
    private String name = ""; // for avoiding NPE
    private int memberid;
    private int adminid;
    private int houseno;
    
    public QnacateVO(int qcateno, String name, int memberid, int adminid, int houseno) {
        this.qcateno = qcateno;
        this.name = name;
        this.memberid = memberid;
        this.adminid = adminid;
        this.houseno = houseno;
    }
    
    public QnacateVO() {
        
    }

}
