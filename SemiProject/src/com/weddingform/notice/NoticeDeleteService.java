package com.weddingform.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//공지 게시판 삭제 서비스

public class NoticeDeleteService implements Action {

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
	int result=0;
	try {
		result=noticeDAO.delete(num);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	if(result>0) {
		request.setAttribute("message", "삭제 성공");
	}else {
		request.setAttribute("message", "삭제 실패");
	}
	
	request.setAttribute("path", "./noticeList.notice");
	actionForward.setCheck(true);
	actionForward.setPath("../WEB-INF/view/common/result.jsp");
		return actionForward;
	}

}
