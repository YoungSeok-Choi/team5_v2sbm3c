package dev.mvc.qnacate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnacateCont {
    
    @Autowired
    @Qualifier("dev.mvc.qnacate.QnacateProc")
    private QnacateProcInter qnacateProcInter;
    
    @RequestMapping(value = "/qnacatelist", method=RequestMethod.GET)
    public ModelAndView list() {
        
        ModelAndView mav =  new ModelAndView();
        mav.setViewName("/qnacate/qnacatelist");
        
        return mav;
    }

}
