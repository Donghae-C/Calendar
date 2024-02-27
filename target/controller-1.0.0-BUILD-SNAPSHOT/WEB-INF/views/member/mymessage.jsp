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
                          <li class="breadcrumb-item active" aria-current="page">내 쪽지함</li>
                        </ol>
                      </nav>
                  </li>
<%@include file="../includes/header3.jsp"%>
<form action="/message/deletemsg" method="post">
	<c:forEach items="${msglist}" var="msg">
        <div class="card">
            <div class="card-header">
                <input type="checkbox" value="${msg.msg_no}">보낸사람 : ${msg.msg_sendid}
            </div>
            <div class="card-body ellipsis">
                <p class="card-text">${msg.msg_content}</p>
            </div>
        </div>
    </c:forEach>
</form>
<nav aria-label="...">
    <ul class="pagination">
        <!-- Previous button -->
        <c:choose>
            <c:when test="${curpage > 1}">
                <li class="page-item">
                    <a class="page-link" href="/message/movemymsg?page=${curpage - 5 < 1 ? 1 : curpage - 5}">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <!-- Page numbers -->
        <c:forEach var="pagenum" begin="${startPage}" end="${lastPage}">
            <c:choose>
                <c:when test="${pagenum eq curpage}">
                    <li class="page-item active"><a class="page-link" href="/message/movemymsg?page=${pagenum}">${pagenum}</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/message/movemymsg?page=${pagenum}">${pagenum}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- Next button -->
        <li class="page-item">
            <c:choose>
                <c:when test="${curpage + 5 > lastPage}">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
                </c:when>
                <c:otherwise>
                    <a class="page-link" href="/message/movemymsg?page=${curpage + 5}">Next</a>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</nav>
<%@include file="../includes/body.jsp"%>

<%@include file="../includes/footer.jsp"%>