package com.weddingform.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;

//신고하기

public class ReportDAO {
	
	public ReportDTO selectOne(ReportDTO reportDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from report where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, reportDTO.getId());
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			reportDTO.setCompany_name(rs.getString("company_name"));
			reportDTO.setContents(rs.getString("contents"));
			reportDTO.setId(rs.getString("id"));
			reportDTO.setNum(rs.getInt("num"));
			reportDTO.setPw(rs.getString("pw"));
			reportDTO.setTitle(rs.getString("title"));
			reportDTO.setReg_date(rs.getDate("reg_date"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return reportDTO;
	}
	
	public int getTotal() throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select count(*) from report";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}
	
	public ArrayList<ReportDTO> selectList(MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		
		StringBuffer sb = new StringBuffer();
		sb.append("select * from ");
		sb.append("(select rownum R, N.* from ");
		sb.append("(select * from report order by num desc) N) ");
		sb.append("where r between ? and ? ");
		
		PreparedStatement st = con.prepareStatement(sb.toString());
		st.setInt(1, makeRow.getStartRow());
		st.setInt(2, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<ReportDTO> ar = new ArrayList<>();
		ReportDTO reportDTO = null;
		while(rs.next()) {
			reportDTO = new ReportDTO();
			reportDTO.setCompany_name(rs.getString("company_name"));
			reportDTO.setContents(rs.getString("contents"));
			reportDTO.setId(rs.getString("id"));
			reportDTO.setNum(rs.getInt("num"));
			reportDTO.setPw(rs.getString("pw"));
			reportDTO.setTitle(rs.getString("title"));
			reportDTO.setReg_date(rs.getDate("reg_date"));
			ar.add(reportDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	////////////////////////////////////////////////////////////////////////////
	
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
