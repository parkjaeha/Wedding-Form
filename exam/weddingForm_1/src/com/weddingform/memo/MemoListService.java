package com.weddingform.memo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class MemoListService implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemoDAO memoDAO=new MemoDAO();

		
		try {
			List<MemoDTO> ar=memoDAO.selectList();
			request.setAttribute("list", ar);
			System.out.println(ar);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/memo/memoList.jsp");
		
		return actionForward;
	}
}
