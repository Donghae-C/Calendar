<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
    <!-- style 세팅<style>태그 필요함-->
<%@include file="../includes/header2.jsp"%>
                  <li class="nav-item">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb"  style="padding: 8px;">
                          <li class="breadcrumb-item"><a href="#">Home</a></li>
                          <li class="breadcrumb-item active" aria-current="page">curpage</li>
                        </ol>
                      </nav>
                  </li>
<%@include file="../includes/header3.jsp"%>
	${sessionScope.login.m_id}<br>
    ${sessionScope.login.m_name}<br>
    ${sessionScope.login.m_email}<br>
    ${sessionScope.login.m_regdate}<br>
    ${sessionScope.login.m_public}<br>
<%@include file="../includes/body.jsp"%>
	<!-- js 세팅<script>태그 필요함 -->
<%@include file="../includes/footer.jsp"%>