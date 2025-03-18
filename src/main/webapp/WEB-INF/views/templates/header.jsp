<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: rgb(233, 186, 124);">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Jeju</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active"  aria-current="page" href="#">항공편</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">숙박</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">렌트카</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="true">
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
