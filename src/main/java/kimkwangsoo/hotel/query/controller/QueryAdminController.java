package kimkwangsoo.hotel.query.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.query.domain.Query;
import kimkwangsoo.hotel.query.service.QueryService;
import kimkwangsoo.hotel.room.domain.Room;

@Controller 
@RequestMapping("/admin/query")
public class QueryAdminController {
   @Autowired
   private QueryService queryService;

////////////////////////////// 관리자.문의 목록 //////////////////////////////
   @RequestMapping("/queryList")
   public String getQuerys(Page page,HttpSession session,
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
      
      return "admin/query/queryList";
   }	
   
////////////////////////////// 관리자.문의 조회 //////////////////////////////
    @RequestMapping("/queryView") // 문의 내용 조회, 문의 조회수
    public ModelAndView displayQuery(
          @RequestParam(defaultValue="1") Integer queryNum, HttpSession session) {         
       ModelAndView mv = new ModelAndView();
       mv.setViewName("admin/query/queryView");
       Query query = new Query();
       // session.getAttribute("query");
       
      query = queryService.displayQuery(queryNum);
      queryService.increaseCnt(queryNum); // 조회수 증가
       System.out.println(queryNum);
       session.setAttribute("query", query);
       return mv;
    }
    
    @RequestMapping("/adminReply")
    @ResponseBody
    @Transactional
    public void queryReply(Query query) {
    	queryService.queryReply(query);
    }
    
////////////////////////////// 관리자.문의 삭제 //////////////////////////////
    @RequestMapping(value="removeQuery.do")
    public String removeQuery(@RequestParam(value="queryNum") int queryNum) {
       queryService.removeQuery(queryNum);
       return "redirect:queryList";
    }
}