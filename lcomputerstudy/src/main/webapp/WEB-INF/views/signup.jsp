<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4">회원가입</h2>
                        <form action="/signup" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="mb-3">
                                <input type="text" class="form-control" name="username" placeholder="아이디 입력">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" name="uName" placeholder="이름 입력">
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" name="password" placeholder="비밀번호 입력">
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">가입하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>