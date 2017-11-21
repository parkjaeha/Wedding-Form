package com.weddingform.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//질문 게시판 답변 서비스

public class QnaReplyService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
	
		
		if(method.equals("POST")) {
			
			
			QnaDAO qnaDAO=new QnaDAO();
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
			qnaDTO.setTitle(request.getParameter("title"));
			qnaDTO.setWriter(request.getParameter("writer"));
			qnaDTO.setContents(request.getParameter("contents"));
			qnaDTO.setOpencheck(request.getParameter("opencheck"));
			qnaDTO.setPassword(request.getParameter("password"));
			
			
			try {
				int result=qnaDAO.reply(qnaDTO);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			actionForward.setCheck(false);
			actionForward.setPath("./qnaList.qna");
		}else {
			request.setAttribute("board", "qna");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardReply.jsp");
			
		}
		return actionForward;
	}

}
