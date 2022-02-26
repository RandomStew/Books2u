package com.service.member;

import java.util.HashMap;

import com.dto.member.MemberDTO;

public interface MemberService {

	public int join(MemberDTO memberDTO) throws Exception;

	public MemberDTO checkIdDuplicate(String userId) throws Exception;

	public MemberDTO login(HashMap<String, String> hashMap) throws Exception;

	public MemberDTO selectMyPage(String userId) throws Exception;

	public int updateMyPage(MemberDTO memberDTO) throws Exception;

}
