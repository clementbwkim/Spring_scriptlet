package com.spring.board.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.board.vo.BoardVO;

public class BoardMapperImpl extends SqlSessionDaoSupport implements BoardMapper {

	private final String PACKAGE_PATH = "com.spring.board.dao.BoardDAO.";

	
	@Override
	public List<BoardVO> listBoard() {
		return getSqlSession().selectList(PACKAGE_PATH + "listBoard");
	}

	@Override
	public BoardVO selectBoard(String kno) {
		return (BoardVO)getSqlSession().selectOne(PACKAGE_PATH + "selectBoard");
	}

	@Override
	public int insertBoard(BoardVO param) {
		return (int)getSqlSession().insert(PACKAGE_PATH + "insertBoard");
	}

	@Override
	public int updateBoard(BoardVO param) {
		return (int)getSqlSession().update(PACKAGE_PATH + "updateBoard");
	}

	@Override
	public int deleteBoard(BoardVO param) {
		return (int)getSqlSession().delete(PACKAGE_PATH + "deleteBoard");
	}

	@Override
	public BoardVO chaebunBoard() {
		return getSqlSession().selectOne(PACKAGE_PATH + "chaebunBoard");
	}

}
