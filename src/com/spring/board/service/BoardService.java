package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVO;


public interface BoardService {
	
	public List<BoardVO> listBoard();
	public BoardVO selectBoard(String kno);
	public int insertBoard(BoardVO param);
	public int updateBoard(BoardVO param);
	public BoardVO chaebunBoard();
	public int deleteBoard(BoardVO param);
}
