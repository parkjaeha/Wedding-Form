package com.weddingform.function;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.util.DBConnector;

public class CalendarDAO {
	
	//update
			public int update(CalendarDTO calendarDTO)throws Exception{
				Connection con = DBConnector.getConnect();
				String sql ="update cevent set title=?,date_start=?,date_end=?,url=?,classname=?,editable=?,contents=? where id=?";
				PreparedStatement st = con.prepareStatement(sql);
				
				st.setString(1, calendarDTO.getTitle());
				st.setString(2, calendarDTO.getDate_start());
				st.setString(3, calendarDTO.getDate_end());
				st.setString(4, calendarDTO.getUrl());
				st.setString(5, calendarDTO.getClassName());
				st.setString(6, calendarDTO.getEditable());
				st.setString(7, calendarDTO.getContents());
				st.setInt(8, calendarDTO.getId());
			
				System.out.println("before executupdate");
				int result = st.executeUpdate();
				System.out.println("aftre executupdate");
				
				DBConnector.disConnect(st, con);
				System.out.println("result update : " + result );
				return result;
				
			}
	
	//delete
			public int delete(int id) throws Exception{
				Connection con = DBConnector.getConnect();
				String sql ="delete cevent where id=?"; 
				PreparedStatement st = con.prepareStatement(sql);
				st.setInt(1, id);
				int result = st.executeUpdate();
				DBConnector.disConnect(st, con);

				System.out.println("delete result : " + result);
				
				return result;
			}
	
	//write
		public int insert(CalendarDTO calendarDTO) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="insert into cevent values(calendar_seq.nextval,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, calendarDTO.getTitle());
			st.setString(2, calendarDTO.getDate_start());
			st.setString(3, calendarDTO.getDate_end());
			st.setString(4, calendarDTO.getUrl());
			st.setString(5, calendarDTO.getClassName());
			st.setString(6, calendarDTO.getEditable());
			st.setString(7, calendarDTO.getContents());
			int result = st.executeUpdate();
			
			DBConnector.disConnect(st, con);
			
			return result;
		}
	
		public CalendarDTO selectOne(int id) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="select * from cevent where id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			System.out.println("calendar DTO id : " + id);
			ResultSet rs = st.executeQuery();
			CalendarDTO calendarDTO = null;
			if(rs.next()) {
				calendarDTO = new CalendarDTO();
				calendarDTO.setId(rs.getInt("id"));
				calendarDTO.setTitle(rs.getString("title"));
				calendarDTO.setContents(rs.getString("contents"));
				calendarDTO.setDate_start(rs.getString("date_start"));
				calendarDTO.setDate_end(rs.getString("date_end"));
				calendarDTO.setUrl(rs.getString("url"));
				calendarDTO.setClassName(rs.getString("className"));
				calendarDTO.setEditable(rs.getString("editable"));
			}
			System.out.println("data:" +calendarDTO);
			System.out.println("calendarDTO id: " +calendarDTO.getId() + "calendarDTO title: "+ calendarDTO.getTitle() + "calendarDTO contents: "+ calendarDTO.getContents());
			
			DBConnector.disConnect(rs, st, con);
			
			return calendarDTO;
		}
		
		
		
		public List<CalendarDTO> selectALL(String date) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="select * from cevent where date_start like ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, date);
			System.out.println("before");
			ResultSet rs = st.executeQuery();

			System.out.println("after");
			List<CalendarDTO> ar = new ArrayList<>();
			CalendarDTO calendarDTO = null;
			while(rs.next()) {
				calendarDTO = new CalendarDTO();
				calendarDTO.setId(rs.getInt("id"));
				calendarDTO.setTitle(rs.getString("title"));
				calendarDTO.setDate_start(rs.getString("date_start"));
				calendarDTO.setDate_end(rs.getString("date_end"));
				calendarDTO.setUrl(rs.getString("url"));
				calendarDTO.setClassName(rs.getString("classname"));
				calendarDTO.setEditable(rs.getString("editable"));
				ar.add(calendarDTO);
			
			}
			
			DBConnector.disConnect(rs, st, con);
			
			return ar;
		}
		
		
}
