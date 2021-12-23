package dev.mvc.faq;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqCont {
    
    @Autowired
    @Qualifier("dev.mvc.faq.FaqProc") // dependency injection interface implement for this name
    private FaqProcInter faqProc;
    
    @RequestMapping(value = "/faqlist", method = RequestMethod.GET)
    public ModelAndView showFaqPage() {
        ModelAndView mav = new ModelAndView();
        
        List<FaqVO> list = faqProc.getAll();
        
        // for test about query works or not
        // System.out.println("list사이즈는???" + list.size());
        
        mav.addObject("lists", list);
        mav.setViewName("faq/faqlist");
        
        return mav;
    }
    
    @RequestMapping(value = "/faq", method = RequestMethod.GET)
    public ModelAndView createForm() {
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("faq/createform");
        return mav;     
    }
    
    @RequestMapping(value = "/faq", method = RequestMethod.POST)
    public ModelAndView createFaq(FaqVO faqVO) {
        ModelAndView mav = new ModelAndView();
        
        int result = faqProc.createFaq(faqVO);
        
        if(result == 1) mav.addObject("code", "faq_success");
        else mav.addObject("code", "faq_fail");

        mav.setViewName("faq/msg");
        return mav;     
    }
    
    
    /**
     * 새로고침 방지, EL에서 param으로 접근
     * @return
     */
    @RequestMapping(value="/faq/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();

      mav.setViewName(url); // forward
      
      return mav; // forward
    }

}
