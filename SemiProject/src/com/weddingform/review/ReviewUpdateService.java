package com.weddingform.review;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;

//후기 업데이트 서비스

public class ReviewUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
	
		String method=request.getMethod();
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		ReviewDAO reviewDAO=new ReviewDAO();
		BoardDTO boardDTO=null;
		
		try {
			boardDTO=reviewDAO.selectOne(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(method.equals("POST")) {
			ReviewDTO reviewDTO=new ReviewDTO();
			reviewDTO.setNum(Integer.parseInt(request.getParameter("num")));
			reviewDTO.setTitle(request.getParameter("title"));
			reviewDTO.setWriter(request.getParameter("writer"));
			reviewDTO.setContents(request.getParameter("smarteditor"));
			reviewDTO.setStar_score(Integer.parseInt(request.getParameter("starscore")));
            reviewDTO.setType(request.getParameter("type"));
            
            int result=0;
            try {
				result=reviewDAO.update(reviewDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
            
            if(result>0) {
            	actionForward.setCheck(false);
       		 actionForward.setPath("./reviewList.review?type="+reviewDTO.getType()+"&&curPage=1");
			}else {
				request.setAttribute("message", "fail");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");	
			}
			
			
		}else {
		
			request.setAttribute("update", boardDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/reviewUpdate.jsp");
		}
	
		
		return actionForward;
	}

}
