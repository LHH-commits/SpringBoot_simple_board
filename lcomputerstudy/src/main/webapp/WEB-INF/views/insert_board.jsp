<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h1>게시물 작성</h1>
	
	<!-- 현재 로그인한 사용자의 정보를 가져오기 -->
	<sec:authentication property="principal" var="principal"/>
	<c:set var="uName" value="${principal.uName }"/>
	
	<form action="/insertBoard" method="post">
	<input type="hidden" name="bWriter" value="${uName }">
        <table>
            <tr>
                <td>제목:</td>
                <td><input type="text" name="bTitle" required/></td>
            </tr>
            <tr>
                <td>내용:</td>
                <td><textarea name="bContent" required></textarea></td>
            </tr>
        </table>
        <button type="submit">게시물 작성</button>
    </form>
</body>
</html>