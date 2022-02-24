package com.service.member;

import java.util.HashMap;

import com.dto.member.MemberDTO;

public interface MemberService {

	public int join(MemberDTO dto) throws Exception;

	public MemberDTO idDuplicateCheck(String userId) throws Exception;

	public MemberDTO login(HashMap<String, String> hashMap) throws Exception;

	public MemberDTO myPage(String userId) throws Exception;

	public int myPageUpdate(MemberDTO dto) throws Exception;

}
