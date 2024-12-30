<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
	.table-rounded {
		border-radius:0.5rem;
		overflow: hidden;	
	}
</style>
<script>
	function confirmUpdate() {
		return confirm("게시물을 수정하시겠습니까?");
	}
	
	function cancleEdit() {
		var check = confirm("수정을 취소합니까?");
		
		if(check) {
			location.href="/detailBoard?bId=${board.bId}";
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container-md mt-4" style="max-width:900px">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h3>게시물 수정</h3>
		</div>
	<!-- 현재 수정했던 시간 실시간 반영하기 -->
	<form action="/updateBoard?bId=${board.bId}" method="post" onsubmit="return confirmUpdate()">
	<input type="hidden" name="bDateTime" value="${bDateTime}">
        <table class="table table-rounded">
            <tr>
                <td class="fw-bold bg-info-subtle align-middle text-center">
                    <label for="bTitle" class="form-label form-info">제목</label>
                </td>
                <td class="bg-light">
                    <input type="text" class="form-control" id="bTitle" name="bTitle" 
                           value="${board.bTitle}" required>
                </td>
            </tr>
            <tr>
                <td class="fw-bold bg-info-subtle align-middle text-center">
                    <label for="bContent" class="form-label">내용</label>
                </td>
                <td class="bg-light">
                    <textarea class="form-control" id="bContent" name="bContent" 
                              style="height: 150px; resize: none; white-space: pre-wrap;" required>${board.bContent}</textarea>
                </td>
            </tr>
        </table>
        <button type="submit" class="btn btn-primary btn-md">게시물 수정</button>
        <button type="button" class="btn btn-outline-secondary btn-md" 
                onclick="cancleEdit()">취소</button>
    </form>
    </div>
</body>
</html>