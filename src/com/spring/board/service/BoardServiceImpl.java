package com.spring.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.dao.BoardMapper;
import com.spring.board.vo.BoardVO;


@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> listBoard() {
		System.out.println("(log)BoardServiceImpl listBoard>>>> ");
		
		List<BoardVO> list = new ArrayList<>();
		list = boardMapper.listBoard();
		System.out.println("list.size() : list >>> : " + list.size()+ " : " + list);
		return list;
	}

	@Override
	public BoardVO selectBoard(String kno) {
		System.out.println("(log)BoardServiceImpl selectBoard>>>> ");
		return boardMapper.selectBoard(kno);
	}

	@Override
	public int insertBoard(BoardVO param) {
		System.out.println("(log)BoardServiceImpl insertBoard>>>> ");
		return boardMapper.insertBoard(param)
				;
	}

	@Override
	public int updateBoard(BoardVO param) {
		System.out.println("(log)BoardServiceImpl updateBoard>>>> ");
		return boardMapper.updateBoard(param);
	}

	@Override
	public BoardVO chaebunBoard() {
		System.out.println("(log)BoardServiceImpl chaebunBoard>>>> ");
		return boardMapper.chaebunBoard();
	}

	@Override
	public int deleteBoard(BoardVO param) {
		System.out.println("(log)BoardServiceImpl deleteBoard>>>> ");
		return boardMapper.deleteBoard(param);
	}

}
