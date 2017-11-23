package com.weddingform.memo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.common.CommonDTO;
import com.weddingform.util.PageMaker;

public class MemoWriteService implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		HttpSession session = request.getSession();
		CommonDTO commonDTO = (CommonDTO)session.getAttribute("common");
		
		///////////////////////////////////////////////////////
		if(commonDTO == null) {
			commonDTO = new CommonDTO();
			commonDTO.setId("user03");
		}
		/////////////////////////////////////////////////////
		
		MemoDAO memoDAO=new MemoDAO();
		
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {	}
		
		String method=request.getMethod();

		if(method.equals("POST")) {
			MemoDTO memoDTO=new MemoDTO();
			memoDTO.setId(commonDTO.getId());
			memoDTO.setName(request.getParameter("name"));
			memoDTO.setPassword(request.getParameter("password"));
			memoDTO.setContents(request.getParameter("contents"));
			

			try {
				int result=memoDAO.insert(memoDTO);
				
				if(result > 0) {
					PageMaker pageMaker = new PageMaker(1, 5*curPage, memoDAO.getTotal(commonDTO.getId()));
					List<MemoDTO> ar = memoDAO.selectList(commonDTO.getId(), pageMaker.getMakeRow());
					
					request.setAttribute("list", ar);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else { // GET METHOD
			try {
				PageMaker pageMaker = new PageMaker(1, 5*curPage, memoDAO.getTotal(commonDTO.getId()));
				List<MemoDTO> ar = memoDAO.selectList(commonDTO.getId(), pageMaker.getMakeRow());
				
				request.setAttribute("list", ar);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/memo/memoWrite.jsp");

		return actionForward;
	}

}
