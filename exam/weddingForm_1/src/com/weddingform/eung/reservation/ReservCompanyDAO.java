package com.weddingform.eung.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;

public class ReservCompanyDAO {
	/*public static void main(String[] args) throws Exception {
		ReservCompanyDTO reservCompanyDTO  = new ReservCompanyDTO();
		reservCompanyDTO.setId("ID 01");
		reservCompanyDTO.setMember_id("MEMBER_ID 01");
		reservCompanyDTO.setReserv_date("2017-11-11 13:00");
		reservCompanyDTO.setTitle("FEMALE 01 ♥ MALE 01");
		
		System.out.println(new ReservCompanyDAO().insert(reservCompanyDTO));
		
	}*/
	
	public boolean dateCheck(ReservCompanyDTO reservCompanyDTO) throws Exception {
		boolean check = true;
		Connection con = DBConnector.getConnect();

		String sql = "select * from reserv_company where reserv_date=? and id=? and member_id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, reservCompanyDTO.getReserv_date());
		st.setString(2, reservCompanyDTO.getId());
		st.setString(3, reservCompanyDTO.getMember_id());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			check = !check;
		}
		
		return check;
	}
	
	public int delete(String member_id, String company_id) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "delete from reserv_company where id=? and member_id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, company_id);
		st.setString(2, member_id);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public int insert(ReservCompanyDTO reservCompanyDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into reserv_company values(?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		
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
