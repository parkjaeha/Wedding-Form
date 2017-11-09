package com.weddingform.common;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.company.CompanyDAO;
import com.weddingform.company.CompanyDTO;
import com.weddingform.extra.ExtraDAO;
import com.weddingform.extra.ExtraDTO;
import com.weddingform.member.MemberDAO;
import com.weddingform.member.MemberDTO;
import com.weddingform.util.DBConnector;

public class CommonJoinUpService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		String method = request.getMethod();

		if(method.equals("GET")) {

			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/commonJoin.jsp");

		}else {

			Connection con =null;
			try {
				con = DBConnector.getConnect();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			CommonDTO commonDTO = new CommonDTO();
			CommonDAO commonDAO =new CommonDAO();
			ExtraDTO extraDTO = new ExtraDTO();
			ExtraDAO extraDAO = new ExtraDAO();
			MemberDTO memberDTO = null;
			MemberDAO memberDAO = null;
			CompanyDTO companyDTO = null;
			CompanyDAO companyDAO = null;
			
			
			String job = request.getParameter("job");
			String id = request.getParameter("id");
			String pw1 = request.getParameter("pw1");
			String name = request.getParameter("name");
			String addr_main = request.getParameter("addr_main");
			String addr_sub = request.getParameter("addr_sub");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String email_sub = request.getParameter("select_result");
			String gender = "";
			String birth = "";
			String wedding_day = "";
			String company_name ="";
			String company_tel ="";
			String company_number ="";
			
			String region="";
			String type = "";
			String meal_cost="";
			String meal_menu ="";
			String visitor = "";
			String subway ="";
			String hall_cost = "";
			String hall_name = "";
			
			
		
			int result1 = 0,result2=0, result3=0;
			
			if(job.equals("on")) {
				job="Customer";
			}else {
				job="Business";
			}
		
			commonDTO.setId(id);
			commonDTO.setPw(pw1);
			commonDTO.setName(name);
			commonDTO.setJob(job);
			commonDTO.setAddr(addr_main+" "+addr_sub);
			commonDTO.setPhone(phone);
			commonDTO.setMail(email+"@"+email_sub);
			
			extraDTO.setId(id);
			extraDTO.setRegion(region);
			extraDTO.setType(type);
			extraDTO.setMeal_cost(meal_cost);
			extraDTO.setMeal_menu(meal_menu);
			extraDTO.setVisitor(visitor);
			extraDTO.setSubway(subway);
			extraDTO.setHall_cost(hall_cost);
			extraDTO.setHall_name(hall_name);
			
			
			try {
				result1 = commonDAO.insert(commonDTO, con);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("job:" +job);
			
			if(job.equals("Customer")) {
			//일반인 회원가입 정보 등록

			memberDTO = new MemberDTO();
			memberDAO = new MemberDAO();
			gender  = request.getParameter("gender");
			birth = request.getParameter("birth");
			wedding_day = request.getParameter("wedding_day");
			 
			memberDTO.setId(id);
			memberDTO.setGender(gender);
			memberDTO.setBirth(birth);
			memberDTO.setWedding_day(wedding_day);
			 
			try {
				result2 = memberDAO.insert(memberDTO, con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}else if(job.equals("Business")){
			// 사업자 회원가입 정보 등록
			companyDTO = new CompanyDTO();
			companyDAO = new CompanyDAO();
			
			company_name = request.getParameter("company_name");
			company_tel = request.getParameter("company_tel");
			company_number = request.getParameter("company_number");
			
			 region = request.getParameter("region");
			 type = request.getParameter("type");
			 meal_cost = request.getParameter("meal_cost");
			 meal_menu = request.getParameter("meal_menu");
			 visitor = request.getParameter("visitor");
			 subway = request.getParameter("subway");
			 hall_cost = request.getParameter("hall_cost");
			 hall_name = request.getParameter("hall_name");
			
			companyDTO.setId(id);
			companyDTO.setCompany_name(company_name);
			companyDTO.setCompany_tel(company_tel);
			companyDTO.setCompany_number(company_number);
			
			
				try {
					result2 = companyDAO.insert(companyDTO, con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			try {
				result3 = extraDAO.insert(extraDTO, con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			System.out.println("result: "+ result1 + "result2:" + result2+ "result3:" + result3);
			
			if(result1>0 && result2>0 && result3>0 ) {
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/commonLogin.jsp");
			}else {
				request.setAttribute("message", "회원가입 실패");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}

		}
		return actionFoward;
	}

}
