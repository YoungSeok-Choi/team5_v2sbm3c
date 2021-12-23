package dev.mvc.qna;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class QnaVO {
    
    private int qnano;
    private String title = ""; // for avoiding NPE
    private String secret = "";
    private String text = ""; 
    private String qdate = ""; 
    private int qcateno;
    
    
    public QnaVO(int qnano, String title, String secret, String text, String qdate, int qcateno) {
        this.qnano = qnano;
        this.title = title;
        this.secret = secret;
        this.text = text;
        this.qdate = qdate;
        this.qcateno = qcateno;
    }
    
    public QnaVO () {
        
    }
    
    
}
