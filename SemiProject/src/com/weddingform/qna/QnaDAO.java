package com.weddingform.qna;

import java.util.List;

import com.weddingform.Board.BoardDAO;
import com.weddingform.Board.BoardDTO;
import com.weddingform.util.MakeRow;
import com.weddingform.util.TableSearch;

//질문 게시판

public class QnaDAO implements BoardDAO{

	@Override
	public int getTotalCount(TableSearch tableSearch) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception{
		return 0;
	}
	
	public int replyUpdate(QnaDTO qnaDTO) throws Exception{
		return 0;
	}

}
