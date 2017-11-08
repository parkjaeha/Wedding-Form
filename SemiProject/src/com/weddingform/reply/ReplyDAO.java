package com.weddingform.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.weddingform.Board.BoardDAO;
import com.weddingform.Board.BoardDTO;
import com.weddingform.qna.QnaDTO;
import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;
import com.weddingform.util.TableSearch;

public  class ReplyDAO implements BoardDAO{
	
	
	@Override
	public int getTotalCount(TableSearch tableSearch) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(num),0) from reply where "+tableSearch.getKind()+" like ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+tableSearch.getSearch()+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	
	

	@Override
	public int update(BoardDTO replyDTO) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="update reply set title=?, contents=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,replyDTO.getTitle());
		st.setString(2, replyDTO.getContents());
		st.setInt(3, replyDTO.getNum());
		int result=st.executeUpdate();
		
		return result;
	}



	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public int delete(int num, String type) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="delete reply where type=? and num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, type);
		st.setInt(2, num);
		int result=st.executeUpdate();
		
		return result;
	}





	@Override
	public int hitUpdate(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}







	@Override
	public int insert(BoardDTO boardDTO) throws Exception {

		return 0;
	}


	public int insert(BoardDTO boardDTO,int num, String type) throws Exception {
		Connection con=DBConnector.getConnect();
		ReplyDTO replyDTO=(ReplyDTO)boardDTO;
		
		String sql="insert into reply "
				+ "values(board_seq.nextval,?,?,?,sysdate,board_seq.currval,0,0,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, replyDTO.getTitle());
		st.setString(2, replyDTO.getWriter());
		st.setString(3, replyDTO.getContents());
		st.setInt(4, num);
		st.setString(5, type);
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}






	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select * from reply where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs=st.executeQuery();
		
		ReplyDTO replyDTO=new ReplyDTO();
		
		if(rs.next()) {
			replyDTO.setNum(rs.getInt("num"));
			replyDTO.setTitle(rs.getString("title"));
			replyDTO.setWriter(rs.getString("writer"));
			replyDTO.setContents(rs.getString("contents"));
			replyDTO.setReg_date(rs.getString("reg_date"));
			replyDTO.setRef(rs.getInt("ref"));
			replyDTO.setStep(rs.getInt("step"));
			replyDTO.setDepth(rs.getInt("depth"));
		
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return replyDTO;
	}




	

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch ) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<BoardDTO> selectList(String type, int num) throws Exception {
		Connection con=DBConnector.getConnect();
		List<BoardDTO> ar=new ArrayList<>();
		String sql="select * from reply where reviewnum=(select num from review where type=? and num=?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, type);
		st.setInt(2, num);
		
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			ReplyDTO replyDTO=new ReplyDTO();
			replyDTO.setNum(rs.getInt("num"));
			replyDTO.setTitle(rs.getString("title"));
			replyDTO.setWriter(rs.getString("writer"));
			replyDTO.setContents(rs.getString("contents"));
			replyDTO.setReg_date(rs.getString("reg_date"));
			replyDTO.setRef(rs.getInt("ref"));
			replyDTO.setStep(rs.getInt("step"));
			replyDTO.setDepth(rs.getInt("depth"));
			replyDTO.setReviewNum(rs.getInt("reviewNum"));
			replyDTO.setType(rs.getString("type"));
		    ar.add(replyDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	
	
	
	
	
	public int reply(ReplyDTO replyDTO) throws Exception{
		ReplyDTO parent=(ReplyDTO)this.selectOne(replyDTO.getNum());
		int result=this.replyUpdate(parent);
		
		Connection con = DBConnector.getConnect();
		String sql ="insert into reply values(board_seq.nextval,?,?,?,sysdate,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, replyDTO.getTitle());
		st.setString(2, replyDTO.getWriter());
		st.setString(3, replyDTO.getContents());
		st.setInt(4, parent.getRef());
		st.setInt(5, parent.getStep()+1);
		st.setInt(6, parent.getDepth()+1);
	
		
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int replyUpdate(ReplyDTO replyDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update reply set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, replyDTO.getRef());
		st.setInt(2, replyDTO.getStep());
		int result = st.executeUpdate();
		return result;
	}












}
