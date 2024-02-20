<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<!-- style 추가공간(<style>필요없음 -->
<%@include file="../includes/header2.jsp"%>
                  <li class="nav-item">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb"  style="padding: 8px;">
                          <li class="breadcrumb-item"><a href="/">Home</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Login</li>
                        </ol>
                      </nav>
                  </li>
<%@include file="../includes/header3.jsp"%>
          로그인 페이지
          <form action="/member/login" method="get">
          <input type="text" name="m_id">
          <input type="password" name="m_pw">
          <input type="submit" value="로그인">
          </form>
<%@include file="../includes/body.jsp"%>
  
<%@include file="../includes/footer.jsp"%>