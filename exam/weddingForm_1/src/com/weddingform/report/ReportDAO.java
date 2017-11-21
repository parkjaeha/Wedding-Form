package com.weddingform.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;

//신고하기

public class ReportDAO {
	/*public static void main(String[] args) throws Exception {
		ReportDTO reportDTO = new ReportDTO();
		
		new ReportDAO().selectList(reportDTO);
	}*/
	
	public ArrayList<ReportDTO> selectList(ReportDTO reportDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from report";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<ReportDTO> ar = new ArrayList<>();
		while(rs.next()) {
			reportDTO.setCompany_name(rs.getString("company_name"));
			reportDTO.setContents(rs.getString("contents"));
			reportDTO.setId(rs.getString("id"));
			reportDTO.setNum(rs.getInt("num"));
			reportDTO.setPw(rs.getString("pw"));
			reportDTO.setTitle(rs.getString("title"));
			ar.add(reportDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	public int insert(ReportDTO reportDTO) throws Exception {
		Connection con=DBConnector.getConnect();
	

		String sql="insert into report "
				+ "values(board_seq.nextval,?,?,?,?,?,sysdate)";
		PreparedStatement st=con.prepareStatement(sql);
	
		st.setString(1, reportDTO.getPw());
		st.setString(2, reportDTO.getId());
		st.setString(3, reportDTO.getTitle());
		st.setString(4, reportDTO.getContents());
		st.setString(5, reportDTO.getCompany_name());
		
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
}
