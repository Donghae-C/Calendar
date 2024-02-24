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
                          <li class="breadcrumb-item active" aria-current="page">회원목록</li>
                        </ol>
                      </nav>
                  </li>
<%@include file="../includes/header3.jsp"%>
<c:forEach items="${memlist}" var="mlist">
    <div style="width: 100%;">
        <div class="btn-group dropend">
            <div class="d-flex text-muted pt-3 btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>

                <p class="pb-3 mb-0 small lh-sm border-bottom">
                    <strong class="d-block text-gray-dark">@${mlist.m_id}</strong>
                        ${mlist.m_name}
                </p>
            </div>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">정보보기</a></li>
                <li><a class="dropdown-item" href="javascript:displaymodal('${mlist.m_id}')">쪽지보내기</a></li>
            </ul>
        </div>
    </div>
</c:forEach>
<%@include file="../includes/body.jsp"%>
	<!-- js 세팅<script>태그 필요함 -->
<%@include file="../includes/footer.jsp"%>