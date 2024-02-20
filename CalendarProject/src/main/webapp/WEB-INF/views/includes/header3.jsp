<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
                  <c:if test="${sessionScope.login eq null}">
                  <li class="nav-item">
                  	<a class="nav-link" href="/member/login">로그인</a>
                  </li>
                  </c:if>
                  <c:if test="${sessionScope.login ne null}">
                  <li class="nav-item">
                  	<a class="nav-link" href="/member/logout">로그아웃</a>
                  </li>
                  </c:if>
                </ul>
                <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
              </div>
            </div>
          </nav>