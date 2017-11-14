package com.weddingform.eung.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.weddingform.util.DBConnector;

public class ReservMemberDAO {
	
	/*public static void main(String[] args) {
		ReservationDTO reservationDTO = new ReservationDTO();
		
		reservationDTO.setContents("test");
		reservationDTO.setHall_name("test");
		reservationDTO.setId("test");
		reservationDTO.setName("test");
		reservationDTO.setReserv_date("test");
		
		try {
			new ReservationDAO().insert(reservationDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/

	public int insert(ReservMemberDTO reservationDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into reserv_member values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, reservationDTO.getId());
		st.setString(2, reservationDTO.getHall_name());
		st.setString(3, reservationDTO.getReserv_date());
		st.setString(4, reservationDTO.getContents());
		st.setString(5, reservationDTO.getCompany_id());
		st.setString(6, reservationDTO.getFemale());
		st.setString(7, reservationDTO.getMale());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
}
