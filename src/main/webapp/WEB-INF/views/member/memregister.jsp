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
<!-- body 세팅 -->
<form action="/member/register" method="post">
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" id="m_id" name="m_id"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" id="m_pw" name="m_pw"></td>
        </tr>
        <tr>
            <td>비밀번호 확인</td>
            <td><input type="password" id="m_pw2" name="m_pw2"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" id="m_name" name="m_name"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" id="m_email" name="m_email"></td>
        </tr>
        <tr>
            <td>정보공개</td>
            <td><input type="checkbox" id="publicchk" name="publicchk"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="가입신청"></td>
        </tr>
    </table>
</form>
<%@include file="../includes/body.jsp"%>
<!-- js 세팅<script>태그 필요함 -->
<%@include file="../includes/footer.jsp"%>