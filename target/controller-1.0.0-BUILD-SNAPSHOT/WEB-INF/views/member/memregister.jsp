<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<style>
    #registerbox{
        margin-top: 30px;
    }
</style>
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
<!-- body 세팅 -->
<div id="registerbox">
<form action="/member/register" method="post">
    <div class="row mb-3">
        <label for="m_id" class="col-sm-2 col-form-label">ID</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="m_id" name="m_id">
        </div>
    </div>
    <div class="row mb-3">
        <label for="m_pw" class="col-sm-2 col-form-label">비밀번호</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="m_pw" name="m_pw">
        </div>
    </div>
    <div class="row mb-3">
        <label for="m_pw2" class="col-sm-2 col-form-label">비밀번호확인</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="m_pw2">
        </div>
    </div>
    <div class="row mb-3">
        <label for="m_name" class="col-sm-2 col-form-label">이름</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="m_name" name="m_name">
        </div>
    </div>
    <div class="row mb-3">
        <label for="m_name" class="col-sm-2 col-form-label">E-mail</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="m_email" name="m_email">
        </div>
    </div>
    <div class="row mb-3">
        <label for="m_name" class="col-sm-2 col-form-label">정보공개여부</label>
        <div class="col-sm-10">
            <input class="form-check-input" type="checkbox" id="publicchk" name="publicchk" checked>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">가입신청</button>
</form>
</div>
<%@include file="../includes/body.jsp"%>
<!-- js 세팅<script>태그 필요함 -->
<%@include file="../includes/footer.jsp"%>