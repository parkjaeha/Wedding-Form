package com.weddingform.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReplyDeleteService implements Action{
@Override
public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward=new ActionForward();
	ReplyDAO replyDAO=new ReplyDAO();

	
	int num=0;
	String type="";
	int reviewNum=0;
	int ref=0;
	try {
		num=Integer.parseInt(request.getParameter("num"));
		reviewNum=Integer.parseInt(request.getParameter("reviewNum"));
		type=request.getParameter("type");
		ref=Integer.parseInt(request.getParameter("ref"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	int result=0;
	try {
		result=replyDAO.delete1(ref);
	} catch (Exception e) {
		// TODO: handle exception
	}
	if(result>0) {
		request.setAttribute("message", "삭제 성공");
		
	}else {
		request.setAttribute("message", "삭제 실패");
	}
	request.setAttribute("path", "../review/reviewView.review?type="+type+"&&num="+reviewNum+"");
	actionForward.setCheck(true);
	actionForward.setPath("../WEB-INF/view/common/result.jsp");
	return actionForward;
}
}
