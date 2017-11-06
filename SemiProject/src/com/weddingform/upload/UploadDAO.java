package com.weddingform.upload;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.weddingform.util.DBConnector;

//업로드 사진

public class UploadDAO {

	//write
	public int insert(UploadDTO uploadDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into upload values(upload_seq.nextval,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, uploadDTO.getFname());
		st.setString(2, uploadDTO.getOname());
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
		
	}
}
