<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.weddingform.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] id = request.getParameter("id").split(",");
	String[] name = request.getParameter("company_name").split(",");
	String[] addr = request.getParameter("company_addr").split(",");
	String[] phone = request.getParameter("company_tel").split(",");
	String[] number = request.getParameter("company_number").split(",");
	String[] lat = request.getParameter("latitude").split(",");
	String[] lng = request.getParameter("longitude").split(",");
%>

<%
	 int result = 0;
	// Company Insert
	try {
		for(int i = 0; i<16; i++) {
			Connection con = DBConnector.getConnect();
		
			String sql = "insert into company values(?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, id[i]);
			st.setString(2, name[i]);
			st.setString(3, phone[i]);
			st.setString(4, number[i]);
			st.setString(5, addr[i]);
			st.setDouble(6, Double.parseDouble(lat[i]));
			st.setDouble(7, Double.parseDouble(lng[i]));
	
			result = st.executeUpdate();
			
			DBConnector.disConnect(st, con);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<h1>result: <%= result %></h1>
