package com.spring.member.dao;

import java.util.List;

import com.spring.member.vo.MemberVO;

public interface MemberMapper {

	public List<MemberVO> listMember();
	public MemberVO selectMember(String kmem);
	public int insertMember(MemberVO param);
	public int updateMember(MemberVO param);
	public int deleteMember(MemberVO param);
	public MemberVO chaebunMember();
	public List<MemberVO> loginMember(MemberVO param);
	public List<MemberVO> idCheckMember (MemberVO param); 
}
