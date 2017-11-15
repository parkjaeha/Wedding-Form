package com.weddingform.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.notice.NoticeDAO;
import com.weddingform.notice.NoticeDTO;

//질문 게시판 업데이트 서비스

public class QnaUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
        int num=0;
		
		try {
			num=Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		QnaDAO qnaDAO=new QnaDAO();
		BoardDTO boardDTO=null;
		try {
			boardDTO=qnaDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(method.equals("POST")) {
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
			qnaDTO.setTitle(request.getParameter("title"));
			qnaDTO.setWriter(request.getParameter("writer"));
			qnaDTO.setContents(request.getParameter("smarteditor"));
			
			
			int result=0;
			try {
				result=qnaDAO.update(qnaDTO);
		
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			if(result>0) {
				request.setAttribute("message","수정성공" );
				request.setAttribute("path","./qnaList.qna");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");	
			}else {
				request.setAttribute("message", "fail");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");	
			}
			
			
		}else {
		
			request.setAttribute("update", boardDTO);
			request.setAttribute("board", "qna");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardUpdate.jsp");
		}
		
		return actionForward;
	}

}
