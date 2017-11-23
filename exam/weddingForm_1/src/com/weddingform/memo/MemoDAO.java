package com.weddingform.memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;

//청첩장 댓글

public class MemoDAO {
	
	public int getTotal(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select count(*) from memo where id=?";
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
	
	// delete
	public int delete(String pw, int num)throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "delete from memo where password=? and num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pw);
		st.setInt(2, num);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}

	//insert
	public int insert(MemoDTO memoDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into memo values(board_seq.nextval,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, memoDTO.getId());
		st.setString(2, memoDTO.getName());
		st.setString(3, memoDTO.getPassword());
		st.setString(4, memoDTO.getContents());
		
	    int result=st.executeUpdate();
	  
	    DBConnector.disConnect(st, con);
		
		
		return result;
	}
	
	
	
	public List<MemoDTO> selectList(String id, MakeRow makeRow) throws Exception{
		Connection con=DBConnector.getConnect();
		List<MemoDTO> ar=new ArrayList<>();
		
		String sql="select V.* from " + 
				"(select Rownum R, N.* from " + 
				"(select * from memo where id=? order by num desc) N) V " + 
				"where R between ? and ?";
		PreparedStatement st=con.prepareStatement(sql);

		st.setString(1, id);
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			MemoDTO memoDTO=new MemoDTO();
			
			memoDTO.setNum(rs.getInt("num"));
			memoDTO.setId(rs.getString("id"));
			memoDTO.setName(rs.getString("name"));
			memoDTO.setPassword(rs.getString("password"));
			memoDTO.setContents(rs.getString("contents"));
			ar.add(memoDTO);
			
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
}
