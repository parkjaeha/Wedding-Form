package com.weddingform.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.qna.QnaDTO;
import com.weddingform.Board.BoardDAO;
import com.weddingform.Board.BoardDTO;
import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;
import com.weddingform.util.TableSearch;

//질문 게시판

public class QnaDAO implements BoardDAO{

	public boolean qnaPwCheck(int num,String password) throws Exception {
		boolean check=false;
		String dbpw="";
		Connection con=DBConnector.getConnect();
		String sql="select password from qna where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		
		if(rs.next()) {
			//일치
			dbpw=rs.getString("password");
			if(dbpw.equals(password)) {
				check=true;
			}
		}
		
		DBConnector.disConnect(rs, st, con);
		return check;
	}
	
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
	public int update(BoardDTO qnaDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update qna set title=?, contents=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setInt(3, qnaDTO.getNum());
		int result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int delete(int ref) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="delete qna where ref=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, ref);
		int result=st.executeUpdate();
		
		return result;
	}


	@Override
	public int hitUpdate(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="update qna set hit=hit+1 where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result =  st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		QnaDTO qnaDTO=(QnaDTO)boardDTO;

		String sql="insert into qna "
				+ "values(board_seq.nextval,?,?,?,sysdate,0,board_seq.currval,0,0,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getWriter());
		st.setString(3, qnaDTO.getContents());
		st.setString(4, qnaDTO.getPassword());
		st.setString(5, qnaDTO.getOpencheck());
		
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
		
		QnaDTO qnaDTO=new QnaDTO();
		
		if(rs.next()) {
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setReg_date(rs.getString("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
	 		qnaDTO.setRef(rs.getInt("ref"));
		    qnaDTO.setStep(rs.getInt("step"));
		    qnaDTO.setDepth(rs.getInt("depth"));
		    qnaDTO.setPassword(rs.getString("password"));
		    qnaDTO.setOpencheck(rs.getString("opencheck"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return qnaDTO;
	}

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		List<BoardDTO> ar=new ArrayList<>();
		//ArrayList<QnaDTO> ar=new ArrayList<>();
		String sql="select * from "
				+ "(select rownum R, Q.* from "
				+ "(select * from qna where "+tableSearch.getKind()+" like ? order by ref desc, step asc) Q) "
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
		    qnaDTO.setRef(rs.getInt("ref"));
		    qnaDTO.setStep(rs.getInt("step"));
		    qnaDTO.setDepth(rs.getInt("depth"));
		    qnaDTO.setPassword(rs.getString("password"));
		    qnaDTO.setOpencheck(rs.getString("opencheck"));
		    ar.add(qnaDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	
	public int reply(QnaDTO qnaDTO) throws Exception{
		QnaDTO parent=(QnaDTO)this.selectOne(qnaDTO.getNum());
		int result=this.replyUpdate(parent);
		
		Connection con = DBConnector.getConnect();
		String sql ="insert into qna values(board_seq.nextval,?,?,?,sysdate,0,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getWriter());
		st.setString(3, qnaDTO.getContents());
		st.setInt(4, parent.getRef());
		st.setInt(5, parent.getStep()+1);
		st.setInt(6, parent.getDepth()+1);
		st.setString(7, qnaDTO.getPassword());
		st.setString(8, qnaDTO.getOpencheck());
		
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int replyUpdate(QnaDTO qnaDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update qna set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, qnaDTO.getRef());
		st.setInt(2, qnaDTO.getStep());
		int result = st.executeUpdate();
		return result;
	}

}
