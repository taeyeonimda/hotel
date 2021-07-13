package kimkwangsoo.hotel.query.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.query.domain.Query;
import kimkwangsoo.hotel.query.service.QueryService;
import kimkwangsoo.hotel.room.service.RoomService;

   @Controller
   @RequestMapping("/query")
   public class QueryController {
      @Autowired private QueryService queryService;
      @Autowired private RoomService roomService;
      
////////////////////////////// 문의 목록 //////////////////////////////
      @RequestMapping("/queryList")
      public String getQuerys(Model model, Page page,HttpSession session,
            @RequestParam(value="nowPage", required=false)String nowPage,
            @RequestParam(value="cntPerPage",required=false)String cntPerPage){
    	  
    	//roomlist
    	  int total1 = roomService.getRoomTypesCnt();
	      if(nowPage ==null && cntPerPage ==null) { 
	         nowPage ="1";
	         cntPerPage ="5";
	      }else if(nowPage ==null) {
	         nowPage ="1";
	      }else if(cntPerPage ==null) {
	         cntPerPage = "5";
	      }
	      page = new Page(total1, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	      
	      model.addAttribute("roomTypeList", roomService.getRoomTypes(page));
    	  
         int total = queryService.getQuerysCnt();
         if(nowPage ==null && cntPerPage ==null) { 
           nowPage ="1";
           cntPerPage ="5";
        }else if(nowPage ==null) {
           nowPage ="1";
        }else if(cntPerPage ==null) {
           cntPerPage = "5";
        }
        page = new Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        session.setAttribute("paging", page);
         session.setAttribute("query", queryService.listQuerys(page));
         
         return "query/queryList";
      }
      
////////////////////////////// 문의목록 Mypage //////////////////////////////
      @RequestMapping("/queryMypage")
      public String getMyQuerys(Page page,HttpSession session,
            @RequestParam(value="nowPage", required=false)String nowPage,
            @RequestParam(value="cntPerPage",required=false)String cntPerPage){
         
         int total = queryService.getQuerysCnt();
         if(nowPage ==null && cntPerPage ==null) { 
           nowPage ="1";
           cntPerPage ="5";
        }else if(nowPage ==null) {
           nowPage ="1";
        }else if(cntPerPage ==null) {
           cntPerPage = "5";
        }
        page = new Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        session.setAttribute("paging", page);
         session.setAttribute("query", queryService.listQuerys(page));
         
         return "query/queryMypage";
      }
      
////////////////////////////// 문의 조회 //////////////////////////////
      @RequestMapping("/queryView") // 문의 내용 조회, 문의 조회수
      public ModelAndView displayQuery(
            @RequestParam(defaultValue="1") Integer queryNum, HttpSession session) {         
         ModelAndView mv = new ModelAndView();
         mv.setViewName("/query/queryView");
         Query query = new Query();
         
        query = queryService.displayQuery(queryNum);
        queryService.increaseCnt(queryNum); // 조회수 증가
         session.setAttribute("query", query);
         return mv;
      }
      
////////////////////////////// 문의 조회 Mypage //////////////////////////////
      @RequestMapping("/queryViewMy") // 문의 내용 조회, 문의 조회수
      public ModelAndView displayQueryMy(
            @RequestParam(defaultValue="1") Integer queryNum, HttpSession session) {         
         ModelAndView mv = new ModelAndView();
         mv.setViewName("/query/queryViewMy");
         Query query = new Query();
         
         query = queryService.displayQuery(queryNum);
         queryService.increaseCnt(queryNum); // 조회수 증가
         session.setAttribute("query", query);
         return mv;
      }
      
////////////////////////////// 문의 등록 //////////////////////////////
      @RequestMapping("/queryAdd")
      public String regQuery() {
         return "query/queryAdd";
      }
      
      @Transactional
      @RequestMapping("/addQuery")
      @ResponseBody
      public void addQuery(Query query) {
         queryService.registerQuery(query);
      }
                                
////////////////////////////// 문의 수정 뷰 //////////////////////////////
      @RequestMapping("/queryModi")
      public String queryModi() {
         return "query/queryModi";
      }
////////////////////////////// 문의 수정 //////////////////////////////
      @RequestMapping("/modiQuery")
      @ResponseBody
      public void modifyQuery(Query query) {
         queryService.modifyQuery(query);
      }      

////////////////////////////// 문의 삭제 //////////////////////////////
      @RequestMapping(value="removeQuery.do")
      public String removeQuery(@RequestParam(value="queryNum") int queryNum) {
         queryService.removeQuery(queryNum);
         return "redirect:queryList";
      }
   }