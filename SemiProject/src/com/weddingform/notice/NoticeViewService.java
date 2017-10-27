package com.weddingform.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//공지 게시판 보기 서비스


public class NoticeViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		NoticeDAO noticeDAO=new NoticeDAO();
		
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		BoardDTO boardDTO=null;
		
		try {
			boardDTO=noticeDAO.selectOne(num);
			noticeDAO.hitUpdate(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		request.setAttribute("view", boardDTO);
		request.setAttribute("board", "notice");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardView.jsp");
		return actionForward;
	}

}
