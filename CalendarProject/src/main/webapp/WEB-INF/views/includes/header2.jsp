<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  </head>
  <body data-bs-theme="dark">
    <div class="main">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="/">mydhcode</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" id="togglebtn">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">무엇을</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">만들지</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      고민해보자
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="/calendar/">스케줄</a></li>
                      <li><a class="dropdown-item" href="/group/">그룹</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">추가해야하나</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link">   </a>
                  </li>