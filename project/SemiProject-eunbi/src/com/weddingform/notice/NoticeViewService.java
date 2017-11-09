package com.weddingform.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.weddingform.notice.NoticeDAO;
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
		}catch (Exception e) {
			// TODO: handle exception
		}
		BoardDTO boardDTO=null;
		try {
			noticeDAO.hitUpdate(num);
			boardDTO=noticeDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//boardDTO가 null이면 다른곳으로 처리
		
		
		request.setAttribute("view", boardDTO);
		request.setAttribute("board", "notice");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardView.jsp");
		return actionForward;
	}

}
