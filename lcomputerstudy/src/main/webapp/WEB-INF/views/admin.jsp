<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card shadow-sm">
					<div class="card-body p-4">
						<div class="d-flex justify-content-between align-items-center mb-4">
							<h2 class="card-title mb-0">
								<i class="bi bi-gear-fill me-2"></i>관리자 페이지
							</h2>
							<a href="/logout" class="btn btn-danger btn-sm">로그아웃</a>
						</div>
						<hr>
						
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="principal"/>
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-subtitle mb-2 text-muted">관리자 정보</h5>
									<p class="card-text">
										<strong>아이디:</strong> ${principal.username}<br>
										<strong>권한:</strong> ${principal.authorities}
									</p>
								</div>
							</div>
						</sec:authorize>
						
						<div class="text-center">
							<a href="/" class="btn btn-secondary">
								<i class="bi bi-house-door me-1"></i>홈으로 돌아가기
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>