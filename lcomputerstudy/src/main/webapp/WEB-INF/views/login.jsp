<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6 col-lg-4">
				<div class="card shadow-sm">
					<div class="card-body p-4">
						<h2 class="text-center mb-4">로그인</h2>
						<form action="/loginPro" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="mb-3">
								<input type="text" class="form-control" name="username" placeholder="아이디를 입력해주세요">
							</div>
							<div class="mb-3">
								<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" id="remember_me" name="remember-me">
								<label class="form-check-label" for="remember_me">로그인 상태 유지</label>
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">로그인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>