package com.weddingform.notice;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.notice.NoticeDTO;
import com.weddingform.Board.BoardDAO;
import com.weddingform.Board.BoardDTO;
import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;
import com.weddingform.util.TableSearch;

//공지 게시판

public class NoticeDAO implements BoardDAO{
	
	/*public static void main(String[] args) throws Exception {
		TableSearch tableSearch = new TableSearch();
		tableSearch.setKind("title");
		tableSearch.setSearch("");
		int s = new NoticeDAO().getTotalCount(tableSearch);
		System.out.println(s);
	}*/

	@Override
	public int getTotalCount(TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(num),0) from notice where "+tableSearch.getKind()+" like ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}

	@Override
	public int update(BoardDTO noticeDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update notice set title=?, contents=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int delete(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="delete notice where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int hitUpdate(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update notice set hit=hit+1 where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int insert(BoardDTO noticeDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="insert into notice values(board_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		
		String sql="select * from notice where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs=st.executeQuery();
		
		NoticeDTO noticeDTO=null;
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		 DBConnector.disConnect(rs, st, con);
		return noticeDTO;
	}

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		
		List<BoardDTO> ar=new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from notice where "+tableSearch.getKind()+" like ? order by num desc) N)"
				+ "where R between ? and ?";
		
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
				NoticeDTO noticeDTO=new NoticeDTO();
				noticeDTO.setNum(rs.getInt("num"));
				noticeDTO.setTitle(rs.getString("title"));
				noticeDTO.setWriter(rs.getString("writer"));
				noticeDTO.setContents(rs.getString("contents"));
				noticeDTO.setReg_date(rs.getString("reg_date"));
				noticeDTO.setHit(rs.getInt("hit"));
				ar.add(noticeDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}

}
