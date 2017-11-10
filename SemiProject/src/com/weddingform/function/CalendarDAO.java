package com.weddingform.function;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.util.DBConnector;

public class CalendarDAO {

	//delete
		public int delete(int num) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="delete calendar where num=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, num);
			int result = st.executeUpdate();
			DBConnector.disConnect(st, con);
			
			return result;
		}
		
	
	
	//write
		public int insert(CalendarDTO calendarDTO) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="insert into calendar values(CALENDAR_SEQ.nextval,?,?)";
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, calendarDTO.getData());
			st.setString(2, calendarDTO.getId());
			int result = st.executeUpdate();
			
			DBConnector.disConnect(st, con);
			
			return result;
			
			
		}
	
		//update
		public int update(CalendarDTO calendarDTO) throws Exception{
			Connection con = DBConnector.getConnect();
			String sql ="update calendar set data=?,id=? where num=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, calendarDTO.getData());
			st.setString(2, calendarDTO.getId());
			st.setInt(3, calendarDTO.getNum());
			int result = st.executeUpdate();
			
			DBConnector.disConnect(st, con);
			
			return result;
			
		}
		
		
		public CalendarDTO selectOne(String id) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="select * from calendar where id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			CalendarDTO calendarDTO = null;
			if(rs.next()) {
				calendarDTO = new CalendarDTO();
				calendarDTO.setNum(rs.getInt("num"));
				calendarDTO.setData(rs.getString("data"));
				calendarDTO.setId(rs.getString("id"));
			}
			
			DBConnector.disConnect(rs, st, con);
			
			return calendarDTO;
		}
		
		
		//list
		public List<CalendarDTO> selectList(String id) throws Exception {
			Connection con = DBConnector.getConnect();
			
			List<CalendarDTO> ar = new ArrayList<>();
			
			String sql = "select * from calendar where id = ? order by num desc";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,id);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				CalendarDTO calendarDTO = new CalendarDTO();
				calendarDTO.setId(rs.getString("id"));
				calendarDTO.setNum(rs.getInt("num"));
				calendarDTO.setData(rs.getString("data"));
				ar.add(calendarDTO);
			}
			
			DBConnector.disConnect(rs, st, con);
			
			return ar;
		}

		
		
		
		
}
