package com.service.member;

import java.util.Map;

import com.dto.member.MemberDTO;

public interface MemberService {

	public int join(MemberDTO memberDTO) throws Exception;

	public MemberDTO checkIdDuplicate(String userId) throws Exception;

	public MemberDTO login(Map<String, String> hashMap) throws Exception;
	
	public MemberDTO find(Map<String, String> hashMap) throws Exception;

	public MemberDTO selectMyPage(String userId) throws Exception;

	public int updateMyPage(MemberDTO memberDTO) throws Exception;

}
