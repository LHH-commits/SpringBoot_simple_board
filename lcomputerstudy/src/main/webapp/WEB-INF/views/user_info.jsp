<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card shadow-sm">
					<div class="card-body p-4">
						<h2 class="card-title text-center mb-4">마이페이지</h2>
						<hr>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="principal"/>
							<div class="mb-4">
								<h5 class="text-muted mb-2">사용자 정보</h5>
								<div class="card bg-light">
									<div class="card-body">
										<p class="mb-2"><strong>아이디:</strong> ${principal.username}</p>
										<p class="mb-0"><strong>권한:</strong> ${principal.authorities}</p>
									</div>
								</div>
							</div>
						</sec:authorize>
						<div class="text-center">
							<a href="/" class="btn btn-secondary">돌아가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>