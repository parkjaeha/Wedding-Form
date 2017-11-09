package com.weddingform.eung.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.weddingform.util.DBConnector;

public class ReservationDAO {
	
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

	public int insert(ReservationDTO reservationDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into reservation values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, reservationDTO.getId());
		st.setString(2, reservationDTO.getName());
		st.setString(3, reservationDTO.getHall_name());
		st.setString(4, reservationDTO.getReserv_date());
		st.setString(5, reservationDTO.getContents());
		st.setString(6, reservationDTO.getCompany_id());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
}
