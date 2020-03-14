package com.spring.member.service;

import java.util.List;

import com.spring.member.vo.MemberVO;

public interface MemberService {

	public List<MemberVO> listMember();
	public MemberVO selectMember(String kno);
	public int insertMember(MemberVO param);
	public int updateMember(MemberVO param);
	public MemberVO chaebunMember();
	public int deleteMember(MemberVO param);
	public List<MemberVO> loginMember(MemberVO param);
	public List<MemberVO> idCheckMember(MemberVO param);
}
