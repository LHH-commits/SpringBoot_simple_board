<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .nav-link {
            color: #6c757d;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #0d6efd;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h2 class="card-title text-center mb-4">홈페이지</h2>
                        <hr>
                        
                        <!-- 로그인 전 -->
                        <sec:authorize access="isAnonymous()">
                            <div class="d-flex justify-content-center gap-3 mb-4">
                                <a href="/login" class="btn btn-primary">로그인</a>
                                <a href="/beforeSignUp" class="btn btn-outline-primary">회원가입</a>
                            </div>
                        </sec:authorize>
                        
                        <!-- 로그인 후 -->
                        <sec:authorize access="isAuthenticated()">
                            <div class="text-center mb-4">
                                <sec:authentication property="principal" var="principal"/>
                                <div class="card bg-light mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">환영합니다!</h5>
                                        <p class="card-text">${principal.uName}</p>
                                        <p class="card-text text-muted">${board.username}</p>
                                    </div>
                                </div>
                                <a href="/logout" class="btn btn-danger">로그아웃</a>
                            </div>
                            
                            <!-- 메뉴 네비게이션 -->
                            <div class="list-group">
                                <a href="/user/info" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                    내 정보
                                    <span class="badge bg-primary rounded-pill">
                                        <i class="bi bi-person"></i>
                                    </span>
                                </a>
                                <a href="/admin" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                    관리자
                                    <span class="badge bg-secondary rounded-pill">
                                        <i class="bi bi-gear"></i>
                                    </span>
                                </a>
                                <a href="/list" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                    게시물 보기
                                    <span class="badge bg-info rounded-pill">
                                        <i class="bi bi-list"></i>
                                    </span>
                                </a>
                            </div>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</body>
</html>