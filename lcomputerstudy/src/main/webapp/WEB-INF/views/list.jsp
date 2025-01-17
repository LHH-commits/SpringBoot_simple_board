<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
	.table-fixed {
		table-layout: fixed;
		width: 100%;
	}
	.table-fixed th {
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.table-info {
		border-bottom: 2px solid gray;
	}
	.table-rounded {
		border-radius: 0.5rem;
		overflow: hidden;
	}
	.table-bordered {
		border: border-primary;
	}
	.table-bordered th,
	.table-bordered td {
		border: none;
	}
</style>
<script>
    function goToList() {
        window.location.href = "/list"; // 전체 리스트로 이동
    }
</script>
</head>
<body>
    <div class="container-md mt-4" style="max-width:900px">
    	<div class="d-flex justify-content-between align-items-center mb-4">
    		<h1 class="h3" onclick="goToList()" style="cursor: pointer;">게시물 목록</h1>
    		<a href="/logout" class="btn btn-danger btn-sm">로그아웃</a>	
    	</div>
	
    <table class="table table-hover table-fixed table-rounded">
        <thead class="table-info">
            <tr>
                <th style="width: 5%">번호</th>
                <th style="width: 20%">제목</th>   
                <th style="width: 8%">작성자</th>
                <th style="width: 10%">작성일시</th>
                <th style="width: 5%">조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td>${item.bId}</td>
                    <td><a href="/detailBoard?bId=${item.bId}&page=${pagination.page}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}"
                    class="text-decoration-none">${item.bTitle}</a></td>
                    <td>${item.bWriter}</td>
                    <td>${item.bDateTime}</td>
                    <td>${item.bViews}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <nav>
		<ul class="pagination justify-content-center">
		    <c:if test="${pagination.prevPage > 0}">
		    	<li class="page-item">
		        	<a class="page-link" href="/list?page=${pagination.prevPage}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}">이전</a>
		    </c:if>
		    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
		    	<li class="page-item ${i == pagination.page ? 'active' : ''}">
		        	<a class="page-link" href="/list?page=${i}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}">${i}</a>
		        </li>
		    </c:forEach>
		    <c:if test="${pagination.nextPage <= pagination.lastPage}">
		    	<li class="page-item">
		        	<a class="page-link" href="/list?page=${pagination.nextPage}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}">다음</a>
		    	</li>
		    </c:if>
		</ul>
	</nav>
		<div class="d-flex justify-content-between align-items-center mb-4">
	        <a href="/insertBoard" class="btn btn-primary btn-md">새 게시물 작성하기</a>
	        <form action="/list" method="get" class="d-flex mb-3">
			    <select name="searchOption" class="form-select form-select-sm me-2" style="width:180px">
			        <option value="title" ${searchparam.searchOption == 'title' ? 'selected' : ''}>제목으로 검색</option>
			        <option value="content" ${searchparam.searchOption == 'content' ? 'selected' : ''}>내용으로 검색</option>
			        <option value="titleContent" ${searchparam.searchOption == 'titleContent' ? 'selected' : ''}>제목+내용으로 검색</option>
			    </select>
		    	<input type="text" name="searchKeyword" class="form-control form-control-sm me-2" style="width:200px" value="${searchparam.searchKeyword != null ? searchparam.searchKeyword : ''}" placeholder="검색어 입력">
		   		<button type="submit" class="btn btn-primary btn-sm">검색</button>
			</form>
		</div>
    </div>
</body>
</html>