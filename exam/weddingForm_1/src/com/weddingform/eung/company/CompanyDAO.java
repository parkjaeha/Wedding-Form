package com.weddingform.eung.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.weddingform.util.DBConnector;

public class CompanyDAO {

	public CompanyDTO selectOne(CompanyDTO companyDTO) throws Exception {
	      Connection con = DBConnector.getConnect();
	      String sql ="select * from company where id=?";
	      PreparedStatement st = con.prepareStatement(sql);
	      st.setString(1, companyDTO.getId());
	      ResultSet rs = st.executeQuery();
	      if(rs.next()) {
	    	  companyDTO.setId(rs.getString("id"));
	    	  companyDTO.setCompany_addr(rs.getString("company_addr"));
	          companyDTO.setCompany_name(rs.getString("company_name"));
	          companyDTO.setCompany_number(rs.getString("company_number"));
	          companyDTO.setCompany_tel(rs.getString("company_tel"));
	         
	      }else {
	    	  companyDTO= null;
	      }
	      
	      DBConnector.disConnect(rs, st, con);
	      
	      return companyDTO;
	   }
}
