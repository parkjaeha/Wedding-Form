package com.weddingform.review;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.TableSearch;

//후기 리스트 서비스

public class ReviewListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		ReviewDAO reviewDAO=new ReviewDAO();
		
		int curPage=1;
		String type="";
		
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
			type=request.getParameter("type");
							
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		TableSearch tableSearch=new TableSearch();
		tableSearch.setKind(request.getParameter("kind"));
		tableSearch.setSearch(request.getParameter("search"));
	
		int totalCount;
		try {
			totalCount=reviewDAO.getTotalCount(tableSearch);
			PageMaker pageMaker=new PageMaker(curPage, totalCount);
			List<BoardDTO> ar=reviewDAO.selectList(pageMaker.getMakeRow(), tableSearch, type);
			
			if(type.equals("wedding_hall")) {
				request.setAttribute("type", type);
			}else {
				request.setAttribute("type", type);
			}
			
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("curPage", curPage);
			
		} catch (Exception e) {
		 e.printStackTrace();
		}
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/reviewList.jsp");
			
		return actionForward;
	}

}
