package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> listBoard();
	public BoardVO selectBoard(String kno);
	public int insertBoard(BoardVO param);
	public int updateBoard(BoardVO param);
	public int deleteBoard(BoardVO param);
	public BoardVO chaebunBoard();
}
