package com.weddingform.upload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.util.DBConnector;

//�뾽濡쒕뱶 �궗吏�

public class UploadDAO {
	
	public int getTotal(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select count(*) from uploads where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}
	
	////////////////////////////////////////////////////////////////////

	//write
	public int insert(UploadDTO uploadDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into uploads values(?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		System.out.println("upload insert before");
		
		st.setInt(1, uploadDTO.getNum());
		st.setString(2, uploadDTO.getFname());
		st.setString(3, uploadDTO.getId());
		
		int result = st.executeUpdate();
		System.out.println("upload insert after");
		System.out.println("File Upload : " + uploadDTO.getNum());
		DBConnector.disConnect(st, con);
		
		return result;	
	}
	
	
	//select one
		public UploadDTO selectOne(String id) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="select * from (select * from uploads where id=? order by num desc) where rownum = 1";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			
			System.out.println("selectOne");
			ResultSet rs = st.executeQuery();
			
			
			UploadDTO  uploadDTO = new UploadDTO();
			if(rs.next()) {
				uploadDTO.setNum(rs.getInt("num"));
				uploadDTO.setFname(rs.getString("fname"));
				uploadDTO.setId(rs.getString("id"));
			}else {
				uploadDTO= null;
			}
			
			DBConnector.disConnect(rs, st, con);
			
			return uploadDTO;
		}
		
		//select one
		public List<UploadDTO> selectALL(String id) throws Exception {
			Connection con = DBConnector.getConnect();
			String sql ="select * from uploads where id=? order by num desc";
			PreparedStatement st = con.prepareStatement(sql);
			System.out.println("uploadDTO ID: " + id);
			st.setString(1, id);	
			ResultSet rs = st.executeQuery();
			List<UploadDTO> ar = new ArrayList<UploadDTO>();
			
			UploadDTO uploadDTO = null;
			while(rs.next()){
				 uploadDTO = new UploadDTO();
				uploadDTO.setId(rs.getString("id"));
				uploadDTO.setNum(rs.getInt("num"));
				uploadDTO.setFname(rs.getString("fname"));
				
				System.out.println(" name: " + uploadDTO.getFname());
				ar.add(uploadDTO);
			}
			
			DBConnector.disConnect(rs, st, con);
			
			return ar;
		}
	
}
