package com.weddingform.function;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.weddingform.util.DBConnector;

public class CalendarDAO {

	//write
		public int insert(CalendarDTO calendarDTO) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="insert into calendar values(?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1, calendarDTO.getNum());
			st.setString(2, calendarDTO.getData());
			int result = st.executeUpdate();
			
			DBConnector.disConnect(st, con);
			
			return result;
			
			
		}
	
		
		public CalendarDTO selectOne(int num) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="select * from calendar where num=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, num);
			ResultSet rs = st.executeQuery();
			CalendarDTO calendarDTO = null;
			if(rs.next()) {
				calendarDTO = new CalendarDTO();
				calendarDTO.setNum(rs.getInt("num"));
				calendarDTO.setData(rs.getString("data"));
			}
			
			DBConnector.disConnect(rs, st, con);
			
			return calendarDTO;
		}
		
}
