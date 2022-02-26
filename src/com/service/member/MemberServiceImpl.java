package com.service.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.member.MemberDAO;
import com.dto.member.MemberDTO;

public class MemberServiceImpl implements MemberService {

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			num = dao.join(session, memberDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	@Override
	public MemberDTO checkIdDuplicate(String userId) throws Exception {
		MemberDTO memberDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			memberDTO = dao.checkIdDuplicate(session, userId);
		} finally {
			session.close();
		}
		return memberDTO;
	}

	@Override
	public MemberDTO login(HashMap<String, String> hashMap) throws Exception {
		MemberDTO memberDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			memberDTO = dao.login(session, hashMap);
		} finally {
			session.close();
		}
		return memberDTO;
	}

	@Override
	public MemberDTO selectMyPage(String userId) throws Exception {
		MemberDTO memberDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			memberDTO = dao.selectMyPage(session, userId);
		} finally {
			session.close();
		}
		return memberDTO;
	}

	@Override
	public int updateMyPage(MemberDTO memberDTO) throws Exception {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			num = dao.updateMyPage(session, memberDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
