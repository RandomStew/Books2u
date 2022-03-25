package com.dao.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.member.MemberDTO;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	SqlSession session;
	
	public int join(MemberDTO memberDTO) throws Exception {
		return session.insert("com.config.MemberMapper.join", memberDTO);
	}

	public MemberDTO checkIdDuplicate(String userId) throws Exception {
		return session.selectOne("com.config.MemberMapper.checkIdDuplicate", userId);
	}

	public MemberDTO login(HashMap<String, String> hashMap) throws Exception {
		return session.selectOne("com.config.MemberMapper.login", hashMap);
	}

	public MemberDTO find(HashMap<String, String> hashMap) throws Exception {
		return session.selectOne("com.config.MemberMapper.find", hashMap);
	}

	public MemberDTO selectMyPage(String userId) throws Exception {
		return session.selectOne("com.config.MemberMapper.selectMyPage", userId);
	}

	public int updateMyPage(MemberDTO memberDTO) throws Exception {
		return session.update("com.config.MemberMapper.updateMyPage", memberDTO);
	}

}
