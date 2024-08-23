<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h1 {
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .button {
            padding: 10px 15px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            font-size: 16px;
            display: inline-block;
            margin-bottom: 20px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
   		}
    	.logout-button {
        padding: 10px 15px;
        text-decoration: none;
        color: #fff;
        background-color: #dc3545;
        border-radius: 5px;
        font-size: 16px;
   		}
    	.logout-button:hover {
        background-color: #c82333;
   		}
    </style>
</head>
<body>
    <div class="container">
    	<div class="header">
    		<h1>게시물 목록</h1>
    		<a href="/logout" class="logout-button">로그아웃</a>	
    	</div>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일시</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.bId}</td>
                        <td><a href="/detailBoard?bId=${item.bId }">${item.bTitle}</a></td>
                        <td>${item.bWriter}</td>
                        <td>${item.bDateTime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/insertBoard" class="button">새 게시물 작성하기</a>
    </div>
</body>
</html>