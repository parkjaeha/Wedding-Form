package com.weddingform.eung.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.eung.company.CompanyDAO;
import com.weddingform.eung.company.CompanyDTO;
import com.weddingform.eung.extra.ExtraDAO;
import com.weddingform.eung.extra.ExtraDTO;
import com.weddingform.eung.reservation.ReservMemberDAO;
import com.weddingform.eung.reservation.ReservMemberDTO;

public class SearchViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		if(request.getMethod().equals("GET")) { // GET
			ExtraDTO extraDTO = new ExtraDTO();
			extraDTO.setId(request.getParameter("id"));
			CompanyDTO companyDTO = new CompanyDTO();
			companyDTO.setId(request.getParameter("id"));
			
			ExtraDAO extraDAO = new ExtraDAO();
			CompanyDAO companyDAO = new CompanyDAO();
			try {
				extraDTO = extraDAO.searchOne(extraDTO);
				companyDTO = companyDAO.selectOne(companyDTO);

				if(extraDTO != null && companyDTO != null) {
					request.setAttribute("view", extraDTO);
					request.setAttribute("company", companyDTO);
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/search/searchView.jsp");
				} else {
					request.setAttribute("message", "데이터를 가져오는 도중에 예상치 못한 오류가 발생하였습니다.");
					request.setAttribute("path", "./searchMain.search");
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // POST
			ReservMemberDAO reservationDAO = new ReservMemberDAO();
			ReservMemberDTO reservationDTO = this.reservationGet(request);
			
			int result = 0;
			try {
				result = reservationDAO.insert(reservationDTO);
				
				if(result > 0) {
					ExtraDTO extraDTO = new ExtraDTO();
					extraDTO.setId(reservationDTO.getCompany_id());
					extraDTO = new ExtraDAO().searchOne(extraDTO);

					CompanyDTO companyDTO = new CompanyDTO();
					companyDTO.setId(reservationDTO.getCompany_id());
					companyDTO = new CompanyDAO().selectOne(companyDTO);
					
					request.setAttribute("view", extraDTO);
					request.setAttribute("company", companyDTO);
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/search/searchView.jsp");
				} else {
					request.setAttribute("message", "서비스 이용에 불편을 끼쳐드려서 죄송합니다.");
					request.setAttribute("path", "./searchMain.search");
					
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		return actionForward;
	}
	
	private ReservMemberDTO reservationGet(HttpServletRequest request) {
		ReservMemberDTO reservationDTO = new ReservMemberDTO();
		
		reservationDTO.setCompany_id(request.getParameter("company_id"));
		reservationDTO.setContents(request.getParameter("contents"));
		reservationDTO.setHall_name(request.getParameter("hall_name"));
		reservationDTO.setId(request.getParameter("id"));
		reservationDTO.setReserv_date(request.getParameter("reserv_date"));
		reservationDTO.setFemale(request.getParameter("female"));
		reservationDTO.setMale(request.getParameter("male"));
		reservationDTO.setReserv_time(request.getParameter("reserv_time"));
		reservationDTO.setConfirm("false");
		reservationDTO.setTel(request.getParameter("tel"));
		
		return reservationDTO;
	}
}
