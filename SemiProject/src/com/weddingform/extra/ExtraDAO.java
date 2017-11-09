package com.weddingform.extra;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.weddingform.company.CompanyDTO;
import com.weddingform.util.DBConnector;

//회원 가입시 추가 정보

public class ExtraDAO {

	//insert
	public int insert(ExtraDTO ExtraDTO, Connection con) throws Exception {
		String sql ="insert into extra values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, ExtraDTO.getId());
		st.setString(2, ExtraDTO.getRegion());
		st.setString(3, ExtraDTO.getType());
		st.setString(4, ExtraDTO.getMeal_cost());
		st.setString(5, ExtraDTO.getMeal_menu());
		st.setString(6, ExtraDTO.getVisitor());
		st.setString(7, ExtraDTO.getSubway());
		st.setString(8, ExtraDTO.getHall_cost());
		st.setString(9, ExtraDTO.getHall_name());
		
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
}
