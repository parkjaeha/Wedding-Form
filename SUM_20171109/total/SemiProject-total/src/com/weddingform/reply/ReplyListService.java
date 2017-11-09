package com.weddingform.reply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.TableSearch;

public class ReplyListService implements Action{
@Override
public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward=new ActionForward();
	ReplyDAO replyDAO=new ReplyDAO();
	

	String type="";
	int num=0;
	
	try {
		 type=request.getParameter("type");
		 num=Integer.parseInt(request.getParameter("num"));
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	try {
	
		List<BoardDTO> ar =replyDAO.selectList(type, num);
		
		request.setAttribute("list", ar);
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	
	
	actionForward.setCheck(true);
	actionForward.setPath("../WEB-INF/view/board/reviewReple.jsp");
	return actionForward;
}
}
