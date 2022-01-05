package dev.mvc.qnacate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value = "dev.mvc.qnacate.QnacateProc")
public class QnacateProc implements QnacateProcInter {
    
    @Autowired
    private QnacateDAOInter qnacateDAO;

    @Override
    public int createQnacate(QnacateVO qnacateVO) { return qnacateDAO.createQnacate(qnacateVO); }
    
    

}
