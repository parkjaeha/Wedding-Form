package com.weddingform.company;

import java.sql.Connection;
import java.sql.PreparedStatement;



//업체 정보 

public class CompanyDAO {

	//insert
	public int insert(CompanyDTO companyDTO, Connection con) throws Exception {
		String sql ="insert into company values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, companyDTO.getId());
		st.setString(2, companyDTO.getCompany_name());
		st.setString(3, companyDTO.getCompany_tel());
		st.setString(4, companyDTO.getCompany_number());
		int result = st.executeUpdate();
		
		st.close();
		return result;
	}
	
}
