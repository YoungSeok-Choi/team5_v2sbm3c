package dev.mvc.faq;

import java.util.List;

public interface FaqDAOInter {
    
    /**
     * 
     * @param faqVO
     * @return
     */
    public int createFaq(FaqVO faqVO);

    /**
     * 
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
