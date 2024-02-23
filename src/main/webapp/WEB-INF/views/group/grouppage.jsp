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
  <input type="hidden" id="g_no" name="g_no" value="${gllist.g_no}">
  <input type="submit" value="그룹삭제">
</form>
<div class="my-3 p-3 bg-body rounded shadow-sm">
  <h6 class="border-bottom pb-2 mb-0">회원 목록</h6>
  <c:forEach items="${mlist}" var="mlist">
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
  </script>
<%@include file="../includes/footer.jsp"%>