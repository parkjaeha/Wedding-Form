package com.weddingform.report;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.weddingform.Board.BoardDTO;
import com.weddingform.qna.QnaDTO;
import com.weddingform.util.DBConnector;

//신고하기

public class ReportDAO {
	public int insert(ReportDTO reportDTO) throws Exception {
		Connection con=DBConnector.getConnect();
	

		String sql="insert into report "
				+ "values(board_seq.nextval,?,?,?,?,?,sysdate)";
		PreparedStatement st=con.prepareStatement(sql);
	
		st.setString(1, reportDTO.getPw());
		st.setString(2, reportDTO.getId());
		st.setString(3, reportDTO.getTitle());
		st.setString(4, reportDTO.getContents());
		st.setString(5, reportDTO.getCompany_name());
		
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
}
