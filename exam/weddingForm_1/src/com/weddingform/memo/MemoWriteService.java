package com.weddingform.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class MemoWriteService implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();

		if(method.equals("POST")) {
			MemoDAO memoDAO=new MemoDAO();
			MemoDTO memoDTO=new MemoDTO();
			memoDTO.setId("user03");
			memoDTO.setName(request.getParameter("name"));
			memoDTO.setPassword(request.getParameter("password"));
			memoDTO.setContents(request.getParameter("contents"));

			try {
				int result=memoDAO.insert(memoDTO);
				
				if(result > 0) {
					request.setAttribute("memo", memoDTO);
					
				}
				
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/memo/memoWrite.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else { // GET METHOD



		}

		return actionForward;
	}

}
