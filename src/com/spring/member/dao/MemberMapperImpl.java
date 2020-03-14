package com.spring.member.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.member.vo.MemberVO;

public class MemberMapperImpl extends SqlSessionDaoSupport implements MemberMapper {

	private final String PACKAGE_PATH = "com.spring.member.dao.MemberDAO.";
	
	@Override
	public List<MemberVO> listMember() {
		return getSqlSession().selectList(PACKAGE_PATH + "listMember");
	}

	@Override
	public MemberVO selectMember(String kmem) {
		return (MemberVO)getSqlSession().selectOne(PACKAGE_PATH + "selectMember");
	}

	@Override
	public int insertMember(MemberVO param) {
		return (int)getSqlSession().insert(PACKAGE_PATH + "insertMember");
	}

	@Override
	public int updateMember(MemberVO param) {
		return (int)getSqlSession().update(PACKAGE_PATH + "updateMember");
	}

	@Override
	public int deleteMember(MemberVO param) {
		return (int)getSqlSession().delete(PACKAGE_PATH + "deleteMember");
	}

	@Override
	public MemberVO chaebunMember() {
		return (MemberVO)getSqlSession().selectOne(PACKAGE_PATH + "chaebunMember");
	}

	@Override
	public List<MemberVO> loginMember(MemberVO param) {
		
		return getSqlSession().selectList(PACKAGE_PATH + "loginMember");
	}

	@Override
	public List<MemberVO> idCheckMember(MemberVO param) {
		
		return getSqlSession().selectList(PACKAGE_PATH + "idCheckMember");

	}

	

	
}
