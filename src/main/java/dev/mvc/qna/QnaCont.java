package dev.mvc.qna;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
        
        // 세션변수가 사라지는 문제가 있음. 예외발생시 다시 로그인 하도록 유도
        try {
            
            int memberid = (int)session.getAttribute("memberid");
            List<QnaVO> list = qnaProc.getListWithMemberid(memberid);
            
//          System.out.println("************************* Test Started *************************");
//          System.out.println("check_QnaVOList length" + list.size());
//          System.out.println("************************* Test Ended *************************");
            
            mav.addObject("lists", list);
            mav.setViewName("/qna/qnalist"); //WEB-INF/views/qna/qnalist.jsp
            
        } catch (NullPointerException e) {
            e.getStackTrace();
            mav.addObject("code", "session_fail");
            mav.setViewName("/qna/msg");
        }

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
    
    
    // path variable로 질문 tuple 의 pk를 획득하여 수정 폼에 뿌려줄 데이터를 DB에서 가져와 View로 전달
    @RequestMapping(value = "/qna/{qnano}/update.do", method=RequestMethod.GET)
    public ModelAndView readForUpdateQna(@PathVariable String qnano) {
        
        ModelAndView mav = new ModelAndView();
        // 1. 수정할 QnA의 기본키 획득 -> 2. DB조회 후 view에 forwarding
        int pk = Integer.parseInt(qnano);
        
        QnaVO qnaVO = qnaProc.getOneWithPK(pk);
        
        // DB에 값이 읽혀오지 않았을 경우, qnaVO == null 인 경우 에외처리 작성하기.
        mav.addObject("qnaVO", qnaVO);
        mav.setViewName("/qna/updateQnaForm");
        
        return mav;  
    }
    
    // path variable로 질문 tuple 의 pk를 획득하여 수정하는 메서드
    @RequestMapping(value = "/qna/{qnano}/update.do", method=RequestMethod.POST)
    public ModelAndView updateQnaProc(QnaVO qnaVO) {
        
        ModelAndView mav = new ModelAndView();

        int result = qnaProc.updateQna(qnaVO);
        
        if (result < 1) {
            mav.addObject("code", "qna_update_fail");
        } else {
            mav.addObject("code", "qna_update_success");
        }
        mav.addObject("url", "/qna/msg");
        mav.setViewName("redirect:/qna/msg.do");

        return mav;
    }
    
    
    // Update 폼 / Proc와 거의 유사한 동작. 동작의 종류만 다름.
    @RequestMapping(value = "/qna/{qnano}/delete.do", method=RequestMethod.GET)
    public ModelAndView readForDeleteQna(@PathVariable String qnano) {
        
        ModelAndView mav = new ModelAndView();
        // 1. 삭제할 QnA의 기본키 획득 -> 2. DB조회 후 view에 forwarding
        int pk = Integer.parseInt(qnano);
        
        QnaVO qnaVO = qnaProc.getOneWithPK(pk);
        
        // DB에 값이 읽혀오지 않았을 경우, qnaVO == null 인 경우 에외처리 작성하기.
        mav.addObject("qnaVO", qnaVO);
        mav.setViewName("/qna/deleteQnaForm");
        
        return mav;  
    }
    
    /**
     * 단일 qna 삭제하기
     * @param qnano
     * @return
     */
    @RequestMapping(value = "/qna/{qnano}/delete.do", method=RequestMethod.POST)
    public ModelAndView deleteQnaProc(@PathVariable String qnano) {
        
        ModelAndView mav = new ModelAndView();
        int pk = Integer.parseInt(qnano);
        
        int result = qnaProc.deleteQna(pk);
        
        if (result < 1) {
            mav.addObject("code", "qna_delete_fail");
        } else {
            mav.addObject("code", "qna_delete_success");
        }
        mav.addObject("url", "/qna/msg");
        mav.setViewName("redirect:/qna/msg.do");

        return mav;
    }
    
    /**
     * 특정 카테고리 별 해당하는 QnA 전부 삭제하기 (카테고리 삭제시 호출.)
     * 
     * @param qcateno 외래 키
     * @return 파라미터로 넘어간 외래키에 해당하는(삭제될) QnA게시글 수
     */
    @RequestMapping(value = "/qna/delete_by_qcateno.do", method=RequestMethod.GET)
    public ModelAndView deleteQnasWithView(int qcateno) { // @RequestParam int qcateno 하면 numberFomatException터짐. 왜이럴까?

        ModelAndView mav = new ModelAndView();
        int result = qnaProc.deleteQnaByQcateno(qcateno);

        if (result < 1) {
            mav.addObject("code", "qnaS_delete_fail");
        } else {
            mav.addObject("code", "qnaS_delete_success");
        }
        mav.addObject("url", "/qna/msg");
        mav.setViewName("redirect:/qna/msg.do");
        
        return mav;
    }
    
    /**
     * 특정 카테고리 별 해당하는 QnA 전부 삭제하기 (카테고리 삭제시 호출.)
     * 
     * @param qcateno 외래 키
     * @return 파라미터로 넘어간 외래키에 해당하는(삭제될) QnA게시글 수
     */
    @ResponseBody
    @RequestMapping(value = "/qna/delete_by_qcateno.do", method=RequestMethod.POST)
    public String deleteQnaS(int qcateno) { // @RequestParam int qcateno 하면 numberFomatException터짐. 왜이럴까?

        int cnt = qnaProc.deleteQnaByQcateno(qcateno);

        JSONObject json = new JSONObject();
        json.put("qcateno", qcateno);
        json.put("cnt", cnt);
        
        return json.toString();
    }

}
