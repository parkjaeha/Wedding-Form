<%@page import="com.dowon.util.DBConnector"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 //1.����ڰ� �Է��� ���̵� ������
 String id=request.getParameter("id");
 //2.�ش���̵� �����ϴ��� �˻�
 Connection con=null;
 PreparedStatement pstmt=null;
 ResultSet rs=null;
 boolean result=false;
 try{
  con=DBConnector.getConnect();
  String sql="select * from hospital where id=?";
  pstmt=con.prepareStatement(sql);
  pstmt.setString(1, id);
  rs=pstmt.executeQuery();
  if(rs.next()){
   result=true;
  }
 }catch(SQLException se){
  System.out.println(se.getMessage());
  
 }finally{
  rs.close();
  pstmt.close();
  con.close();
 }
 
 ////////// 3.xml�� ��� �����ϱ� ///////////
 response.setContentType("text/xml;charset=euc-kr");
 PrintWriter pw=response.getWriter();
 pw.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
 pw.println("<data>");
 pw.println("<result>" + result + "</result>");
 pw.println("</data>");
 pw.close();
 
%>