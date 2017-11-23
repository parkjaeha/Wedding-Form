package com.weddingform.memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingform.action.Action;
import com.weddingform.action.ActionForward;
import com.weddingform.util.DBConnector;

//청첩장 댓글

public class MemoDAO {

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
	
	
	
	public List<MemoDTO> selectList() throws Exception{
		Connection con=DBConnector.getConnect();
		List<MemoDTO> ar=new ArrayList<>();
		String sql="select * from memo order by num asc";
		PreparedStatement st=con.prepareStatement(sql);
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
