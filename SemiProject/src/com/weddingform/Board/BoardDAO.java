package com.weddingform.Board;

import java.util.List;

import com.weddingform.util.MakeRow;
import com.weddingform.util.TableSearch;

//게시판_부모 - interface

public interface BoardDAO {
	
	//totalCount
	public int getTotalCount(TableSearch tableSearch) throws Exception;
	
	//update
	public int update(BoardDTO boardDTO) throws Exception;
	
	//delete
	public int delete(int num)throws Exception;
	
	//hitUpdate
	public int hitUpdate(int num)throws Exception;
	
	//insert
	public int insert(BoardDTO boardDTO) throws Exception;
	
	//selectOne
	public BoardDTO selectOne(int num) throws Exception;
	
	//selectList
	public List<BoardDTO> selectList(MakeRow makeRow, TableSearch tableSearch)throws Exception;

}
