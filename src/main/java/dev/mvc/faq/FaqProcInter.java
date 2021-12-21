package dev.mvc.faq;

import java.util.List;

public interface FaqProcInter {
    
    /**
     * insert faq instance
     * @param faqVO
     * @return
     */
    public int createFaq(FaqVO faqVO);

    /**
     * retrieve faqs 
     * @param adminid
     * @return
     */
    public List<FaqVO> getListWithFK (int adminid);
    
    /**
     * 
     * @return
     */
    public List<FaqVO> getAll ();
    

}
