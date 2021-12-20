package dev.mvc.faq;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Faq {
    
    private int faqno;
    private int adminno;
    private String title = "";
    private String text = "";
    private String date = "";
    
    
    public Faq (int faqno, int adminno, String title, String text, String date) {
        this.faqno = faqno;
        this.adminno = adminno;
        this.title = title;
        this.text = text;
        this.date = date;
    }
    
    public Faq() {
        
    }
    
}
