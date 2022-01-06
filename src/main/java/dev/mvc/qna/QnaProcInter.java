package dev.mvc.qna;

import java.util.List;

public interface QnaProcInter {
    
    /**
     * 
     * @param qnaVO
     * @return
     */
    public int createQna(QnaVO qnaVO);
    
    
    /**
     * 
     * @param memberid
     * @return
     */
    public List<QnaVO> getListWithMemberid(int memberid) ;


}
