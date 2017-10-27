package com.weddingform.notice;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.TableSearch;

//공지 게시판 리스트 서비스

public class NoticeListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		NoticeDAO noticeDAO=new NoticeDAO();
		
		int curPage=1;
		try {
		curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		TableSearch tableSearch=new TableSearch();
		tableSearch.setKind(request.getParameter("kind"));
		tableSearch.setSearch(request.getParameter("search"));
		
	
		
		int totalCount;
		
		try {
			totalCount= noticeDAO.getTotalCount(tableSearch);
			PageMaker pageMaker=new PageMaker(curPage, totalCount);
			List <BoardDTO> ar=noticeDAO.selectList(pageMaker.getMakeRow(), tableSearch);
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("board", "notice");
			request.setAttribute("curPage", curPage);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardList.jsp");
		
		return actionForward;

}
}