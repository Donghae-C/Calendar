<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
${gllist.g_no}<br>
${gllist.g_name}<br>
${gllist.g_intro}<br>
${gllist.g_regdate}<br>
${gllist.g_public}
<form action="/group/deletegr" method="post">
  <c:set var="nameExists" value="false" />
  <input type="hidden" id="g_no" name="g_no" value="${gllist.g_no}">
  <c:forEach items="${sessionScope.gList}" var="list">
    <c:if test="${list.g_name eq gllist.g_name && list.g_grade==3}">
      <input type="submit" value="그룹삭제">
    </c:if>
  </c:forEach>
  <c:forEach items="${sessionScope.gList}" var="list">
    <c:if test="${list.g_name eq gllist.g_name}">
      <c:set var="nameExists" value="true" />
      <input type="button" value="그룹탈퇴">
    </c:if>
  </c:forEach>
  <c:if test="${not nameExists}">
    <input type="button" value="가입신청">
  </c:if>
</form>
<div class="my-3 p-3 bg-body rounded shadow-sm">
  <form id="moveGr" action="" method="get">
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" href="#">게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" aria-current="page" href="javascript:moveGrUserList()">회원 목록</a>
    </li>
  </ul>
    <input type="hidden" name="g_name" value="${gllist.g_name}">
  </form>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" contenteditable="true" id="msgcontent">

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" onclick="sendmsg()">보내기</button>
        </div>
      </div>
    </div>
  </div>
<%@include file="../includes/body.jsp"%>
  <script>
    function displaymodal(m_id){
      console.log(m_id);
      document.getElementById("exampleModalLabel").innerText = m_id;
      $('#exampleModal').modal('show');
    }
    function sendmsg(){
      var msg_recid = document.getElementById("exampleModalLabel").innerText;
      var msg_content = document.getElementById("msgcontent").innerText;
      $.ajax({
        type: 'POST',
        url: '/msgrest/sendmsg',
        data: {
          msg_recid: msg_recid,
          msg_content: msg_content
        },
        dataType: 'text',
        success: function(result) {
          // 성공 시 결과를 화면에 표시
          console.log('성공')
        },
        error: function(error) {
          console.log('Error:', error);
        }
      });
      $('#exampleModal').modal('hide');
    }
    function moveGrUserList(){
      document.getElementById("moveGr").action = "/group/moveGruserlist"
      document.getElementById("moveGr").submit();
    }
  </script>

<%@include file="../includes/footer.jsp"%>