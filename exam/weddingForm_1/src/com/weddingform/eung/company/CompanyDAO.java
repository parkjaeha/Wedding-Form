package com.weddingform.eung.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.weddingform.util.DBConnector;

public class CompanyDAO {
	
	public int insert(CompanyDTO companyDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into company values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, companyDTO.getId());
		st.setString(2, companyDTO.getCompany_name());
		st.setString(3, companyDTO.getCompany_tel());
		st.setString(4, companyDTO.getCompany_number());
		st.setString(5, companyDTO.getCompany_addr());
		st.setDouble(6, companyDTO.getLatitude());
		st.setDouble(7, companyDTO.getLongitude());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}

	public CompanyDTO selectOne(CompanyDTO companyDTO) throws Exception {
	      Connection con = DBConnector.getConnect();
	      String sql ="select * from company where id=? or COMPANY_NAME=?";
	      PreparedStatement st = con.prepareStatement(sql);
	      st.setString(1, companyDTO.getId());
	      st.setString(2, companyDTO.getCompany_name());
	      ResultSet rs = st.executeQuery();
	      if(rs.next()) {
	    	  companyDTO.setId(rs.getString("id"));
	    	  companyDTO.setCompany_addr(rs.getString("company_addr"));
	          companyDTO.setCompany_name(rs.getString("company_name"));
	          companyDTO.setCompany_number(rs.getString("company_number"));
	          companyDTO.setCompany_tel(rs.getString("company_tel"));
	          companyDTO.setLatitude(rs.getDouble("latitude"));
	          companyDTO.setLongitude(rs.getDouble("longitude"));
	         
	      }else {
	    	  companyDTO= null;
	      }
	      
	      DBConnector.disConnect(rs, st, con);
	      
	      return companyDTO;
	   }
}
