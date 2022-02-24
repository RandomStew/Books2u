package com.dao.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.member.MemberDTO;

public class MemberDAO {

	public int join(SqlSession session, MemberDTO dto) throws Exception {
		return session.insert("com.config.MemberMapper.join", dto);
	}

	public MemberDTO idDuplicateCheck(SqlSession session, String userId) throws Exception {
		return session.selectOne("com.config.MemberMapper.idDuplicateCheck", userId);
	}

	public MemberDTO login(SqlSession session, HashMap<String, String> hashMap) throws Exception {
		return session.selectOne("com.config.MemberMapper.login", hashMap);
	}

	public MemberDTO myPage(SqlSession session, String userId) throws Exception {
		return session.selectOne("com.config.MemberMapper.myPage", userId);
	}

	public int myPageUpdate(SqlSession session, MemberDTO dto) throws Exception {
		return session.update("com.config.MemberMapper.myPageUpdate", dto);
	}

}
