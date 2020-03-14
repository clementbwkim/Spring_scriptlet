package com.spring.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.member.dao.MemberMapper;
import com.spring.member.vo.MemberVO;


@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> listMember() {
		System.out.println("(log)MemberServiceImpl listMember  >>>>> ");
		
		List<MemberVO> list = new ArrayList<>();
		list = memberMapper.listMember();
		System.out.println("listSize >>> : " + list.size());
		System.out.println("list >>>> : " + list);
		return list;
	}

	@Override
	public MemberVO selectMember(String kmem) {
		System.out.println("(log)MemberServiceImpl selectMember  >>>>> ");
		return memberMapper.selectMember(kmem);
	}

	@Override
	public int insertMember(MemberVO param) {
		System.out.println("(log)MemberServiceImpl insertMember  >>>>> ");
		return memberMapper.insertMember(param);
	}

	@Override
	public int updateMember(MemberVO param) {
		System.out.println("(log)MemberServiceImpl updateMember  >>>>> ");
		return memberMapper.updateMember(param);
	}

	@Override
	public int deleteMember(MemberVO param) {
		System.out.println("(log)MemberServiceImpl deleteMember  >>>>> ");
		return memberMapper.deleteMember(param);
	}
	
	@Override
	public MemberVO chaebunMember() {
		System.out.println("(log)MemberServiceImpl chaebunMember  >>>>> ");
		return memberMapper.chaebunMember();
	}

	@Override
	public List<MemberVO> loginMember(MemberVO param) {
		System.out.println("(log)MemberServiceImpl loginMember  >>>>> ");
		return memberMapper.loginMember(param);
	}

	@Override
	public List<MemberVO> idCheckMember(MemberVO param) {
		System.out.println("(log)MemberServiceImpl idCheckMember  >>>>> ");
		return memberMapper.idCheckMember(param);
	}
	
	

}
