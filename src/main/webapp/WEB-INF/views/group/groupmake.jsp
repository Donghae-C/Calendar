<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<style>
    #grregisterbox{
        margin-top: 30px;
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
    <form action="" id="makeGrForm" method="post">
        <input type="hidden" id="gr_name" name="gr_name">
        <input type="hidden" id="gr_intro" name="gr_intro">
        <input type="hidden" id="gr_public" name="gr_public">
    </form>

<div id="grregisterbox">
        <div class="row mb-3">
            <label for="gname" class="col-sm-2 col-form-label">그룹이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="gname">
            </div>
        </div>
        <div class="row mb-3">
            <label for="gintro" class="col-sm-2 col-form-label">그룹소개</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="gintro">
            </div>
        </div>
        <div class="row mb-3">
            <label for="gcheck" class="col-sm-2 col-form-label">정보공개여부</label>
            <div class="col-sm-10">
                <input class="form-check-input" type="checkbox" id="gcheck" checked>
            </div>
        </div>
        <button type="button" class="btn btn-primary" onclick="javascript:submitmake()">가입신청</button>
</div>
<%@include file="../includes/body.jsp"%>
	<script>
        function submitmake(){
            document.getElementById("gr_name").value = document.getElementById("gname").value;
            document.getElementById("gr_intro").value = document.getElementById("gintro").value;
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