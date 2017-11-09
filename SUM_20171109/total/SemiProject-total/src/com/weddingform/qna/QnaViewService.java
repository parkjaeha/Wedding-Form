package com.weddingform.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//질문 게시판 보기 서비스

public class QnaViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		QnaDAO qnaDAO=new QnaDAO();
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		BoardDTO boardDTO=null;
		try {
			qnaDAO.hitUpdate(num);
			boardDTO=qnaDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("view", boardDTO);
		request.setAttribute("board", "qna");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardView.jsp");
		return actionForward;
	}

}
