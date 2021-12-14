package dev.mvc.answer;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class AnswerVO {
    
    private int answerno;
    private int qnano;
    private int adminid;
    private String answer = ""; // avoiding NPE
    
    
    public AnswerVO(int answerno, int qnano, int adminid, String answer) {
        this.answerno = answerno;
        this.qnano = qnano;
        this.adminid = adminid;
        this.answer = answer;
    }
    
    public AnswerVO() {
        
    }
    
}
