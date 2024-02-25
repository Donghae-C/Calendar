<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            </ul>
        </div>
        <span class="dropdown-center ms-auto" id="mybtn" style="margin: 10px; float: right;">
            <a href="#" class="btn btn-secondary" data-bs-toggle="dropdown" aria-expanded="false">
                <c:if test="${sessionScope.login ne null}">${sessionScope.login.m_id}</c:if>
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                </svg>
            </a>
            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark">
                <c:if test="${sessionScope.login ne null}">
                    <li><a class="dropdown-item" href="/member/movemypage">마이페이지</a></li>
                    <li><a class="dropdown-item" href="/message/movemymsg">내 쪽지함</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item" href="/member/logout">로그아웃</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.login eq null}">
                    <li><a class="dropdown-item" href="/member/moveregister">회원가입</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item" href="/member/login">로그인</a>
                    </li>
                </c:if>

            </ul>
        </span>
        <span class="dropdown-center" style="margin: 10px; float: right;">
            <a href="#" class="btn btn-secondary" data-bs-toggle="dropdown" aria-expanded="false" id="alarmbell">
               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
               </svg>
            </a>
            <div class="dropdown-menu dropdown-menu-end p-4 text-body-secondary" style="min-width: 250px; max-width: 300px" id="myMsg">
                <div>n개의 쪽지가 있습니다</div>
                <hr>
                <div>
                    <div>
                        보낸사람
                    </div>
                    <div>
                        내용
                    </div>
                </div>
                <hr>
            </div>
        </span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" id="togglebtn">
            <span class="navbar-toggler-icon"></span>
        </button>
        <input type="hidden" id="msg_nos" value="">
    </div>
</nav>

<div class="row" id="mainbox">