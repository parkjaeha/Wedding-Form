package com.weddingform.notice;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import com.weddingform.notice.NoticeDAO;
import com.weddingform.notice.NoticeDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//공지 게시판 쓰기 서비스

public class NoticeWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		
		if(method.equals("POST")) {
			NoticeDAO noticeDAO=new NoticeDAO();
			NoticeDTO noticeDTO=new NoticeDTO();
			noticeDTO.setTitle(request.getParameter("title"));
			noticeDTO.setWriter(request.getParameter("writer"));
			noticeDTO.setContents(request.getParameter("smarteditor"));
			
			try {
				int result=noticeDAO.insert(noticeDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			actionForward.setCheck(false);
			actionForward.setPath("./noticeList.notice");
			
		}else {
			request.setAttribute("board", "notice");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardWrite.jsp");
		}


			
			return actionForward;
		}


}
