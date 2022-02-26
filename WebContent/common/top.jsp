<%@page import="com.dto.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <a href="MainServlet">메인화면</a><br>
 <c:choose>
	<c:when test="${empty sessionScope.login}">
		<a href="LoginUIServlet">로그인</a>
		<a href="JoinUIServlet">회원가입</a>
	</c:when>
	
	<c:when test="${not empty sessionScope.login}">		
		<a href="LogoutServlet">로그아웃</a>
		<a href="MyPageServlet">마이페이지</a>
		<a href="CartListServlet">장바구니(${sessionScope.cartSumAmount})</a>
	</c:when>
</c:choose>