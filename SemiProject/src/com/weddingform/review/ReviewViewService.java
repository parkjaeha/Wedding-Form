package com.weddingform.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//후기 보기 서비스

public class ReviewViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		ReviewDAO reviewDAO=new ReviewDAO();
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		BoardDTO boardDTO=null;
		try {
			reviewDAO.hitUpdate(num);
			boardDTO=reviewDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("view", boardDTO);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/reviewView.jsp");
		return actionForward;
	}

}
