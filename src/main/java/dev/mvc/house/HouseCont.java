package dev.mvc.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HouseCont {
    @Autowired
    @Qualifier("dev.mvc.house.HouseProc")
    private HouseProcInter houseProc;

    public HouseCont() {
        System.out.println("-> HouseCont created.");
    }
    /** 등록폼 */
    @RequestMapping(value = "/house/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/house/create");

        return mav;
    }
    
    /**
     * 등록 처리
     * 
     */
    @RequestMapping(value = "/house/create.do", method = RequestMethod.POST)
    public ModelAndView create(HouseVO houseVO) {

        ModelAndView mav = new ModelAndView();

        int hnt = this.houseProc.create(houseVO); // 등록 처리
        
        mav.addObject("hnt", hnt);
       
        if (hnt == 1) {
                       mav.setViewName("redirect:/house/list.do");
        } else {
            mav.addObject("code", "create_fail"); 
            mav.setViewName("/house/msg"); 
        }

        return mav;
    }

    @RequestMapping(value = "/house/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();


        
        List<HouseVO> list = this.houseProc.list_price_asc();
        mav.addObject("list", list);

        mav.setViewName("/house/list");
        return mav;
    }
    
    /**
     * 조회 + 수정폼
     * 
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value = "/house/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int houseno) {

        ModelAndView mav = new ModelAndView();

        HouseVO houseVO = this.houseProc.read(houseno);
        mav.addObject("houseVO", houseVO);

        List<HouseVO> list = this.houseProc.list_houseno_asc();
        mav.addObject("list", list);

        mav.setViewName("/house/read_update");
        return mav;
    }
    
    /**
     * 수정 처리
     */
    @RequestMapping(value = "/house/update.do", method = RequestMethod.POST)
    public ModelAndView update(HouseVO houseVO) {

        ModelAndView mav = new ModelAndView();

        int hnt = this.houseProc.update(houseVO);
        mav.addObject("hnt", hnt); 

        if (hnt == 1) {
            mav.setViewName("redirect:/house/list.do");
        } else {
            mav.addObject("code", "update"); 
            mav.setViewName("/house/msg"); 
        }

        return mav;
    }
    
    
}