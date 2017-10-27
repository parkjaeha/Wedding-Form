package com.weddingform.qna;

import java.util.List ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.Board.BoardDTO;
import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.PageMaker;
import com.weddingform.util.TableSearch;

//질문 게시판 리스트 서비스

public class QnaListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		QnaDAO qnaDAO=new QnaDAO();
		
		int curPage=1;
		try {
			curPage=Integer.parseInt(request.getParameter("curPage"));
					
					
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		TableSearch tableSearch=new TableSearch();
		tableSearch.setKind(tableSearch.getKind());
		tableSearch.setSearch(tableSearch.getSearch());
		
		int totalCount;
		
		try {
			totalCount=qnaDAO.getTotalCount(tableSearch);
			PageMaker pageMaker=new PageMaker(curPage, totalCount);
			List<BoardDTO> ar=qnaDAO.selectList(pageMaker.getMakeRow(),tableSearch);
			request.setAttribute("list", ar);
			request.setAttribute("page", pageMaker.getMakePage());
			request.setAttribute("board", "qna");
			request.setAttribute("curPage", curPage);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/board/boardList.jsp");
		return actionForward;
	}

}
