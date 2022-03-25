package com.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.member.MemberDAO;
import com.dto.member.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	MemberDAO dao;
	
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return dao.join(memberDTO);
	}

	@Override
	public MemberDTO checkIdDuplicate(String userId) throws Exception {
		return dao.checkIdDuplicate(userId);
	}

	@Override
	public MemberDTO login(Map<String, String> hashMap) throws Exception {
		return dao.login(hashMap);
	}

	@Override
	public MemberDTO find(Map<String, String> hashMap) throws Exception {
		return dao.find(hashMap);
	}

	@Override
	public MemberDTO selectMyPage(String userId) throws Exception {
		return dao.selectMyPage(userId);
	}

	@Override
	public int updateMyPage(MemberDTO memberDTO) throws Exception {
		return dao.updateMyPage(memberDTO);
	}

}
