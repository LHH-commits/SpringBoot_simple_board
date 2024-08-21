<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
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
	<h1>게시물 수정</h1>
	<!-- 현재 수정했던 시간 실시간 반영하기 -->
	<form action="/updateBoard" method="post" onsubmit="return confirmUpdate()">
	<input type="hidden" name="bId" value="${bId }">
	<input type="hidden" name="bDateTime" value="${bDateTime}">
        <table>
            <tr>
                <td>제목:</td>
                <td><input type="text" name="bTitle" value="${board.bTitle }" required/></td>
            </tr>
            <tr>
                <td>내용:</td>
                <td><textarea name="bContent" required>${board.bContent }</textarea></td>
            </tr>
        </table>
        <button type="submit">게시물 수정</button>
        <button type="button" onclick="cancleEdit()">취소</button>
    </form>
</body>
</html>