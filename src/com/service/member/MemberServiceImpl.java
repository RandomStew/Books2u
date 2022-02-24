package com.service.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.member.MemberDAO;
import com.dto.member.MemberDTO;

public class MemberServiceImpl implements MemberService {

	@Override
	public int join(MemberDTO dto) throws Exception {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			num = dao.join(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	@Override
	public MemberDTO idDuplicateCheck(String userId) throws Exception {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			dto = dao.idDuplicateCheck(session, userId);
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public MemberDTO login(HashMap<String, String> hashMap) throws Exception {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			dto = dao.login(session, hashMap);
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public MemberDTO myPage(String userId) throws Exception {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			dto = dao.myPage(session, userId);
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public int myPageUpdate(MemberDTO dto) throws Exception {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			MemberDAO dao = new MemberDAO();
			num = dao.myPageUpdate(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
