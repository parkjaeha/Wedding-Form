package com.weddingform.notice;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;


import com.weddingform.notice.NoticeDAO;
import com.weddingform.notice.NoticeDTO;
import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//공지 게시판 업데이트 서비스

public class NoticeUpdateService implements Action {

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
		
		NoticeDAO noticeDAO=new NoticeDAO();
		BoardDTO boardDTO=null;
		try {
			boardDTO=noticeDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(method.equals("POST")) {
			NoticeDTO noticeDTO=new NoticeDTO();
			noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
			noticeDTO.setTitle(request.getParameter("title"));
			noticeDTO.setWriter(request.getParameter("writer"));
			noticeDTO.setContents(request.getParameter("contents"));
			
			
			int result=0;
			try {
				result=noticeDAO.update(noticeDTO);
		
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			if(result>0) {
				request.setAttribute("message","수정성공" );
				request.setAttribute("path","./noticeList.notice");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");	
			}else {
				request.setAttribute("message", "fail");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");	
			}
			
			
		}else {
		
			request.setAttribute("update", boardDTO);
			request.setAttribute("board", "notice");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardUpdate.jsp");
		}
		
		
		return actionForward;
	}

}
