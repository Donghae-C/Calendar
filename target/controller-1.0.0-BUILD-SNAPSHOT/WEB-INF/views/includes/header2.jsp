<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script>
      function moveGroupPage(name){
        document.getElementById("g_name").value = name;
        document.getElementById("movePageForm").submit();
      }
    </script>
  </head>
  <body data-bs-theme="dark">
    <div class="main">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="/"><img src="../resources/images/logo.png"></a>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">공지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/member/movememberlist">유저 찾기</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      그룹
                    </a>
                    <ul class="dropdown-menu">
                      <c:if test="${sessionScope.login eq null}">
                        <li><a class="dropdown-item" href="/member/login">로그인이 필요합니다.</a></li>
                      </c:if>
                      <c:if test="${sessionScope.login ne null}">
                        <li><a class="dropdown-item" href="/calendar/">스케줄</a></li>
                        <li><a class="dropdown-item" href="/group/groupmake">그룹만들기</a></li>
                        <li><a class="dropdown-item" href="/group/moveGrlist">그룹 목록</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <c:if test="${sessionScope.gList.size() eq 0}">
                          <li><a class="dropdown-item" href="#">가입한 그룹이 없습니다.</a></li>
                        </c:if>
                        <form action="/group/moveGrmain" method="get" id="movePageForm">
                        <c:if test="${sessionScope.gList.size() ne 0}">
                          <c:forEach items="${sessionScope.gList}" var="list">
                            <li><a class="dropdown-item" href="javascript:moveGroupPage('${list.g_name}')">${list.g_name}</a></li>
                          </c:forEach>
                        </c:if>
                          <input type="hidden" id="g_name" name="g_name">
                        </form>
                      </c:if>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link">   </a>
                  </li>
