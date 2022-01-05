package dev.mvc.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;


@Controller
public class QnaCont {
    
    @Autowired
    @Qualifier("dev.mvc.qna.QnaProc")
    private QnaProcInter qnaProc;
    
    
    /**
     * 새로고침 방지, EL에서 param으로 접근
     * @return
     */
    @RequestMapping(value="/qna/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url, String code){
      ModelAndView mav = new ModelAndView();
      
      // msg 메서드의 매개변수 이름과, rediect로 보낸 Proc메서드의 변수 binding
      //      System.out.println(code);
      //      System.out.println(url);
      
      mav.addObject("code", code);
      mav.setViewName(url); // forward
      
      return mav; // forward
    }
    
    //show QnA list Page
    @RequestMapping(value = "/qnalist", method=RequestMethod.GET)
    public ModelAndView showQnaPage(HttpSession session) {
        
        ModelAndView mav = new ModelAndView();
        int memberid = (int)session.getAttribute("memberid");
        List<QnaVO> list = qnaProc.getListWithMemberid(memberid);
        
//        System.out.println("************************* Test Started *************************");
//        System.out.println("check_QnaVOList length" + list.size());
//        System.out.println("************************* Test Ended *************************");
        
        
        mav.addObject("lists", list);
        mav.setViewName("/qna/qnalist"); //WEB-INF/views/qna/qnalist.jsp
        
        return mav;
    }

    // when click QnA 등록 Button from client
    @RequestMapping(value = "/qna", method=RequestMethod.GET)
    public ModelAndView createForm() {
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("/qna/createQnaForm");
        return mav;
    }
    
    // process creating QnA
    @RequestMapping(value = "/qna", method=RequestMethod.POST)
    public ModelAndView createQna(HttpSession session,
                                                 QnaVO qnaVO) {
        
        ModelAndView mav = new ModelAndView();
        
        int memberid = (int)session.getAttribute("memberid");  // ("String", Object) type, conversion needed
        
//        System.out.println("************************* Test Started *************************");
//        System.out.println("check_Memberid From session Attribute" + memberid);
//        System.out.println("************************* Test Ended *************************");
        
        qnaVO.setMemberid(memberid); // 어떤 유저가 추가한 QnA인지 분류하기 위해 FK setting
        
        int result = qnaProc.createQna(qnaVO);
 
        if (result == 1) {
            mav.addObject("code", "qna_create_success");
        } else {
            mav.addObject("code", "qna_create_fail");
        }
        mav.addObject("url", "/qna/msg");
        mav.setViewName("redirect:/qna/msg.do");
        
        return mav;
    }
}
