<%@page import="com.dto.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    MemberDTO dto = 
    (MemberDTO)session.getAttribute("login");
    if(dto==null){
%>    
<a href="">로그인</a>
<a href="">회원가입</a>
<%
 }else{
%>
<a href="">로그아웃</a>
<a href="">mypage</a>

<%
 }//end if
%>