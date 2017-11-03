package com.weddingform.eung.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;

public class CommonDAO {
	
	public ArrayList<CommonDTO> selectList() throws Exception {
		Connection con = DBConnector.getConnect();
		ArrayList<CommonDTO> ar = new ArrayList<>();
		CommonDTO commonDTO = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("select * from ");
		sb.append("(select ROWNUM R, N.* from ");
		sb.append("(select * from common)N)");
		
		PreparedStatement st = con.prepareStatement(sb.toString());
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			commonDTO = new CommonDTO();
			commonDTO.setAddr(rs.getString("addr"));
			commonDTO.setId(rs.getString("id"));
			commonDTO.setJob(rs.getString("job"));
			commonDTO.setMail(rs.getString("mail"));
			commonDTO.setName(rs.getString("name"));
			commonDTO.setPhone(rs.getString("phone"));
			commonDTO.setPw(rs.getString("pw"));
			ar.add(commonDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}

}
