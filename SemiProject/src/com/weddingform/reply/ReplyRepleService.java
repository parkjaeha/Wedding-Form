package com.weddingform.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReplyRepleService implements Action{
@Override
public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward=new ActionForward();
	String method=request.getMethod();
	int num=Integer.parseInt(request.getParameter("num"));
	int reviewNum=Integer.parseInt(request.getParameter("reviewNum"));
	String type=request.getParameter("type");
	ReplyDAO replyDAO=new ReplyDAO();
	
	ReplyDTO replyDTO=new ReplyDTO();
	replyDTO.setNum(num);
	replyDTO.setWriter(request.getParameter("writer"));
	replyDTO.setContents(request.getParameter("contents"));
    replyDTO.setReviewNum(reviewNum);
    replyDTO.setType(type);
	
	try {
		int result=replyDAO.reply(replyDTO);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	request.setAttribute("list", replyDTO);
	actionForward.setCheck(false);
	actionForward.setPath("../review/reviewView.review?num="+reviewNum+"");
	return actionForward;	

	
	
	
}
	
}
