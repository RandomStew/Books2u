<%@page import="com.dto.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("login");
	if (dto == null) {
%>
<a href="LoginUIServlet">로그인</a>
<a href="JoinUIServlet">회원가입</a>
<%
	} else {
%>
<a href="LogoutServlet">로그아웃</a>
<a href="MyPageServlet">마이페이지</a>
<a href="CartListServlet">장바구니</a>
<%
	}
%>