package com.dao.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.member.MemberDTO;

public class MemberDAO {

	public int join(SqlSession session, MemberDTO memberDTO) throws Exception {
		return session.insert("com.config.MemberMapper.join", memberDTO);
	}

	public MemberDTO checkIdDuplicate(SqlSession session, String userId) throws Exception {
		return session.selectOne("com.config.MemberMapper.checkIdDuplicate", userId);
	}

	public MemberDTO login(SqlSession session, HashMap<String, String> hashMap) throws Exception {
		return session.selectOne("com.config.MemberMapper.login", hashMap);
	}

	public MemberDTO find(SqlSession session, HashMap<String, String> hashMap) throws Exception {
		return session.selectOne("com.config.MemberMapper.find", hashMap);
	}

	public MemberDTO selectMyPage(SqlSession session, String userId) throws Exception {
		return session.selectOne("com.config.MemberMapper.selectMyPage", userId);
	}

	public int updateMyPage(SqlSession session, MemberDTO memberDTO) throws Exception {
		return session.update("com.config.MemberMapper.updateMyPage", memberDTO);
	}

}
