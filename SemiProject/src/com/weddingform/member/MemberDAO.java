package com.weddingform.member;

import java.sql.Connection;
import java.sql.PreparedStatement;


//사용자 정보

public class MemberDAO {

			
			//insert
			public int insert(MemberDTO memberDTO, Connection con) throws Exception {
				String sql ="insert into member values(?,?,?,?)";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, memberDTO.getId());
				st.setString(2, memberDTO.getBirth());
				st.setString(3, memberDTO.getGender());
				st.setString(4, memberDTO.getWedding_day());
				int result = st.executeUpdate();
				
				st.close();
				return result;
			}
	
}
