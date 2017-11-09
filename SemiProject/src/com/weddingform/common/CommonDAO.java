package com.weddingform.common;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.weddingform.util.DBConnector;

// 공통 회원 정보

public class CommonDAO {

	//delete
		public int delete(CommonDTO commonDTO, Connection con) throws Exception{
			String sql ="delete common where id=?"; 
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, commonDTO.getId());
			int result = st.executeUpdate();
			st.close();
			return result;
		}

		//insert
		public int insert(CommonDTO commonDTO, Connection con) throws Exception {
			String sql ="insert into common values(?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, commonDTO.getId());
			st.setString(2, commonDTO.getPw());
			st.setString(3, commonDTO.getName());
			st.setString(4, commonDTO.getAddr());
			st.setString(5, commonDTO.getPhone());
			st.setString(6, commonDTO.getMail());
			st.setString(7, commonDTO.getJob());
			int result = st.executeUpdate();
			st.close();
			return result;
		}
	
	//select one
	public CommonDTO selectOne(CommonDTO commonDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from common where id=? and pw=? and job=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, commonDTO.getId());
		st.setString(2, commonDTO.getPw());
		st.setString(3, commonDTO.getJob());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			commonDTO.setName(rs.getString("name"));
			commonDTO.setAddr(rs.getString("addr"));
			commonDTO.setPhone(rs.getString("phone"));
			commonDTO.setMail(rs.getString("mail"));
			
		}else {
			commonDTO= null;
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return commonDTO;
	}
	
	//id check
	public boolean idCheck(String id) throws Exception{
		boolean check =true;
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from common where id=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			check =false;
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return check;
	}
	
	
}
