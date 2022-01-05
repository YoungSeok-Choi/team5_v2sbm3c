package dev.mvc.faq;

import java.util.HashMap;
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
    
    public FaqVO getOneWithPK(int faqno);
    
    /**
     * 
     * @return
     */
    public List<FaqVO> getAll ();
    
    /**
     * update single Faq by using HashMap(title, text, adminid)
     * @param map
     * @return
     */
    public int updateFaq(FaqVO faqVO);
    
    /**
     * delete single Faq by using PK 
     * @param faqno
     * @return
     */
    public int deleteFaq(int faqno);
    

}
