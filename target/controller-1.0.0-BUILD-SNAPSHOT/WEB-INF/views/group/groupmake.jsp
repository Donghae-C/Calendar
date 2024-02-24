<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
    <style>
        .ginputbox{
            background-color: #999999;
            border-radius: 10px;
            margin-top: 10px;
        }
        .gnamebox{
            min-width: 100px;
            max-width: 120px;
            margin-top: 10px;
        }
        .gcheckbox{
            margin-top: 10px;
        }
    </style>
<%@include file="../includes/header2.jsp"%>
                  <li class="nav-item">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb"  style="padding: 8px;">
                          <li class="breadcrumb-item"><a href="/">Home</a></li>
                          <li class="breadcrumb-item active" aria-current="page">그룹만들기</li>
                        </ol>
                      </nav>
                  </li>
<%@include file="../includes/header3.jsp"%>
    <div class="row">
        <div class="col-2 gnamebox">그룹 이름</div>
        <div class="col-8 ginputbox" id="gname" contenteditable="true"></div>
    </div>
    <div class="row">
        <div class="col-2 gnamebox">그룹 소개</div>
        <div class="col-8 ginputbox" id="gintro" contenteditable="true"></div>
    </div>
    <div class="row">
        <div class="col-2 gnamebox">공개 여부</div>
        <div class="col-8 gcheckbox"><input type="checkbox" id="gcheck" checked></div>
    </div>
    <div>
        <a href="javascript:submitmake()" class="btn">만들기</a>
    </div>
    <form action="" id="makeGrForm" method="post">
        <input type="hidden" id="gr_name" name="gr_name">
        <input type="hidden" id="gr_intro" name="gr_intro">
        <input type="hidden" id="gr_public" name="gr_public">
    </form>
<%@include file="../includes/body.jsp"%>
	<script>
        function submitmake(){
            document.getElementById("gr_name").value = document.getElementById("gname").innerText;
            document.getElementById("gr_intro").value = document.getElementById("gintro").innerText;
            if(document.getElementById("gcheck").checked){
                document.getElementById("gr_public").value = 0;
            }else{
                document.getElementById("gr_public").value = 1;
            }
            document.getElementById("makeGrForm").action = "/group/makegroup";
            document.getElementById("makeGrForm").submit();
        }
    </script>
<%@include file="../includes/footer.jsp"%>