package com.weddingform.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReplyWriteService implements Action{
@Override
public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward=new ActionForward();
	String method=request.getMethod();
	
	
	if(method.equals("POST")) {
		ReplyDAO replyDAO=new ReplyDAO();
		ReplyDTO replyDTO=new ReplyDTO();
		int num=Integer.parseInt(request.getParameter("num"));
		String type=request.getParameter("type");
		replyDTO.setTitle(request.getParameter("title"));
		replyDTO.setWriter(request.getParameter("writer"));
		replyDTO.setContents(request.getParameter("contents"));

		try {
			int result=replyDAO.insert(replyDTO, num ,type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionForward.setCheck(false);
		actionForward.setPath("../review/reviewView.review?num="+num+"");
	}
	
	
	
	
	
	return actionForward;
}
}
