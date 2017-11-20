package com.weddingform.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.Board.BoardDAO;
import com.weddingform.Board.BoardDTO;
import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;
import com.weddingform.util.TableSearch;

//후기

public class ReviewDAO implements BoardDAO{
	
	/*public static void main(String[] args) throws Exception {
		TableSearch tableSearch = new TableSearch();
		tableSearch.setKind("title");
		tableSearch.setSearch("");
		
		int result = new ReviewDAO().getTotalCount(tableSearch);
		System.out.println(result);
	}*/

	@Override
	public int getTotalCount(TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(num),0) from review where "+tableSearch.getKind()+" like ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}

	@Override
	public int update(BoardDTO reviewDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update review set title=?, contents=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, reviewDTO.getTitle());
		st.setString(2, reviewDTO.getContents());
		st.setInt(3, reviewDTO.getNum());
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int delete(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="delete review where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	@Override
	public int hitUpdate(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update review set hit=hit+1 where num=?";
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		ReviewDTO reviewDTO=(ReviewDTO)boardDTO;
		
		String sql="insert into review "
				+ "values(board_seq.nextval,?,?,?,sysdate,0,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, reviewDTO.getTitle());
		st.setString(2, reviewDTO.getWriter());
		st.setString(3, reviewDTO.getContents());
		st.setInt(4, reviewDTO.getStar_score());
		st.setString(5, reviewDTO.getType());
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
				
		return result;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select * from review where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs=st.executeQuery();
		
		ReviewDTO reviewDTO=new ReviewDTO();
		if(rs.next()) {
			reviewDTO.setNum(rs.getInt("num"));
			reviewDTO.setTitle(rs.getString("title"));
			reviewDTO.setWriter(rs.getString("writer"));
			reviewDTO.setContents(rs.getString("contents"));
			reviewDTO.setReg_date(rs.getString("reg_date"));
			reviewDTO.setHit(rs.getInt("hit"));
			reviewDTO.setStar_score(rs.getInt("starscore"));
			reviewDTO.setType(rs.getString("type"));
			
		}
		
		DBConnector.disConnect(st, con);
		return reviewDTO;
	}

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		List<BoardDTO> ar=new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from review where "+tableSearch.getKind()+" like ? order by num desc) N)"
				+ "where R between ? and ?";
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			ReviewDTO reviewDTO=new ReviewDTO();
			reviewDTO.setNum(rs.getInt("num"));
			reviewDTO.setTitle(rs.getString("title"));
			reviewDTO.setWriter(rs.getString("writer"));
			reviewDTO.setContents(rs.getString("contents"));
			reviewDTO.setReg_date(rs.getString("reg_date"));
			reviewDTO.setHit(rs.getInt("hit"));
			reviewDTO.setStar_score(rs.getInt("starscore"));
			reviewDTO.setType(rs.getString("type"));
			ar.add(reviewDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch, String type) throws Exception {
		Connection con=DBConnector.getConnect();
		List<BoardDTO> ar=new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from review where type=? and "+tableSearch.getKind()+" like ? order by num desc) N)"
				+ "where R between ? and ?";
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, type);
		st.setString(2, "%"+tableSearch.getSearch()+"%");
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			ReviewDTO reviewDTO=new ReviewDTO();
			reviewDTO.setNum(rs.getInt("num"));
			reviewDTO.setTitle(rs.getString("title"));
			reviewDTO.setWriter(rs.getString("writer"));
			reviewDTO.setContents(rs.getString("contents"));
			reviewDTO.setReg_date(rs.getString("reg_date"));
			reviewDTO.setHit(rs.getInt("hit"));
			reviewDTO.setStar_score(rs.getInt("starscore"));
			reviewDTO.setType(rs.getString("type"));
			ar.add(reviewDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
