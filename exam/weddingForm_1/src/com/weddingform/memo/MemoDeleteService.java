package com.weddingform.memo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.common.CommonDTO;
import com.weddingform.util.PageMaker;

public class MemoDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		HttpSession session = request.getSession();
		CommonDTO commonDTO = (CommonDTO)session.getAttribute("common");
		
		///////////////////////////////////////////////////////
		if(commonDTO == null) {
			commonDTO = new CommonDTO();
			commonDTO.setId("user03");
		}
		/////////////////////////////////////////////////////
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {	}
		
		String pw = request.getParameter("pw");
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("pw: "+pw);
		System.out.println("num: "+num);
		
		MemoDAO memoDAO=new MemoDAO();
		try {
			int result = memoDAO.delete(pw, num);
			
			PageMaker pageMaker = new PageMaker(1, 5*curPage, memoDAO.getTotal(commonDTO.getId()));
			List<MemoDTO> ar = memoDAO.selectList(commonDTO.getId(), pageMaker.getMakeRow());
			
			request.setAttribute("list", ar);
			
			if(result > 0) {
				request.setAttribute("message", "ok");
			} else {
				request.setAttribute("message", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/memo/memoWrite.jsp");
		
		return actionForward;
	}

}
