<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: rgb(233, 186, 124);">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Jeju</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">항공편</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">숙박</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">렌트카</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              게시판
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">문의게시판</a></li>
              <li><a class="dropdown-item" href="#">맛집 후기</a></li>
              <li><a class="dropdown-item" href="#">명소 후기</a></li>
              <li><a class="dropdown-item" href="#">숙소 후기</a></li>
            </ul>
          </li>
        </ul>
        <div>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">로그인</a>
                  </li>
                  <li>
                    <a class="nav-link active" aria-current="page" href="#">회원가입</a>

                  </li>
            </ul>
        </div>
      </div>
    </div>
  </nav>
