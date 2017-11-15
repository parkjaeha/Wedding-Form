package com.weddingform.eung.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;

public class ReservCompanyDAO {
	/*public static void main(String[] args) throws Exception {
		ArrayList<ReservCompanyDTO> ar = new ReservCompanyDAO().selectOne("ID 01");
		System.out.println(ar.get(2).getReserv_date());
	}*/
	
	public int insert(ReservCompanyDTO reservCompanyDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into values(?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		//////////////오류/////////////////////////
		st.setString(1, reservCompanyDTO.getId());
		st.setString(2, reservCompanyDTO.getMember_id());
		st.setString(3, reservCompanyDTO.getTitle());
		st.setString(4, reservCompanyDTO.getReserv_date());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}

	public ArrayList<ReservCompanyDTO> selectOne(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		ArrayList<ReservCompanyDTO> ar = new ArrayList<>();
		
		String sql = "select * from reserv_company where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		ReservCompanyDTO reservCompanyDTO = null;
		while(rs.next()) {
			reservCompanyDTO = new ReservCompanyDTO();
			reservCompanyDTO.setId(rs.getString("id"));
			reservCompanyDTO.setMember_id(rs.getString("member_id"));
			reservCompanyDTO.setReserv_date(rs.getString("reserv_date"));
			reservCompanyDTO.setTitle(rs.getString("title"));
			ar.add(reservCompanyDTO);
		}
		
		return ar;
	}
}
