package com.weddingform.extra;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.weddingform.company.CompanyDTO;
import com.weddingform.util.DBConnector;



public class ExtraDAO {

	//insert
	public int insert(ExtraDTO extraDTO, Connection con) throws Exception {
		String sql ="insert into extra values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, extraDTO.getId());
		st.setString(2, extraDTO.getRegion());
		st.setString(3, extraDTO.getType());
		st.setString(4, extraDTO.getMeal_cost());
		st.setString(5, extraDTO.getMeal_menu());
		st.setString(6, extraDTO.getVisitor());
		st.setString(7, extraDTO.getSubway());
		st.setString(8, extraDTO.getHall_cost());
		st.setString(9, extraDTO.getHall_name());
		
		
		int result = st.executeUpdate();
		System.out.println("extra insert");
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
}
