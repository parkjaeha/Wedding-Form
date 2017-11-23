<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.weddingform.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] id = request.getParameter("id").split(",");
	String[] name = request.getParameter("name").split(",");
	String[] addr = request.getParameter("addr").split(",");
	String[] type = request.getParameter("type").split(",");
	String[] meal_cost = request.getParameter("meal_cost").split(",");
	String[] meal_menu = request.getParameter("meal_menu").split(",");
	String[] visitor = request.getParameter("visitor").split(",");
	String[] hall_cost = request.getParameter("hall_cost").split(",");
	
	ArrayList<String> region = new ArrayList<String>();
	for(int i=0; i<addr.length; i++) {
		String[] temp = addr[i].split(" "); 
		region.add(temp[0] + " " + temp[1]);
		System.out.println(temp[0] + " " + temp[1]);
	}
	
	int result = 0;
	//Extra Insert
	for(int i =200; i<236; i++) {
		Connection con = DBConnector.getConnect();
	
		String sql = "insert into extra values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id[i]);
		st.setString(2, region.get(i));
		st.setString(3, type[i]);
		st.setString(4, meal_cost[i]);
		st.setString(5, meal_menu[i]);
		st.setString(6, visitor[i]);
		st.setString(7, "subway");
		st.setString(8, hall_cost[i]);
		st.setString(9, name[i]);
		
		result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
	}
%>

<%= addr.length %>
<%= id.length %>
<%= name.length %>
<%= type.length %>
<%= meal_cost.length %>