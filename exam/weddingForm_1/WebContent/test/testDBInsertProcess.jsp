<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.weddingform.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] id = request.getParameter("id").split(",");
	String[] pw = request.getParameter("pw").split(",");
	String[] name = request.getParameter("name").split(",");
	String[] addr = request.getParameter("addr").split(",");
	String[] phone = request.getParameter("phone").split(",");
	String[] mail = request.getParameter("email").split(",");
	String[] job = request.getParameter("job").split(",");
%>

<%
	// Common Insert
	for(int i =210; i<id.length; i++) {
		Connection con = DBConnector.getConnect();
	
		String sql = "insert into common values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id[i]);
		st.setString(2, pw[i]);
		st.setString(3, name[i]);
		st.setString(4, addr[i]);
		st.setString(5, phone[i]);
		st.setString(6, mail[i]);
		st.setString(7, job[i]);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
	}
	
%>
