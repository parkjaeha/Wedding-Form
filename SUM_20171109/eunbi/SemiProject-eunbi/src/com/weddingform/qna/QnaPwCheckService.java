package com.weddingform.qna;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

public class QnaPwCheckService implements Action{
@Override
public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward=new ActionForward();
	String method=request.getMethod();
	
	if(method.equals("POST")) {
		String password=request.getParameter("password");
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
		
	boolean result=true;
	try {
		result=qnaDAO.qnaPwCheck(num, password);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	if(result==true) {
		request.setAttribute("board", "qna");
		request.setAttribute("view", boardDTO);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardView.jsp?opencheck=hide");
	}else {
		request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		request.setAttribute("path", "./qnaList.qna");
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");	
	}
	


	}else {
	
	actionForward.setCheck(true);
	actionForward.setPath("../WEB-INF/view/board/qnaPwCheck.jsp");
	}
	
	return actionForward;
}
}
