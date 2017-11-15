package com.weddingform.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class ReplyUpdateService implements Action{
 @Override
public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward=new ActionForward();
	String type=request.getParameter("type");
	int reviewNum=Integer.parseInt(request.getParameter("reviewNum"));
	int num=Integer.parseInt(request.getParameter("num"));
	ReplyDAO replyDAO=new ReplyDAO();
	try {
		replyDAO.selectOne(num);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	ReplyDTO replyDTO=new ReplyDTO();
	replyDTO.setNum(Integer.parseInt(request.getParameter("num")));
	replyDTO.setContents(request.getParameter("contents"));
	
	int result=0;
	try {
		 result=replyDAO.update(replyDTO);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 if(result>0) {
		 actionForward.setCheck(false);
			actionForward.setPath("../review/reviewView.review?num="+reviewNum+"");
		}else {
			request.setAttribute("message", "실패");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");	
		}
	return actionForward;
}
}
