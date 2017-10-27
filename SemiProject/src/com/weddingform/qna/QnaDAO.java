package com.weddingform.qna;

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

//질문 게시판

public class QnaDAO implements BoardDAO{

	@Override
	public int getTotalCount(TableSearch tableSearch) throws Exception {
		
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(num),0) from qna where "+tableSearch.getKind()+" like ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hitUpdate(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update qna set hit=hit+1 where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int insert(BoardDTO qnaDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="insert into qna values(board_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,qnaDTO.getTitle());
		st.setString(2, qnaDTO.getWriter());
		st.setString(3, qnaDTO.getContents());
		
		int result=st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		
		String sql="select * from qna where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs=st.executeQuery();
		QnaDTO qnaDTO=null;
		if(rs.next()) {
			qnaDTO =new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setReg_date(rs.getString("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));

		}
		DBConnector.disConnect(rs, st, con);
		
		
		return qnaDTO;
	}

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		
		List<BoardDTO> ar=new ArrayList<>();
		
		String sql="selet * from "
				+ "(select rownum R, N.*from "
				+ "(select * from qna where "+tableSearch.getKind()+ "like ? order by num desc) N) "
				+ "where R between ? and ?";
		
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setReg_date(rs.getString("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			ar.add(qnaDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception{
		return 0;
	}
	
	public int replyUpdate(QnaDTO qnaDTO) throws Exception{
		return 0;
	}

}
