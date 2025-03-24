<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="row">
  <nav class="navbar navbar-expand-md border-bottom border-body navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="/">JEJU</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/">홈페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/flights/search">항공</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">숙박</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="true">게시판</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">명소 후기</a></li>
              <li><a class="dropdown-item" href="#">맛집 후기</a></li>
              <li><a class="dropdown-item" href="#">숙소 후기</a></li>
              <li><a class="dropdown-item" href="/boards/list">testBoard</a></li>
            </ul>
          </li>
        </ul>
        <div>
          <ul class="navbar-nav me-auto mb-2 mb-sm-0 dropdown">
            <li class="nav-item">
              <a class="nav-link" href="#">로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">회원가입</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</header>
