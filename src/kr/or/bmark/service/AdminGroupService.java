package kr.or.bmark.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bmark.action.Action;
import kr.or.bmark.action.ActionForward;
import kr.or.bmark.dao.adminDao;
import kr.or.bmark.dto.team;


public class AdminGroupService  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		adminDao dao = new adminDao();
		int totalmyboardcount = dao.totalGroupCount();
		
		String psstr = request.getParameter("ps");    //pagesize
        String cpstr = request.getParameter("cp");    //currentpage
        
        if(psstr == null || psstr.trim().equals("")){
            //default 값
            psstr = "10"; // default 5건씩 
        }
        
        if(cpstr == null || cpstr.trim().equals("")){
            cpstr= "1";        //default 1 page
        }
      
        int pagesize = Integer.parseInt(psstr);  //5
        int cpage = Integer.parseInt(cpstr);     //1
        int pagecount = 0;                       
        
        if(totalmyboardcount % pagesize==0){        //전체 건수 , pagesize > 
            pagecount = totalmyboardcount/pagesize;
        }else{
            pagecount = (totalmyboardcount/pagesize) + 1;
        }
        
        List<team> grouplist= dao.groupList(cpage, pagesize);
		
        ActionForward forward = new ActionForward();
        request.setAttribute("cpage", cpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("grouplist", grouplist);
        request.setAttribute("totalboardcount", totalmyboardcount);
        
        
        forward.setRedirect(false);
        forward.setPath("/views/admin/grouplist.jsp");
		
		return forward;
	}

}
