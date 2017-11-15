package com.weddingform.eung.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;

public class ReservMemberDAO {
	
	/*public static void main(String[] args) throws Exception {
		ArrayList<ReservMemberDTO> ar = new ReservMemberDAO().selectList("ID 01");
		System.out.println(ar.get(0).getHall_name());
	}*/
	public int confirmUpdate(String member_id, String company_id, String confirm) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "update reserv_member set confirm=? where id=? and company_id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, confirm);
		st.setString(2, member_id);
		st.setString(3, company_id);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);

		return result;
	}
	
	public ArrayList<ReservMemberDTO> selectList(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		ArrayList<ReservMemberDTO> ar = new ArrayList<>();
		
		String sql = "select * from reserv_member where company_id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();

		ReservMemberDTO reservMemberDTO = null;
		while(rs.next()) {
			reservMemberDTO = new ReservMemberDTO();
			reservMemberDTO.setId(rs.getString("id"));
			reservMemberDTO.setCompany_id(rs.getString("company_id"));
			reservMemberDTO.setContents(rs.getString("contents"));
			reservMemberDTO.setFemale(rs.getString("female"));
			reservMemberDTO.setMale(rs.getString("male"));
			reservMemberDTO.setHall_name(rs.getString("hall_name"));
			reservMemberDTO.setReserv_date(rs.getString("reserv_date"));
			reservMemberDTO.setReserv_time(rs.getString("reserv_time"));
			reservMemberDTO.setConfirm(rs.getString("confirm"));
			ar.add(reservMemberDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}

	public int insert(ReservMemberDTO reservationDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into reserv_member values(?,?,?,?,?,?,?,?,'false')";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, reservationDTO.getId());
		st.setString(2, reservationDTO.getHall_name());
		st.setString(3, reservationDTO.getReserv_date());
		st.setString(4, reservationDTO.getContents());
		st.setString(5, reservationDTO.getCompany_id());
		st.setString(6, reservationDTO.getFemale());
		st.setString(7, reservationDTO.getMale());
		st.setString(8, reservationDTO.getReserv_time());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
}
